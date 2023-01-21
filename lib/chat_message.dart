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
          child: text.trim().text.bodyText1(context).make().px8(),
        )
      ],
    ).py8();
  }
}
