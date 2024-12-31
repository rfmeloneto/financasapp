import 'package:casal_rico/ui/pages/auth_gate.dart';
import 'package:casal_rico/ui/pages/home_page.dart';
import 'package:casal_rico/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    return MaterialApp(
      routes: {
        '/': (context) => AuthGate(loginPage: LoginPage(), homePage: HomePage(),),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),},
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed:  Colors.deepPurple,
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}
