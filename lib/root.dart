import 'package:flutter/material.dart';
import 'package:flutter_note_app/views/login_page.dart';
import 'package:flutter_note_app/views/note_list.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLogin = true;
    // ignore: dead_code
    if (isLogin) {
      return NoteList(
        key: key,
      );
    }
    // ignore: dead_code
    return LoginPage(
      key: key,
    );
  }
}
