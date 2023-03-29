class Post {
  String title;
  String body;
  String userId;
  Post(this.title, this.body, this.userId);

  Map toJson() {
    return {"title": title, "body": body, "userId": userId};
  }
}
