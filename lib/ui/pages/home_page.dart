import 'package:casal_rico/ui/view_model/login_view_model.dart';
import 'package:casal_rico/ui/widgets/app_bar_widget.dart';
import 'package:casal_rico/ui/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginViewModel loginViewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBarWidget(title: "Resumo"),
      drawer: DrawerWidget(),
    );
  }
}
