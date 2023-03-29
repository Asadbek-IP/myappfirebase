import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:myappfirebase/model/post_model.dart';

class RTDB {
  static var rtdb = FirebaseDatabase.instance.ref();

  static Future createPost(Post post) async {
    Map map = post.toJson();

    String json = jsonEncode(map);

    await rtdb.child("post").push().set(json);
  }
}
