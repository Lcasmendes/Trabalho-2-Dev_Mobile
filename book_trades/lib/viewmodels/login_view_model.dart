import 'package:flutter/material.dart';
import 'package:projeto2/repository/floor/login_try.dart';
import 'package:projeto2/repository/login_try_repository.dart';
import 'package:projeto2/repository/user_repository.dart';
import 'package:projeto2/ui/login/form_error.dart';
import 'package:projeto2/ui/main/main_page.dart';

class MainViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final SavedLoginRepository savedLoginRepository;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  FormError _usernameError = FormError.none;
  FormError _passwordError = FormError.none;
  String? _customError;

  bool _isLoading = false;

  MainViewModel(this.userRepository, this.savedLoginRepository);

  FormError get usernameError => _usernameError;
  FormError get passwordError => _passwordError;
  String? get customError => _customError;
  bool get isLoading => _isLoading;

  Future<void> performLogin(void Function() onSuccess) async {
    _usernameError = FormError.none;
    _passwordError = FormError.none;
    _customError = null;

    if (usernameController.text == "") {
      _usernameError = FormError.emptyField;
      notifyListeners();
      return;
    }

    if (passwordController.text == "") {
      _passwordError = FormError.emptyField;
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    String id;
    String status;
    String username;

    (status, id, username) = await userRepository.login(
      usernameController.text,
      passwordController.text,
    );

    if (status == "wrong_username") {
      _usernameError = FormError.wrongUsername;
    } else if (status == "wrong_password") {
      _passwordError = FormError.wrongPassword;
    } else if (status != "success") {
      _usernameError = FormError.custom;
      _customError = "Error: $status";
    }

    _isLoading = false;
    notifyListeners();

    if (status == "success") {
      final savedLogin = SavedLogin(id: id, email: usernameController.text);
      await savedLoginRepository.insert(savedLogin);
      onSuccess();
    }
  }

  void clearLogin() {
    usernameController.clear();
    passwordController.clear();
    _usernameError = FormError.none;
    _passwordError = FormError.none;
    _customError = null;
    notifyListeners();
  }

  Future<void> checkSavedLogin(BuildContext context) async {
    final saved = await savedLoginRepository.getSaved();
    if (saved != null) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const MainPage()));
    }
  }
}
