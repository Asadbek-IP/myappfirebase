import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myappfirebase/model/post_model.dart';
import 'package:myappfirebase/services/rtdb_service.dart';
import 'package:myappfirebase/services/storage_service.dart';

import '../services/auth.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final TextEditingController _titleC = TextEditingController();
  final TextEditingController _bodyC = TextEditingController();

  bool isLoading = false;

  void _createPost() async {
    String title = _titleC.text;
    String body = _bodyC.text;

    if (_image == null) return;
    _uploadImage(title, body);
  }

  File? _image;

  final _picker = ImagePicker();

  _openGallery() async {
    XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(imageFile!.path);
    });
  }

  _uploadImage(String title, String body) {
    setState(() {
      isLoading = true;
    });
    StorageService.uploadImage(_image!).then((value) {
      RTDB
          .createPost(Post(
              title: title, body: body, imageUrl: value, userId: Auth.userId))
          .then((value) {
        setState(() {
          isLoading = false;
        });
        Navigator.pop(context,"Yangilandi");
      });
    });
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
              GestureDetector(
                onTap: () {
                  _openGallery();
                },
                child: _image == null
                    ? const Image(
                        width: 100,
                        height: 100,
                        image: AssetImage("assets/images/camera.png"),
                      )
                    : Image(
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                        image: FileImage(_image!),
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _titleC,
                decoration: const InputDecoration(hintText: "Sarlavha"),
              ),
              TextField(
                controller: _bodyC,
                decoration: const InputDecoration(hintText: "Asosiy"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _createPost();
                },
                child: const Text("Post yaratish"),
              ),
              isLoading ? CircularProgressIndicator() : Container()
            ],
          ),
        ),
      ),
    );
  }
}
