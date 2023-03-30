class Post {
  String title;
  String body;
  String userId;
  Post({required this.title, required this.body, required this.userId});

  Map toJson() {
    return {"title": title, "body": body, "userId": userId};
  }

  factory Post.fromMap(Map map) {
    return Post(title: map["title"], body: map["body"], userId: map["userId"]);
  }
}
