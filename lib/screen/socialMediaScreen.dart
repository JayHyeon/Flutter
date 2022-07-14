import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mypetdiary/container/postCreateContainer.dart';
import 'package:mypetdiary/global.dart';
import 'package:mypetdiary/item/postItem.dart';
import 'package:mypetdiary/models/postModel.dart';
import 'package:mypetdiary/dialog/alertDialog.dart';

class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({Key? key}) : super(key: key);

  @override
  SocialMediaScreenState createState() => SocialMediaScreenState();
}

class SocialMediaScreenState extends State<SocialMediaScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Post> posts = [];

  @override
  void initState() {
    getPostList();
    super.initState();
  }

  void getPostList() async {
    await firestore
        .collection('posts')
        .orderBy('createAt', descending: true)
        .get()
        .then(
            (res) => {
                  if (res.docs.isEmpty)
                    {print("no data")}
                  else
                    {
                      res.docs.forEach((element) {
                        setState(() {
                          posts.add(Post.fromFirestore(element, null));
                        });
                      })
                    }
                },
            onError: (e) => print('error'));
  }

  void moveToPostCreate() async {
    getLoginInfo().then((res) => {
          if (res.isNotEmpty)
            Get.to(const PostCreateContainer())
          else
            alertDialog(context, "게시글 등록", "로그인 후에 등록이 가능합니다.")
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.separated(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return PostItem(posts[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 3,
              );
            }),
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
              onTap: () {
                moveToPostCreate();
              },
              child: Container(
                margin: const EdgeInsets.all(18),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: Colors.blue),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )),
        )
      ],
    );
  }
}
