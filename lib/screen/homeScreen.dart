import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mypetdiary/container/postCreateContainer.dart';
import 'package:mypetdiary/item/postItem.dart';
import 'package:mypetdiary/models/postModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
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
              return const SizedBox(
                height: 10,
              );
            }),
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
              onTap: () {
                Get.to(const PostCreateContainer());
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
