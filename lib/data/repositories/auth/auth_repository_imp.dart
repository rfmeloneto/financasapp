import 'package:casal_rico/data/repositories/auth/auth_repository.dart';
import 'package:casal_rico/data/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImp implements AuthRepository{
  @override
  final AuthService authService;
  AuthRepositoryImp({required this.authService});
  @override
  Widget authPageDirection({required Widget loginPage, required Widget homePage}) {
    Session? session;
    return StreamBuilder<AuthState>(
      stream: authService.onAuthStateChange(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.deepPurple[500],
            body: const Center(
              child: CircularProgressIndicator(),
            ));
        }

        session = snapshot.hasData ? snapshot.data!.session : null;

        return session != null ? homePage : loginPage;
      },
    );

  }
}