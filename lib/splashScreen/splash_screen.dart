// ignore_for_file: camel_case_types, prefer_const_constructors

import 'dart:async';
import 'dart:math';

import 'package:chat_bot_gpt/UTIL/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});
  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  List<String> animationList = [
    "assets/gifs/drum.gif",
    "assets/gifs/read.gif",
    "assets/gifs/rocket.gif"
  ];
  int random = Random().nextInt(3);
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => ChatScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.green.shade300, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
                  height: 300,
                  width: 300,
                  child: Image.asset(animationList[random]))),
          SizedBox(
            height: 60,
          ),
          Text(
            "Chat Bot GPT",
            style: TextStyle(
                fontFamily: "Righteous",
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}
