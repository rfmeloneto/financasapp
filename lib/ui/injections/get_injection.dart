import 'package:casal_rico/data/repositories/api/api_repository.dart';
import 'package:casal_rico/data/repositories/auth/auth_repository_imp.dart';
import 'package:casal_rico/data/services/auth/auth_service.dart';
import 'package:casal_rico/ui/view_model/auth_gate_view_model.dart';
import 'package:casal_rico/ui/view_model/expenses_view_model.dart';

import '../../data/repositories/api/api_repository_imp.dart';
import '../../data/repositories/auth/auth_repository.dart';
import '../../data/services/api/api_service.dart';

class AuthGateInjection {
  static AuthGateViewModel instance = AuthGateViewModel(AuthRepositoryImp(authService:AuthService()));
  }

class LoginInjection{
  static AuthRepository instance = AuthRepositoryImp(authService:AuthService());
}

class ExpenseCategoryInjection{
  static ExpensesViewModel instance = ExpensesViewModel(apiRepository: ApiRepositoryImp(apiService: ApiService()));
}