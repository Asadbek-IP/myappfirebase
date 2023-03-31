import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static final storage = FirebaseStorage.instance.ref();

  static Future<String> uploadImage(File image) async {
    
    String imageName = "image_" + DateTime.now().toString(); // rasm nomi
    var imagePath =
        storage.child("post_image").child(imageName); // rasm joylashuvi

    TaskSnapshot yuklash =
        await imagePath.putFile(image).whenComplete(() => {}); // upload

    String imageUrl = await imagePath.getDownloadURL();

    return imageUrl;
  }
}
