import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const TextField(
                decoration: InputDecoration(
                  hintText: "Email"
                ),
              ),
              const SizedBox(height: 8,),
              const TextField(
                 decoration: InputDecoration(
                  hintText: "Password"
                ),
              ),

              const SizedBox(height: 16,),

              ElevatedButton(onPressed: (){}, child: const Text("Sign In"))
            ],
          ),
        ),
      ),
    );
  }
}