import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    "인기",
    "팔로잉",
    "사진",
    "집들이",
    "노하우",
    "전문가집들이",
    "질문과답변"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Container(
                      color: const Color(0xffEEEEEE),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.search_outlined,
                              size: 20,
                            ),
                            Text(
                              "오늘의집 통합검색",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff666666)),
                            )
                          ],
                        ),
                      ))),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.bookmark_border_outlined,
                  size: 28,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 35,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Center(child: Text(categories[index])));
            },
          ),
        ),
        const Divider(thickness: 1, color: Colors.grey)
      ],
    );
  }
}
