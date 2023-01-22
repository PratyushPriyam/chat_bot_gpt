import 'dart:async';

import 'package:chat_bot_gpt/UTIL/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 3000), () {
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
          Image.asset(
            "assets/chat.png",
            width: 150,
            height: 150,
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            "Chat Bot GPT",
            style: TextStyle(
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
