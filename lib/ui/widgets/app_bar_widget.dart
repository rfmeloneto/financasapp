import 'package:flutter/material.dart';

import '../view_model/login_view_model.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarWidget({required this.title, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = LoginViewModel();
    return AppBar(    
        iconTheme: IconThemeData(color: Colors.white), 
        title: Text(
        title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple[700],
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              loginViewModel.logout();
              Navigator.pushNamed(context, '/login');
            },
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
        
      );
  }
}