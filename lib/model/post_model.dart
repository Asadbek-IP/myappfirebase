class Post {
  String title;
  String body;
  String imageUrl;
  String userId;
  Post(
      {required this.title,
      required this.body,
      required this.imageUrl,
      required this.userId});

  Map toJson() {
    return {
      "title": title,
      "body": body,
      "imageUrl": imageUrl,
      "userId": userId
    };
  }

  factory Post.fromMap(Map map) {
    return Post(
        title: map["title"],
        body: map["body"],
        imageUrl: map["imageUrl"],
        userId: map["userId"]);
  }
}
