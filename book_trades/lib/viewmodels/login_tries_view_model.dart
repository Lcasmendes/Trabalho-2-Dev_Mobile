import 'package:flutter/material.dart';
import 'package:projeto2/repository/floor/login_try.dart';
import 'package:projeto2/repository/login_try_repository.dart';

class LoginTriesViewModel extends ChangeNotifier {

  final SavedLoginRepository savedLoginRepository;

  List<SavedLogin> _loginTries = [];

  get loginTries => _loginTries;

  LoginTriesViewModel(this.savedLoginRepository) {
    initialize();
  }

  void initialize() async {
    savedLoginRepository.getAllInStream().listen((List<SavedLogin> tries) {
      _loginTries = tries;
      notifyListeners();
    });
  }
}