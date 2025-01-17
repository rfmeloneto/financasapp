import 'package:flutter/material.dart';

import '../../data/repositories/auth/auth_repository.dart';
import '../injections/get_injection.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository authRepository = LoginInjection.instance;

  bool _isLoading = false;
  bool _success = false;

  bool get success => _success;
  bool get isLoading => _isLoading;

  void login(String email, String password) {
    _isLoading = true;
    notifyListeners();
    authRepository.login(email, password).then((response) {
      _isLoading = false;
      _success = true;
      notifyListeners();
    }).catchError((error) {
      _isLoading = false;
      _success = false;
      notifyListeners();
    });
  
  }

  void logout() {
    authRepository.logOut();
    notifyListeners();

  }
  }