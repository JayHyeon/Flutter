import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

final storage = FlutterSecureStorage();
const imagePath = "assets/images";

Future<Map<String, dynamic>> getLoginInfo() async {
  return await storage.read(key: "login").then((value) {
    if (value != null) {
      return jsonDecode(value);
    } else {
      return {};
    }
  });
}

const List undetected_list = [
  " ",
  "`",
  "~",
  "!",
  "@",
  "#",
  "\$",
  "%",
  "^",
  "&",
  "*",
  "(",
  ")",
  "-",
  "_",
  "=",
  "+",
  "[",
  "]",
  "{",
  "}",
  "'",
  '"',
  ";",
  ":",
  "/",
  "?",
  ",",
  ".",
  "<",
  ">",
  "\\",
  "|",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "0"
];
const List numberPad_list = [
  "Numpad Decimal",
  "Numpad Divide",
  "Numpad Multiply",
  "Numpad Subtract",
  "Numpad Add",
  "Numpad 0",
  "Numpad 1",
  "Numpad 2",
  "Numpad 3",
  "Numpad 4",
  "Numpad 5",
  "Numpad 6",
  "Numpad 7",
  "Numpad 8",
  "Numpad 9"
];
const List numerPad_convert = [
  ".",
  "/",
  "*",
  "-",
  "+",
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9"
];
