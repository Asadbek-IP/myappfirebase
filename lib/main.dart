import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myappfirebase/pages/home_page.dart';
import 'package:myappfirebase/pages/sign_up.dart';
import 'package:myappfirebase/services/auth.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        primaryColorLight: Colors.deepOrange,
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.deepOrange)),
        ),
      ),
      home: Auth.isLogin() ? const HomePage() : const SignUp(),
    );
  }
}
