import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[500],
      appBar: AppBar(
        leading: Icon(Icons.monetization_on, color: Colors.white,),
        title: const Text('Casal Rico',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.deepPurple[500],
        centerTitle: true,
        elevation: 0.0,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email',labelStyle: TextStyle(color: Colors.white), border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(20))), ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password',labelStyle: TextStyle(color: Colors.white), border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(20))),),
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  // TODO: Implement login logic
                },  
                    ),
            ),],),),
    );
  }
}