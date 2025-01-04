import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple[700],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.deepPurple),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Bem-vindo!',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Supabase.instance.client.auth.currentUser?.email ?? '',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
              ListTile(
              leading: const Icon(Icons.dashboard, color: Colors.white),
              title: const Text(
                'Resumo',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () { 
               Navigator.pop(context); 
               Navigator.pushNamed(context, '/home');
                
              },
            ),
            const Divider(color: Colors.white70),
            ListTile(
              leading: const Icon(Icons.report, color: Colors.white),
              title: const Text(
                'Categorias de Despesas',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () { 
               Navigator.pop(context); 
               Navigator.pushNamed(context, '/categorias-despesas');
                
              },
            ),
            const Divider(color: Colors.white70),
            ListTile(
              leading: const Icon(Icons.attach_money, color: Colors.white),
              title: const Text(
                'Categorias de Receitas',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () { 
               Navigator.pop(context); 
               Navigator.pushNamed(context, '/categorias-receitas');
                
              },
            ),
          ],
        ),
      );
  }
}