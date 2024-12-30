import 'package:casal_rico/data/repositories/auth/auth_repository.dart';
import 'package:casal_rico/data/services/auth/auth_service.dart';
import 'package:casal_rico/ui/pages/home_page.dart';
import 'package:casal_rico/ui/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/auth/auth_repository_imp.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  late AuthRepository authRepository;
  AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authRepository = AuthRepositoryImp(authService: authService);
    
  }
  @override
  Widget build(BuildContext context) {
    return authRepository.authPageDirection(
      loginPage: const LoginPage(),
      homePage: const HomePage()
    );
  }
}

