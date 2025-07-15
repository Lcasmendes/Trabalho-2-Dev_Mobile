import 'package:flutter/material.dart';
import 'package:projeto2/repository/exchange_data.dart';
import 'package:projeto2/repository/exchange_repository.dart';
import 'package:projeto2/repository/floor/login_try_dao.dart';

import '../repository/login_try_repository.dart';
import '../ui/login/login_page.dart';

class ExchangesViewModel extends ChangeNotifier {
  final ExchangeRepository _repository;
  final SavedLoginDao _savedLoginDao;
  final SavedLoginRepository savedLoginRepository;

  List<Exchange> _allExchanges = [];
  List<Exchange> _displayedExchanges = [];
  bool _isLoading = false;
  String? _errorMessage;
  String _currentSearchQuery = '';

  List<Exchange> get exchanges => _displayedExchanges;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get currentSearchQuery => _currentSearchQuery;

  ExchangesViewModel(this._repository, this._savedLoginDao, this.savedLoginRepository);

  Future<void> fetchExchanges() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final String? userIdString = await _savedLoginDao.getUserId();
      if (userIdString == null) {
        _errorMessage = "ID do usuário não encontrado no armazenamento local (Floor). Por favor, faça login.";
        _allExchanges = [];
        _displayedExchanges = [];
        debugPrint(_errorMessage);
        notifyListeners();
        return;
      }
      final int loggedInUserId = int.parse(userIdString);

      final fetchedExchanges = await _repository.getAllExchanges();

      _allExchanges = fetchedExchanges.where((exchange) => exchange.solicitorId != loggedInUserId).toList();

      _applySearchFilter();

    } catch (e) {
      _allExchanges = [];
      _displayedExchanges = [];
      _errorMessage = "Erro ao carregar e filtrar trocas: $e";
      debugPrint("Erro ao carregar e filtrar trocas: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setSearchQuery(String query) {
    _currentSearchQuery = query;
    _applySearchFilter();
    notifyListeners();
  }

  void _applySearchFilter() {
    if (_currentSearchQuery.isEmpty) {
      _displayedExchanges = List.from(_allExchanges);
    } else {
      final queryLower = _currentSearchQuery.toLowerCase();
      _displayedExchanges = _allExchanges.where((exchange) {
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
}