import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:casal_rico/data/repositories/auth/auth_repository.dart';

class AuthGateViewModel extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthGateViewModel(this.authRepository) {
    _initialize();
  }

  bool _isLoading = false;
  bool _goToLogin = false;

  bool get goToLogin => _goToLogin;

  bool get isLoading => _isLoading;
  
  StreamSubscription<AuthState>? _authSubscription;

  void _initialize() {
    _isLoading = true;
    notifyListeners();

    _authSubscription = authRepository.onAuthStateChange().listen((AuthState state) {
      if (state.session != null) {
        _goToLogin = false; 
      } else {
        _goToLogin = true; 
      }
      notifyListeners(); 
    });

    _isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }
}
