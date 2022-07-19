import 'package:flutter/material.dart';
import 'dart:math';
import 'package:mypetdiary/models/homePopularWithPetLifeGridModel.dart';

class HomePopularWithPetLifeWidget extends StatefulWidget {
  const HomePopularWithPetLifeWidget({Key? key}) : super(key: key);

  @override
  HomePopularWithPetLifeWidgetState createState() =>
      HomePopularWithPetLifeWidgetState();
}

class HomePopularWithPetLifeWidgetState
    extends State<HomePopularWithPetLifeWidget> {
  List<HomePopularWithPetLifeGrid> grids = [
    HomePopularWithPetLifeGrid(
        title: "쇼핑하기", content: "asdf", icon: Icons.shopping_cart_outlined),
    HomePopularWithPetLifeGrid(
        title: "빠른배송", content: "asdf", icon: Icons.local_shipping),
    HomePopularWithPetLifeGrid(
        title: "집들이", content: "asdf", icon: Icons.house_outlined),
    HomePopularWithPetLifeGrid(
        title: "공간사진", content: "asdf", icon: Icons.celebration)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: const Text(
            "반려동물과 나누는 일상",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            padding:
                const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 20),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 8 / 9,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xfff2f2f2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Stack(children: [
                                Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Icon(grids[index].icon,
                                          color: Colors.primaries[Random()
                                              .nextInt(
                                                  Colors.primaries.length)]),
                                    )),
                                const Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(Icons.bookmark),
                                )
                              ]))),
                      Container(
                          padding: const EdgeInsets.only(top: 8, bottom: 2),
                          alignment: Alignment.centerLeft,
                          child: Row(children: [
                            Text(
                              grids[index].title,
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  grids[index].content,
                                  style: const TextStyle(fontSize: 13),
                                ))
                          ]))
                    ],
                  );
                }))
      ],
    );
  }
}
