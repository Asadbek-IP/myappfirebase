import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myappfirebase/pages/home_page.dart';
import 'package:myappfirebase/pages/login_page.dart';
import 'package:myappfirebase/pages/sign_up.dart';
import 'package:myappfirebase/services/auth.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
      home: Auth.isLogin() ? HomePage() : SignUp(),
    );
  }
}
