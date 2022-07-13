import 'package:flutter/material.dart';
import 'package:mypetdiary/screen/loginScreen.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  LoginContainerState createState() => LoginContainerState();
}

class LoginContainerState extends State<LoginContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: const LoginScreen(),
    );
  }
}
