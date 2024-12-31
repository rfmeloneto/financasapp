import 'package:casal_rico/data/services/auth/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  final AuthService authService;
  AuthRepository(this.authService);
  // Widget authPageDirection({required Widget loginPage, required Widget homePage});
  Stream<AuthState> onAuthStateChange();
  Future<AuthResponse> login(String email, String password);
  Future<void> logOut();
}