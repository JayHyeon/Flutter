import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:mypetdiary/models/homeCategoryModel.dart';
import 'package:mypetdiary/screen/homeFollowScreen.dart';
import 'package:mypetdiary/screen/homePopularScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var selectedScreen;
  final itemScrollController = ItemScrollController();

  List<HomeCategory> categories = [
    HomeCategory(
        text: "인기",
        color: Colors.blueAccent,
        lineColor: Colors.blueAccent,
        screen: const HomePopularScreen()),
    HomeCategory(
        text: "팔로잉",
        color: Colors.black,
        lineColor: Colors.transparent,
        screen: const HomeFollowScreen()),
    HomeCategory(
        text: "사진",
        color: Colors.black,
        lineColor: Colors.transparent,
        screen: const HomeFollowScreen()),
    HomeCategory(
        text: "반려동물",
        color: Colors.black,
        lineColor: Colors.transparent,
        screen: const HomeFollowScreen()),
    HomeCategory(
        text: "노하우",
        color: Colors.black,
        lineColor: Colors.transparent,
        screen: const HomeFollowScreen()),
    HomeCategory(
        text: "전문가반려동물",
        color: Colors.black,
        lineColor: Colors.transparent,
        screen: const HomeFollowScreen()),
    HomeCategory(
        text: "질문과답변",
        color: Colors.black,
        lineColor: Colors.transparent,
        screen: const HomeFollowScreen())
  ];

  @override
  void initState() {
    setState(() {
      selectedScreen = categories.first.screen;
    });

    super.initState();
  }

  void selectedCategory(index, context) {
    var tmpList = categories;
    for (int i = 0; i < categories.length; i++) {
      tmpList[i].color = Colors.black;
      tmpList[i].lineColor = Colors.transparent;
      if (index == i) {
        tmpList[i].color = Colors.blueAccent;
        tmpList[i].lineColor = Colors.blueAccent;
      }
    }
    setState(() {
      categories = tmpList;
      selectedScreen = categories[index].screen;
    });

    itemScrollController.scrollTo(
        index: (index) % categories.length,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
        alignment: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
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
            height: 40,
            child: ScrollablePositionedList.separated(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () => {selectedCategory(index, context)},
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Center(
                                      child: Text(categories[index].text,
                                          style: TextStyle(
                                              color:
                                                  categories[index].color))))),
                          Container(
                              height: 2,
                              color: categories[index].lineColor,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Text(
                                    categories[index].text,
                                    style: const TextStyle(
                                        color: Colors.transparent),
                                  )))
                        ]));
              },
              itemScrollController: itemScrollController,
              separatorBuilder: (BuildContext context, int index) =>
                  const Padding(padding: EdgeInsets.all(0)),
            )),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.black12,
        ),
        selectedScreen,
      ],
    );
  }
}
