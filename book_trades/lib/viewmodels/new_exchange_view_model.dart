import 'package:flutter/material.dart';
import 'package:projeto2/repository/exchange_data.dart';
import 'package:projeto2/repository/exchange_repository.dart';
import 'package:projeto2/repository/floor/login_try_dao.dart';
import '../l10n/app_localizations.dart';
import '../repository/login_try_repository.dart';
import '../ui/login/login_page.dart';

class NewExchangeViewModel extends ChangeNotifier {
  final ExchangeRepository _repository;
  final SavedLoginDao _savedLoginDao;
  final SavedLoginRepository savedLoginRepository;

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

  NewExchangeViewModel(this._repository, this._savedLoginDao, this.savedLoginRepository, AppLocalizations locals);

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

  Future<void> registerExchange(AppLocalizations locals) async {
    _isLoading = true;
    _errorMessage = null;
    _successMessage = null;
    notifyListeners(); // Notifica que o carregamento começou

    try {
      final String? userIdString = await _savedLoginDao.getUserId();
      if (userIdString == null) {
        throw Exception("userIdNotFound");
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

      final allExchanges = await _repository.getAllExchanges();
      int nextExchangeId = 1;
      if (allExchanges.isNotEmpty) {
        nextExchangeId = allExchanges
            .map((e) => e.exchangeId ?? 0)
            .reduce((a, b) => a > b ? a : b) +
            1;
      }

      String searchingForValue;
      String sugestedValue = suggestionsController.text.trim();

      if (_onlySuggestionsSelected) {
        searchingForValue = locals.onlySuggestions;
      } else {
        searchingForValue = _selectedGenres.join(', ');
        if (searchingForValue.isEmpty) {
          searchingForValue = locals.anyGenre;
        }
      }

      final newExchange = Exchange(
        exchangeId: nextExchangeId,
        solicitorId: solicitorId,
        bookName: bookNameController.text.trim(),
        bookState: _selectedBookState!,
        searchingFor: searchingForValue,
        sugested: sugestedValue,
        offerings: [],
      );

      await _repository.addExchange(newExchange);
      _successMessage = "exchangeRegisteredSuccess";
      _isLoading = false; // Define como false no sucesso
      notifyListeners(); // Notifica a conclusão e o sucesso

      Future.delayed(const Duration(seconds: 2), () {
        _resetForm();
      });

    } catch (e) {
      if (e is Exception && e.toString().contains("userIdNotFound")) {
        _errorMessage = "userIdNotFound";
      } else if (e is Exception && e.toString().contains("bookNameRequired")) {
        _errorMessage = "bookNameRequired";
      } else if (e is Exception && e.toString().contains("bookStateRequired")) {
        _errorMessage = "bookStateRequired";
      } else if (e is Exception && e.toString().contains("suggestionsRequired")) {
        _errorMessage = "suggestionsRequired";
      } else if (e is Exception && e.toString().contains("genresOrSuggestionsRequired")) {
        _errorMessage = "genresOrSuggestionsRequired";
      } else {
        _errorMessage = "exchangeRegisteredError";
      }
      debugPrint("Erro detalhado ao cadastrar troca: $e");
      _isLoading = false; // Define como false no erro
      notifyListeners(); // Notifica a conclusão e o erro
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

  Future<void> performLogout(BuildContext context) async {
    await savedLoginRepository.deleteAll();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
  }
}