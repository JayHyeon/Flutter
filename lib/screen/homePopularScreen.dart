import 'package:flutter/material.dart';
import 'package:mypetdiary/widget/home/popular/homePopularGridMenuWidget.dart';
import 'package:mypetdiary/widget/home/popular/homePopularPageviewWidget.dart';

class HomePopularScreen extends StatefulWidget {
  const HomePopularScreen({Key? key}) : super(key: key);

  @override
  HomePopularScreenState createState() => HomePopularScreenState();
}

class HomePopularScreenState extends State<HomePopularScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(shrinkWrap: true, children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
          HomePopularPageviewWidget(),
          HomePopularGridMenuWidget(),
          Divider(
            thickness: 8,
            color: Color(0xfff2f2f2),
          ),
          HomePopularGridMenuWidget(),
          HomePopularGridMenuWidget(),
        ])
      ]),
    );
  }
}
