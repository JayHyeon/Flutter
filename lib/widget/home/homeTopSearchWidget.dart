import 'package:flutter/material.dart';

class HomeTopSearchWidget extends StatefulWidget {
  const HomeTopSearchWidget({Key? key}) : super(key: key);

  @override
  HomeTopSearchWidgetState createState() => HomeTopSearchWidgetState();
}

class HomeTopSearchWidgetState extends State<HomeTopSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 5, left: 10, right: 10),
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
                          "마이펫다이어리 통합검색",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff666666)),
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
    );
  }
}
