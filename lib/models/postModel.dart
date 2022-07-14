import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String? key;
  final String? title;
  final String? content;
  final String? firstPicUrl;
  final int? firstPicWidth;
  final int? firstPicHeight;
  final String? authorName;
  final int? like;

  Post(
      {this.key,
      this.title,
      this.content,
      this.firstPicUrl,
      this.firstPicWidth,
      this.firstPicHeight,
      this.authorName,
      this.like});

  factory Post.fromFirestore(
    QueryDocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Post(
      key: data['key'],
      title: data['title'],
      content: data['content'],
      firstPicUrl: data['firstPicUrl'],
      firstPicWidth: data['firstPicWidth'],
      firstPicHeight: data['firstPicHeight'],
      authorName: data['authorName'],
      like: data['like'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (key != null) "key": key,
      if (title != null) "title": title,
      if (content != null) "content": content,
      if (firstPicUrl != null) "firstPicUrl": firstPicUrl,
      if (firstPicWidth != null) "firstPicWidth": firstPicWidth,
      if (firstPicHeight != null) "firstPicHeight": firstPicHeight,
      if (authorName != null) "authorName": authorName,
      if (like != null) "like": like,
    };
  }
  // get getKey => this.key;

  // set setKey(String key) => this.key = key;

  // get getTitle => this.title;

  // set setTitle(title) => this.title = title;

  // get getContent => this.content;

  // set setContent(content) => this.content = content;

  // get getFirstPicUrl => this.firstPicUrl;

  // set setFirstPicUrl(firstPicUrl) => this.firstPicUrl = firstPicUrl;

  // get getFirstPicWidth => this.firstPicWidth;

  // set setFirstPicWidth(firstPicWidth) => this.firstPicWidth = firstPicWidth;

  // get getFirstPicHeight => this.firstPicHeight;

  // set setFirstPicHeight(firstPicHeight) => this.firstPicHeight = firstPicHeight;

  // get getAuthorName => this.authorName;

  // set setAuthorName(authorName) => this.authorName = authorName;

  // get getLike => this.like;

  // set setLike(like) => this.like = like;
}
