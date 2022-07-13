import 'package:flutter/material.dart';
import 'package:mypetdiary/item/postItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.separated(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return const PostItem();
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            }));
  }
}
