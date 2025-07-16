import 'package:flutter/material.dart';
import 'package:projeto2/repository/exchange_data.dart';
import 'package:projeto2/repository/exchange_repository.dart';
import 'package:projeto2/repository/floor/login_try_dao.dart';
import '../repository/offering_data.dart';

class MyExchangesDetailsViewModel extends ChangeNotifier {
  final ExchangeRepository _exchangeRepository;
  final SavedLoginDao _savedLoginDao;
  final Exchange chosenExchange;

  List<Exchange> _allExchanges = [];
  List<Exchange> exchanges = [];
  List<Offering> offerings = [];

  TextEditingController offeringBookNameController = TextEditingController();
  String? selectedOfferingBookState;

  bool isLoading = false;

  MyExchangesDetailsViewModel(this._exchangeRepository, this._savedLoginDao,
      this.chosenExchange);

  Future<void> fetchExchanges() async {
    final fetchedExchanges = await _exchangeRepository.getAllExchanges();

    _allExchanges = fetchedExchanges.where((exchange) => exchange.exchangeId == chosenExchange.exchangeId).toList();

    exchanges = List.from(_allExchanges);

    offerings = exchanges[0].offerings;
    print("Len ${offerings.length}");
    notifyListeners();
  }
}