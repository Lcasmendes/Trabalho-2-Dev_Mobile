import 'package:flutter/material.dart';
import 'package:projeto2/repository/exchange_data.dart';
import 'package:projeto2/repository/exchange_repository.dart';

class ExchangesViewModel extends ChangeNotifier {
  final ExchangeRepository _repository;

  List<Exchange> _exchanges = [];
  bool _isLoading = false;

  List<Exchange> get exchanges => _exchanges;
  bool get isLoading => _isLoading;

  ExchangesViewModel(this._repository) {
    loadExchanges();
  }

  Future<void> loadExchanges() async {
    _isLoading = true;
    notifyListeners();

    try {
      _exchanges = await _repository.getAllExchanges();
    } catch (e) {
      _exchanges = [];
      debugPrint("Erro ao carregar trocas: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
