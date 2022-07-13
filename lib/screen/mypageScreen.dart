import 'package:flutter/material.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({Key? key}) : super(key: key);

  @override
  MypageScreenState createState() => MypageScreenState();
}

class MypageScreenState extends State<MypageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Mypage"),
    );
  }
}
