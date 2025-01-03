import 'package:casal_rico/data/repositories/auth/auth_repository_imp.dart';
import 'package:casal_rico/data/services/auth/auth_service.dart';
import 'package:casal_rico/ui/view_model/auth_gate_view_model.dart';

import '../../data/repositories/auth/auth_repository.dart';

class AuthGateInjection {
  static AuthGateViewModel instance = AuthGateViewModel(AuthRepositoryImp(authService:AuthService()));
  }

class LoginInjection{
  static AuthRepository instance = AuthRepositoryImp(authService:AuthService());
}