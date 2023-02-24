// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'dart:async';

import 'package:chat_bot_gpt/UTIL/chat_message.dart';
import 'package:chat_bot_gpt/Three%20Dots/threeDots.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:custom_alert_dialog_box/custom_alert_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quickalert/quickalert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<chat_message> _messages = [];
  bool _isTyping = false;
  String API_KEY = "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";

  //Chat GTP initializers.
  ChatGPT? chatGPT;
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    chatGPT = ChatGPT.instance;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void sendMessage() {
    chat_message _message = chat_message(text: _controller.text, sender: "Me");

    setState(() {
      _isTyping = true;
      _messages.insert(0, _message);
    });

    _controller.clear();

    final request = CompleteReq(
        prompt: _message.text, model: kTranslateModelV3, max_tokens: 300);
    _subscription = chatGPT!
        .builder(API_KEY, orgId: "")
        .onCompleteStream(request: request)
        .listen((response) {
      chat_message botMessage =
          chat_message(text: response!.choices[0].text, sender: "Bot");

      setState(() {
        _isTyping = false;
        _messages.insert(0, botMessage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Chat Bot GPT"),
          actions: [
            IconButton(
                onPressed: () {
                  QuickAlert.show(
                      context: context,
                      confirmBtnText: "Okay",
                      borderRadius: 30,
                      title: "Hello 👋",
                      animType: QuickAlertAnimType.slideInUp,
                      text: "My name is Pratyush Priyam."
                          " Nice meeting you ❤️."
                          "Hope you enjoy this app. 🤖",
                      type: QuickAlertType.info);
                },
                icon: Icon(Icons.info)),
          ],
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    padding: Vx.m8,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return _messages[index];
                    })),
            Divider(
              height: 2.0,
            ),
            if (_isTyping) threeDots(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) => sendMessage(),
                      controller: _controller,
                      decoration:
                          InputDecoration.collapsed(hintText: "Enter a text"),
                    ),
                  ),
                  IconButton(
                      onPressed: () => sendMessage(),
                      icon: Icon(
                        Icons.send,
                        color: Colors.blueGrey,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
