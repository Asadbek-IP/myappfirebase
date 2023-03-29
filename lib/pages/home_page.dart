import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myappfirebase/pages/create_page.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("${Auth.hozirgiFoy().email}"),
        actions: [
          IconButton(
              onPressed: () {
                Auth.logOut().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                });
              },
              icon: const Icon(Icons.exit_to_app_rounded))
        ],
      ),
      body: const Center(),
    );
  }
}
