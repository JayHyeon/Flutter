import 'package:flutter/material.dart';

class HorizontalDivider extends StatefulWidget {
  const HorizontalDivider({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  HorizontalDividerState createState() => HorizontalDividerState();
}

class HorizontalDividerState extends State<HorizontalDivider> {
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 8,
      color: const Color(0xfff2f2f2),
    );
  }
}
