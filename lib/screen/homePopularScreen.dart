import 'package:flutter/material.dart';
import 'package:mypetdiary/widget/common/HorizontalDivider.dart';
import 'package:mypetdiary/widget/home/popular/homePopularGridMenuWidget.dart';
import 'package:mypetdiary/widget/home/popular/homePopularPageviewWidget.dart';
import 'package:mypetdiary/widget/home/popular/homePopularWithPetLifeWidget.dart';

class HomePopularScreen extends StatefulWidget {
  const HomePopularScreen({Key? key}) : super(key: key);

  @override
  HomePopularScreenState createState() => HomePopularScreenState();
}

class HomePopularScreenState extends State<HomePopularScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  HomePopularPageviewWidget(),
                  HomePopularGridMenuWidget(),
                  HorizontalDivider(height: 8),
                  HomePopularWithPetLifeWidget(),
                  HomePopularGridMenuWidget(),
                ])
          ]),
    );
  }
}
