// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class chat_message extends StatelessWidget {
  const chat_message({super.key, required this.text, required this.sender});

  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(sender)
            .text
            .subtitle1(context)
            .make()
            .box
            .color(sender == "Me" ? Vx.green300 : Vx.blue300)
            .p16
            .roundedFull
            .alignCenter
            .makeCentered(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text.trim().text.bodyText1(context).make().px8(),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.record_voice_over_sharp)),
            ],
          ),
        )
      ],
    ).py8();
  }
}
