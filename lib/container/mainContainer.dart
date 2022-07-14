import 'package:flutter/material.dart';
import 'package:mypetdiary/screen/socialMediaScreen.dart';
import 'package:mypetdiary/screen/homeScreen.dart';
import 'package:mypetdiary/screen/mypageScreen.dart';
import 'package:mypetdiary/screen/wishScreen.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({Key? key}) : super(key: key);

  @override
  MainContainerState createState() => MainContainerState();
}

class MainContainerState extends State<MainContainer> {
  int selectedIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(Icons.home_filled),
    ),
    const BottomNavigationBarItem(
      label: 'SNS',
      icon: Icon(Icons.social_distance),
    ),
    const BottomNavigationBarItem(
      label: 'Wish',
      icon: Icon(Icons.favorite),
    ),
    const BottomNavigationBarItem(
      label: 'Mypage',
      icon: Icon(Icons.account_circle),
    )
  ];

  void indexChangeCallback(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List screens = [
      const HomeScreen(),
      const SocialMediaScreen(),
      const WishScreen(),
      MypageScreen(indexChangeCallback: indexChangeCallback)
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 10,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: bottomItems,
      ),
      body: screens[selectedIndex],
    );
  }
}
