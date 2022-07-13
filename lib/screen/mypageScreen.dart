import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mypetdiary/container/loginContainer.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({Key? key}) : super(key: key);

  @override
  MypageScreenState createState() => MypageScreenState();
}

class MypageScreenState extends State<MypageScreen> {
  static final storage = FlutterSecureStorage();

  @override
  void initState() {
    loginCheck();

    super.initState();
  }

  void loginCheck() async {
    String? jsonString = await storage.read(key: "login");
    if (jsonString != null) {
      Map<String, dynamic> loginInfo = jsonDecode(jsonString);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Text("Mypage"),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Get.to(const LoginContainer());
            },
            child: const Text('Log in'),
          ),
        )
      ],
    );
  }
}
