import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mypetdiary/global.dart';
import 'package:mypetdiary/container/loginContainer.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({Key? key, required this.indexChangeCallback})
      : super(key: key);
  final Function(int index) indexChangeCallback;

  @override
  MypageScreenState createState() => MypageScreenState();
}

class MypageScreenState extends State<MypageScreen> {
  static final storage = FlutterSecureStorage();

  bool visibleLoginBtn = true;
  bool visibleLogoutBtn = false;

  @override
  void initState() {
    loginCheck();

    super.initState();
  }

  void loginCheck() async {
    getLoginInfo().then((res) => {
          if (res.isNotEmpty)
            {
              setState(() {
                visibleLoginBtn = false;
                visibleLogoutBtn = true;
              })
            }
          else
            {
              setState(() {
                visibleLoginBtn = true;
                visibleLogoutBtn = false;
              })
            }
        });
  }

  void requestLogout() {
    storage
        .delete(key: "login")
        .then((value) => {widget.indexChangeCallback(0)});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Text("Mypage"),
        Visibility(
            visible: visibleLoginBtn,
            child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Get.to(const LoginContainer());
                },
                child: const Text('Log in'),
              ),
            )),
        Visibility(
            visible: visibleLogoutBtn,
            child: Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  requestLogout();
                },
                child: const Text('Log out'),
              ),
            )),
      ],
    );
  }
}
