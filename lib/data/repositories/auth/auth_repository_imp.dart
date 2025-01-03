import 'package:casal_rico/data/repositories/auth/auth_repository.dart';
import 'package:casal_rico/data/services/auth/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImp implements AuthRepository{
  @override
  final AuthService authService;
  AuthRepositoryImp({required this.authService});
  @override
  Stream<AuthState> onAuthStateChange() {
    return authService.onAuthStateChange();
  }

  @override
  Future<AuthResponse> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<void> logOut() {
    return authService.logout();
  }
  
  
}