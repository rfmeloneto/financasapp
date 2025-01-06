import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  
 
  final TextEditingController controller;
  const DialogWidget({required this.title, required this.callback, required this.controller, super.key});
 

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: controller,
      ),
      actions: [
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            controller.clear();
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Adicionar'),
          onPressed: () {
            callback();
            controller.clear();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}