import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:myappfirebase/model/post_model.dart';

class RTDB {
  static var rtdb = FirebaseDatabase.instance.ref();

  static Future createPost(Post post) async {
    Map map = post.toJson();

    // String json = jsonEncode(map);

    await rtdb.child("post").push().set(map);
  }

  static Future<List<Post>> getPosts(String id) async {
    List<Post> _posts = [];

    Query query = rtdb.ref.child("post").orderByChild("userId").equalTo(id);
    DatabaseEvent event = await query.once();

    var data = event.snapshot;

    for (var element in data.children) {
      Post object = Post.fromMap(element.value as Map);
      _posts.add(object);
    }
    return _posts;
  }
}
