import 'package:flutter/material.dart';
import 'package:projeto2/repository/floor/login_try.dart';
import 'package:projeto2/repository/login_try_repository.dart';
import 'package:projeto2/repository/user_repository.dart';

import '../l10n/app_localizations.dart';
import '../utils/navigation_bar.dart';

class MainViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final SavedLoginRepository savedLoginRepository;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String usernameError = "";
  String passwordError = "";

  bool isLoading = false;

  MainViewModel(this.userRepository, this.savedLoginRepository);

  Future<void> performLogin(void Function() onSuccess) async {
    usernameError = "";
    passwordError = "";

    if (usernameController.text == "") {
      usernameError = "empty";
      notifyListeners();
      return;
    }

    if (passwordController.text == "") {
      passwordError = "empty";
      notifyListeners();
      return;
    }

    isLoading = true;
    notifyListeners();

    String id;
    String status;

    (status, id) = await userRepository.login(
      usernameController.text,
      passwordController.text,
    );

    if (status == "failed") {
      usernameError = "wrong_email_or_pass";
      passwordError = "wrong_email_or_pass";
    } else if (status != "success") {
      usernameError = "error";
      passwordError = "error";
    }

    isLoading = false;
    notifyListeners();

    if (status == "success") {
      final savedLogin = SavedLogin(id: id, email: usernameController.text);
      await savedLoginRepository.insert(savedLogin);
      clearLogin();
      onSuccess();
    }
  }

  void clearLogin() {
    usernameController.clear();
    passwordController.clear();
    usernameError = "";
    passwordError = "";
    notifyListeners();
  }

  void createAccount() {
    // todo
  }

  Future<void> checkSavedLogin(BuildContext context) async {
    final saved = await savedLoginRepository.getSaved();
    if (saved != null) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => CustomNavBar()));
    }
  }
}
