import 'package:casal_rico/data/repositories/api/api_repository.dart';
import 'package:casal_rico/data/repositories/api/api_repository_imp.dart';
import 'package:casal_rico/data/services/api/api_service.dart';
import 'package:casal_rico/ui/pages/auth_gate.dart';
import 'package:casal_rico/ui/pages/home_page.dart';
import 'package:casal_rico/ui/pages/login_page.dart';
import 'package:casal_rico/ui/view_model/expenses_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'ui/pages/expense_category_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['URL']!,
    anonKey: dotenv.env['API_KEY']!,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiService>(create: (context) => ApiService()),
        Provider<ApiRepository>(create: (context) => ApiRepositoryImp(apiService: context.read<ApiService>())),
        ChangeNotifierProvider<ExpensesViewModel>(create: (context) => ExpensesViewModel(apiRepository: context.read<ApiRepository>())),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => AuthGate(loginPage: LoginPage(), homePage: HomePage(),),
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          '/categorias-despesas': (context) => ExpenseCategoryPage(),},
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
