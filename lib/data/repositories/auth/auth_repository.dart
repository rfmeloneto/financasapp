import 'package:casal_rico/data/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

abstract class AuthRepository {
  final AuthService authService;
  AuthRepository(this.authService);
  Widget authPageDirection({required Widget loginPage, required Widget homePage});
}