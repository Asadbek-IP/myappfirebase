import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myappfirebase/pages/home_page.dart';
import 'package:myappfirebase/pages/login_page.dart';
import 'package:myappfirebase/services/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool isLoading = false;
  void _signUp() {
    String email = emailController.text;
    String pass = _passController.text;
    setState(() {
      isLoading = true;
    });
    Auth.createUser(email, pass, context).then((value) {
      setState(() {
        isLoading = false;
      });
      if (value != null) {
        print(value.uid);
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
                controller: emailController,
                decoration: InputDecoration(hintText: "Email"),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: _passController,
                decoration: InputDecoration(hintText: "Password"),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () async {
                  _signUp();
                },
                child: isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text("Sign UP"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Sizning akkountingiz bormi?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text("Sign In"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
