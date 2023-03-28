import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myappfirebase/services/auth.dart';

import 'sign_up.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${Auth.hozirgiFoy().email}")),
      body: Center(
        child: ElevatedButton(
          onPressed: ()  {
            Auth.logOut().then((value) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            });
          },
          child: Text("Log out"),
        ),
      ),
    );
  }
}
