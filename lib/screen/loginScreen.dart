import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mypetdiary/dialog/alertDialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  static final storage = FlutterSecureStorage();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final idController = TextEditingController();
  final pwController = TextEditingController();

  void requestLogin() async {
    await firestore
        .collection('users')
        .where("id", isEqualTo: idController.text)
        .where("pw", isEqualTo: pwController.text)
        .get()
        .then(
            (res) => {
                  setState(() {
                    if (res.docs.isEmpty) {
                      alertDialog(
                          context, "로그인 실패", "아이디 혹은 비밀번호를 확인해주시기 바랍니다.");
                    } else {
                      saveLoginInfo(res.docs.first.data());
                    }
                  })
                },
            onError: (e) => print('error'));
  }

  void saveLoginInfo(Map<String, dynamic> data) async {
    Map<String, dynamic> jsonObject = jsonDecode("{}");
    jsonObject["id"] = data['id'];
    jsonObject["pw"] = data['pw'];
    jsonObject["name"] = data['name'];

    storage.write(key: "login", value: jsonEncode(jsonObject).toString());
  }

  void showLoginInfo() async {
    String? jsonString = await storage.read(key: "login");
    Map<String, dynamic> loginInfo = jsonDecode(jsonString!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'ID',
            ),
            controller: idController,
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'PW',
              ),
              controller: pwController,
            )),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: OutlinedButton(
              onPressed: () {
                requestLogin();
              },
              child: const Text("Login"),
            )),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: OutlinedButton(
              onPressed: () {
                showLoginInfo();
              },
              child: const Text("Show"),
            )),
      ],
    );
  }
}
