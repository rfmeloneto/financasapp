import 'package:casal_rico/ui/injections/auth_gate_injection.dart';
import 'package:flutter/material.dart';
import '../view_model/auth_gate_view_model.dart';

class AuthGate extends StatefulWidget {
  final Widget loginPage;
  final Widget homePage;
  final AuthGateViewModel authGateViewModel = AuthGateInjection.instance;
  AuthGate({required this.loginPage, required this.homePage, super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.authGateViewModel,
      builder: (context, child) {
        Widget child = SizedBox(child:Text("Error"));
        if(widget.authGateViewModel.isLoading){
           child = const CircularProgressIndicator();
        }
        else if(widget.authGateViewModel.goToLogin){
          child = widget.loginPage;
        }
        else if(!widget.authGateViewModel.goToLogin){
          child =widget.homePage;
        }
        return child;
      },
    );
  }
}

