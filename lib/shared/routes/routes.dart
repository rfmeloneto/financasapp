import 'package:casal_rico/ui/pages/auth_gate.dart';
import 'package:casal_rico/ui/pages/expense_category_page.dart';
import 'package:casal_rico/ui/pages/home_page.dart';
import 'package:casal_rico/ui/pages/incoming_category_page.dart';
import 'package:casal_rico/ui/pages/login_page.dart';
import 'package:flutter/material.dart';


class Routes{

  static Map<String,WidgetBuilder> routes = {
          '/': (context) => AuthGate(loginPage: LoginPage(), homePage: HomePage(),),
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          '/categorias-despesas': (context) => ExpenseCategoryPage(),
          '/categorias-receitas': (context) => IncomeCategoryPage(),};
  
}
