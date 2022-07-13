import 'package:flutter/material.dart';

class WishScreen extends StatefulWidget {
  const WishScreen({Key? key}) : super(key: key);

  @override
  WishScreenState createState() => WishScreenState();
}

class WishScreenState extends State<WishScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Wish"),
    );
  }
}
