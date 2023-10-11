import 'package:flutter/material.dart';
import 'package:whitelabel/userAuth/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loginPage(),

    );
  }
}


