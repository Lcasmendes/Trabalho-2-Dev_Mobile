import 'package:flutter/material.dart';
import 'package:projeto2/repository/exchange_data.dart';
import 'package:projeto2/repository/exchange_repository.dart';
import 'package:projeto2/repository/floor/login_try_dao.dart';
import 'package:projeto2/ui/login/login_page.dart';
import 'package:provider/provider.dart';

import '../repository/login_try_repository.dart';
import '../ui/my_exchanges_details/my_exchanges_details_page.dart';
import 'my_exchanges_details_view_model.dart';

class MyExchangesViewModel extends ChangeNotifier {
  final ExchangeRepository _repository;
  final SavedLoginDao _savedLoginDao;
  final SavedLoginRepository savedLoginRepository;

  List<Exchange> _allExchanges = [];
  List<Exchange> exchanges = [];
  bool isLoading = false;
  String? errorMessage;
  String currentSearchQuery = '';

  MyExchangesViewModel(this._repository, this._savedLoginDao, this.savedLoginRepository);

  Future<void> fetchExchanges() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final String? userIdString = await _savedLoginDao.getUserId();
      if (userIdString == null) {
        errorMessage = "ID do usuário não encontrado no armazenamento local (Floor). Por favor, faça login.";
        _allExchanges = [];
        exchanges = [];
        debugPrint(errorMessage);
        notifyListeners();
        return;
      }
      final int loggedInUserId = int.parse(userIdString);

      final fetchedExchanges = await _repository.getAllExchanges();

      _allExchanges = fetchedExchanges.where((exchange) => exchange.solicitorId == loggedInUserId).toList();

      _applySearchFilter();

    } catch (e) {
      _allExchanges = [];
      exchanges = [];
      errorMessage = "Erro ao carregar e filtrar trocas: $e";
      debugPrint("Erro ao carregar e filtrar trocas: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setSearchQuery(String query) {
    currentSearchQuery = query;
    _applySearchFilter();
    notifyListeners();
  }

  void _applySearchFilter() {
    if (currentSearchQuery.isEmpty) {
      exchanges = List.from(_allExchanges);
    } else {
      final queryLower = currentSearchQuery.toLowerCase();
      exchanges = _allExchanges.where((exchange) {
        return exchange.bookName.toLowerCase().contains(queryLower) ||
            exchange.bookState.toLowerCase().contains(queryLower) ||
            exchange.searchingFor.toLowerCase().contains(queryLower) ||
            exchange.sugested.toLowerCase().contains(queryLower) ||
            exchange.offerings.any((offering) =>
            offering.book.toLowerCase().contains(queryLower) ||
                offering.bookState.toLowerCase().contains(queryLower));
      }).toList();
    }
  }

  Future<void> performLogout(BuildContext context) async {
    // delete saved login
    await savedLoginRepository.deleteAll();
    // navigate to login
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
  }

  void _navigateToExchangeDetails(BuildContext context, Exchange selectedExchange) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => MyExchangesDetailsViewModel(
            context.read<ExchangeRepository>(),
            context.read<SavedLoginDao>(),
            selectedExchange,
          ),
          child: MyExchangesDetailsPage(exchange: selectedExchange),
        ),
      ),
    );
  }
}