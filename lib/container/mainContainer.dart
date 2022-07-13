import 'package:flutter/material.dart';
import 'package:mypetdiary/screen/gridScreen.dart';
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
      label: 'Grid',
      icon: Icon(Icons.grid_view),
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

  List screens = [
    const HomeScreen(),
    const GridScreen(),
    const WishScreen(),
    const MypageScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인페이지'),
        centerTitle: true,
      ),
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
