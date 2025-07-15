import 'package:flutter/material.dart';
import 'package:projeto2/repository/exchange_data.dart';
import 'package:projeto2/repository/exchange_repository.dart';
import 'package:projeto2/repository/floor/login_try_dao.dart';
import '../repository/offering_data.dart';

class ExchangeDetailsViewModel extends ChangeNotifier {
  final ExchangeRepository _exchangeRepository;
  final SavedLoginDao _savedLoginDao;
  final Exchange _exchange;

  TextEditingController offeringBookNameController = TextEditingController();
  String? _selectedOfferingBookState;

  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  String? get selectedOfferingBookState => _selectedOfferingBookState;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get successMessage => _successMessage;

  Exchange get exchange => _exchange;

  ExchangeDetailsViewModel(this._exchangeRepository, this._savedLoginDao, this._exchange);

  void setSelectedOfferingBookState(String? state) {
    _selectedOfferingBookState = state;
    notifyListeners();
  }

  Future<void> makeOffer() async {
    _isLoading = true;
    _errorMessage = null;
    _successMessage = null;
    notifyListeners();

    try {
      final String? userIdString = await _savedLoginDao.getUserId();
      if (userIdString == null) {
        throw Exception("userNotLoggedIn");
      }
      final int offererId = int.parse(userIdString);

      if (offeringBookNameController.text.trim().isEmpty) {
        throw Exception("offeringBookNameRequired");
      }
      if (_selectedOfferingBookState == null) {
        throw Exception("offeringBookStateRequired");
      }

      final newOffering = Offering(
        userId: offererId,
        book: offeringBookNameController.text.trim(),
        bookState: _selectedOfferingBookState!,
      );

      final List<Offering> updatedOfferings = List.from(_exchange.offerings)..add(newOffering);

      final Exchange updatedExchange = Exchange(
        exchangeId: _exchange.exchangeId,
        solicitorId: _exchange.solicitorId,
        bookName: _exchange.bookName,
        bookState: _exchange.bookState,
        searchingFor: _exchange.searchingFor,
        sugested: _exchange.sugested,
        id: _exchange.id,
        offerings: updatedOfferings,
      );

      await _exchangeRepository.updateExchange(updatedExchange);

      _exchange.offerings.clear();
      _exchange.offerings.addAll(updatedOfferings);

      _successMessage = "offerMadeSuccessfully";
      notifyListeners();

      Future.delayed(const Duration(seconds: 2), () {
        _resetOfferForm();
      });

    } catch (e) {
      if (e.toString().contains("userNotLoggedIn")) {
        _errorMessage = "userNotLoggedIn";
      } else if (e.toString().contains("offeringBookNameRequired")) {
        _errorMessage = "offeringBookNameRequired";
      } else if (e.toString().contains("offeringBookStateRequired")) {
        _errorMessage = "offeringBookStateRequired";
      } else {
        _errorMessage = "failedToMakeOffer";
      }
      debugPrint("Error making offer: $e");
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _resetOfferForm() {
    offeringBookNameController.clear();
    _selectedOfferingBookState = null;
    _errorMessage = null;
    _successMessage = null;
    notifyListeners();
  }

  void clearSuccessMessage() {
    _successMessage = null;
    notifyListeners();
  }

  void clearErrorMessage() {
    _errorMessage = null;
    notifyListeners();
  }

  @override
  void dispose() {
    offeringBookNameController.dispose();
    super.dispose();
  }
}