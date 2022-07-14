import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mypetdiary/global.dart';

class PostCreateScreen extends StatefulWidget {
  const PostCreateScreen({Key? key}) : super(key: key);

  @override
  PostCreateScreenState createState() => PostCreateScreenState();
}

class PostCreateScreenState extends State<PostCreateScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void requestUploadPost() async {
    getLoginInfo().then((value) => {
          firestore.collection('posts').doc().set({
            "title": titleController.text,
            "content": contentController.text,
            "firstPicUrl": "",
            "firstPicWidth": 0,
            "firstPicHeight": 0,
            "authorName": value['id'],
            "like": 0,
            "createAt": FieldValue.serverTimestamp()
          }).then((res) => {print('good')}, onError: (e) => print('error'))
        });
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
              labelText: 'Title',
            ),
            controller: titleController,
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: RawKeyboardListener(
              focusNode: FocusNode(),
              onKey: (RawKeyEvent event) async {
                if (event.runtimeType == RawKeyDownEvent) {
                  String keydownText = event.data.logicalKey.keyLabel;
                  int cursorPosition = contentController.selection.baseOffset;
                  if (numberPad_list.contains(keydownText)) {
                    keydownText =
                        numerPad_convert[numberPad_list.indexOf(keydownText)];
                  }
                  if (undetected_list.contains(keydownText)) {
                    await Future.delayed(Duration(milliseconds: 10));
                    List text_list = contentController.text.split("");
                    try {
                      if (text_list[cursorPosition] != keydownText) {
                        text_list.insert(cursorPosition, keydownText);
                        contentController.text = text_list.join();
                        contentController.selection =
                            TextSelection.fromPosition(
                                TextPosition(offset: cursorPosition + 1));
                      }
                    } catch (e) {
                      if (text_list[contentController.text.length - 1] !=
                          keydownText) {
                        contentController.text =
                            contentController.text + keydownText;
                        contentController.selection =
                            TextSelection.fromPosition(TextPosition(
                                offset: contentController.text.length));
                      }
                    }
                  }
                }
              },
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Content',
                ),
                controller: contentController,
              ),
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: OutlinedButton(
            onPressed: () {
              requestUploadPost();
            },
            child: const Text("upload"),
          ),
        ),
      ],
    );
  }
}
