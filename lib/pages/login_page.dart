import 'package:flutter/material.dart';
import 'package:myappfirebase/services/auth.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailC = TextEditingController();
  TextEditingController _passC = TextEditingController();

  bool isLoading = false;

  _signIn() {
    setState(() {
      isLoading = true;
    });
    String email = _emailC.text;
    String pass = _passC.text;
    Auth.signIn(email, pass, context).then((foydalanuvchi) {
      setState(() {
        isLoading = false;
      });
      if (foydalanuvchi != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailC,
                decoration: InputDecoration(hintText: "Email"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: _passC,
                decoration: InputDecoration(hintText: "Password"),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    _signIn();
                  },
                  child: Stack(
                    children: [
                      const Text("Sign In"),
                      isLoading ? CircularProgressIndicator() : Container()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
