import 'package:chat_app/pages/login.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
      theme: lightMode,
    );
  }
}
