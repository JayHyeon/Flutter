import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypetdiary/global.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mypetdiary/container/MainContainer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static final storage = FlutterSecureStorage();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    autoLogin();

    super.initState();
  }

  void autoLogin() async {
    getLoginInfo().then((res) async => {
          if (res.isNotEmpty)
            {
              await firestore
                  .collection('users')
                  .where("id", isEqualTo: res['id'])
                  .where("pw", isEqualTo: res['pw'])
                  .get()
                  .then(
                      (res) => {
                            if (res.docs.isEmpty)
                              {storage.delete(key: "login")},
                            moveToMain()
                          },
                      onError: (e) => print('error'))
            }
          else
            {moveToMain()}
        });
  }

  void moveToMain() {
    Timer(const Duration(seconds: 2), () {
      Get.offAll(const MainContainer());
    });
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
