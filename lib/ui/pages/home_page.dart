import 'package:casal_rico/ui/view_model/login_view_model.dart';
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
      backgroundColor: Colors.deepPurple[500],
      appBar: AppBar(
        leading: Icon(Icons.monetization_on, color: Colors.white,),
        title: const Text('HomePage',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple[500],
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: (){
            loginViewModel.logout();
            Navigator.pushNamed(context, '/login');
          }, icon: const Icon(Icons.logout, color: Colors.white,),)
        ],
      ),
    );
  }
}