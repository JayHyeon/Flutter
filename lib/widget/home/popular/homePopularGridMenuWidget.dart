import 'package:flutter/material.dart';
import 'dart:math';
import 'package:mypetdiary/models/homePopularMenuGridModel.dart';

class HomePopularGridMenuWidget extends StatefulWidget {
  const HomePopularGridMenuWidget({Key? key}) : super(key: key);

  @override
  HomePopularGridMenuWidgetState createState() =>
      HomePopularGridMenuWidgetState();
}

class HomePopularGridMenuWidgetState extends State<HomePopularGridMenuWidget> {
  List<HomePopularMenuGrid> grids = [
    HomePopularMenuGrid(text: "쇼핑하기", icon: Icons.shopping_cart_outlined),
    HomePopularMenuGrid(text: "빠른배송", icon: Icons.local_shipping),
    HomePopularMenuGrid(text: "집들이", icon: Icons.house_outlined),
    HomePopularMenuGrid(text: "공간사진", icon: Icons.celebration),
    HomePopularMenuGrid(text: "리모델링", icon: Icons.phone_android_outlined),
    HomePopularMenuGrid(text: "쉬운이사", icon: Icons.warehouse),
    HomePopularMenuGrid(text: "오늘의딜", icon: Icons.agriculture_outlined),
    HomePopularMenuGrid(text: "포인트득템", icon: Icons.money),
    HomePopularMenuGrid(text: "가구대방출", icon: Icons.hotel),
    HomePopularMenuGrid(text: "방구석쉐프", icon: Icons.sailing)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 20),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 3 / 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: const Color(0xfff2f2f2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: FittedBox(
                          fit: BoxFit.fill,
                          child: Icon(
                            grids[index].icon,
                            color: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                          ))),
                  Center(
                      child: Text(
                    grids[index].text,
                    style: const TextStyle(fontSize: 12),
                  ))
                ],
              );
            }));
  }
}
