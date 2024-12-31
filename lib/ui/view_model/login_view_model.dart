import 'package:casal_rico/data/repositories/auth/auth_repository.dart';
import 'package:casal_rico/data/repositories/auth/auth_repository_imp.dart';
import 'package:casal_rico/data/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository authRepository = AuthRepositoryImp(authService:AuthService());

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