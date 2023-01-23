// ignore_for_file: prefer_const_constructors

import 'package:chat_bot_gpt/splashScreen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat Bot GPT",
      home: splash_screen(),
    );
  }
}
