import 'package:chat_gpt/core/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessageSender extends StatelessWidget {
  MessageSender({super.key, required this.text});
  String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 30),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
            width: 271,
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                // topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),

                // topRight:
              ),
            ),
            child: Text("$text",
                // textDirection: TextDirection.ltr,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600))),
      ),
    );
  }
}
