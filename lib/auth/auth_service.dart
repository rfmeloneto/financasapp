import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService{
  final supabase = Supabase.instance.client;

  Future<AuthResponse> login(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password
    );
    return response;
  }

  Future<AuthResponse> signUp(String email, String password) async {
    final response = await supabase.auth.signUp(
      email: email,
      password: password
    );
    return response;
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
    
  }

  Future<Session?> getSession() async {
    return supabase.auth.currentSession;
  }

  Future<User?> getUser() async {
    return supabase.auth.currentUser;
  }
}