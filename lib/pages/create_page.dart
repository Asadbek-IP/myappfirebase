import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:myappfirebase/model/post_model.dart';
import 'package:myappfirebase/services/rtdb_service.dart';

import '../services/auth.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController _titleC = TextEditingController();
  TextEditingController _bodyC = TextEditingController();

  void _createPost() async {
    String title = _titleC.text;
    String body = _bodyC.text;
    Post post = Post(title: title, body: body, userId: Auth.userId);
    RTDB.createPost(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _titleC,
                decoration: InputDecoration(hintText: "Sarlavha"),
              ),
              TextField(
                controller: _bodyC,
                decoration: InputDecoration(hintText: "Asosiy"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _createPost();
                  Navigator.pop(context,"Qoshildi");
                },
                child: const Text("Post yaratish"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
