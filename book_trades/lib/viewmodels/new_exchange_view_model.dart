import 'package:flutter/material.dart';
import 'package:projeto2/repository/exchange_data.dart';
import 'package:projeto2/repository/exchange_repository.dart';
import 'package:projeto2/repository/floor/login_try_dao.dart';

class NewExchangeViewModel extends ChangeNotifier {
  final ExchangeRepository _repository;
  final SavedLoginDao _savedLoginDao;

  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController suggestionsController = TextEditingController();

  String? _selectedBookState;
  bool _onlySuggestionsSelected = false;
  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  String? get selectedBookState => _selectedBookState;
  bool get onlySuggestionsSelected => _onlySuggestionsSelected;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get successMessage => _successMessage;

  final List<String> _availableGenres = [
    'Fantasia',
    'Ficção científica',
    'Mistério',
    'Romance',
    'Terror',
    'Não ficção',
  ];
  List<String> _selectedGenres = [];

  List<String> get availableGenres => _availableGenres;
  List<String> get selectedGenres => _selectedGenres;

  NewExchangeViewModel(this._repository, this._savedLoginDao);

  void setSelectedBookState(String? state) {
    _selectedBookState = state;
    notifyListeners();
  }

  void setOnlySuggestionsSelected(bool? value) {
    _onlySuggestionsSelected = value ?? false;
    if (_onlySuggestionsSelected) {
      _selectedGenres = [];
    }
    notifyListeners();
  }

  void toggleGenre(String genre, bool? isSelected) {
    if (isSelected ?? false) {
      if (!_selectedGenres.contains(genre)) {
        _selectedGenres.add(genre);
      }
    } else {
      _selectedGenres.remove(genre);
    }
    notifyListeners();
  }

  Future<void> registerExchange() async {
    _isLoading = true;
    _errorMessage = null;
    _successMessage = null;
    notifyListeners();

    try {
      final String? userIdString = await _savedLoginDao.getUserId();
      if (userIdString == null) {
        _errorMessage = "ID do usuário não encontrado. Por favor, faça login.";
        notifyListeners();
        return;
      }
      final int solicitorId = int.parse(userIdString);

      if (bookNameController.text.isEmpty) {
        throw Exception("bookNameRequired");
      }
      if (_selectedBookState == null) {
        throw Exception("bookStateRequired");
      }
      if (_onlySuggestionsSelected && suggestionsController.text.isEmpty) {
        throw Exception("suggestionsRequired");
      }
      if (!_onlySuggestionsSelected && _selectedGenres.isEmpty && suggestionsController.text.isEmpty) {
        throw Exception("genresOrSuggestionsRequired");
      }

      String searchingForValue;
      String sugestedValue = suggestionsController.text.trim();

      if (_onlySuggestionsSelected) {
        searchingForValue = "Apenas sugestões";
      } else {
        searchingForValue = _selectedGenres.join(', ');
        if (searchingForValue.isEmpty) {
          searchingForValue = "Qualquer gênero";
        }
      }

      final newExchange = Exchange(
        exchangeId: 0,
        solicitorId: solicitorId,
        bookName: bookNameController.text.trim(),
        bookState: _selectedBookState!,
        searchingFor: searchingForValue,
        sugested: sugestedValue,
        offerings: [],
      );

      await _repository.addExchange(newExchange);
      _successMessage = "exchangeRegisteredSuccess";
      _resetForm();

    } catch (e) {
      if (e.toString().contains("bookNameRequired")) {
        _errorMessage = "validationRequiredField";
      } else if (e.toString().contains("bookStateRequired")) {
        _errorMessage = "validationSelectState";
      } else if (e.toString().contains("suggestionsRequired")) {
        _errorMessage = "validationRequiredField";
      } else if (e.toString().contains("genresOrSuggestionsRequired")) {
        _errorMessage = "Por favor, selecione pelo menos um gênero ou preencha as sugestões.";
      }
      else {
        _errorMessage = "exchangeRegisteredError";
        debugPrint("Erro ao cadastrar troca: $e");
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _resetForm() {
    bookNameController.clear();
    suggestionsController.clear();
    _selectedBookState = null;
    _onlySuggestionsSelected = false;
    _selectedGenres = [];
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
    bookNameController.dispose();
    suggestionsController.dispose();
    super.dispose();
  }
}