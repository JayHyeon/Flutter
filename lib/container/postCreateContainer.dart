import 'package:flutter/material.dart';
import 'package:mypetdiary/screen/postCreateScreen.dart';

class PostCreateContainer extends StatefulWidget {
  const PostCreateContainer({Key? key}) : super(key: key);

  @override
  PostCreateContainerState createState() => PostCreateContainerState();
}

class PostCreateContainerState extends State<PostCreateContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시물 등록'),
      ),
      body: const PostCreateScreen(),
    );
  }
}
