import 'package:flutter/material.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  GridScreenState createState() => GridScreenState();
}

class GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Grid"),
    );
  }
}
