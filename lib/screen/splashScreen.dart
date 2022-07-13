import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypetdiary/global.dart';
import 'package:mypetdiary/container/mainContainer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Get.offAll(const MainContainer());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset("$imagePath/flutter.png", fit: BoxFit.contain),
        ),
        const CircularProgressIndicator()
      ],
    ));
  }
}
