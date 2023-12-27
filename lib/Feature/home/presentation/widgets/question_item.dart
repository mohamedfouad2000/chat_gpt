import 'package:chat_gpt/Feature/home/presentation/screens/conversation_page.dart';
import 'package:chat_gpt/core/utils/components.dart';
import 'package:chat_gpt/core/utils/styles.dart';
import 'package:flutter/material.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Nav(
            context,
            ConversationPage(
              text: text,
            ));
      },
      child: Container(
        padding:
            const EdgeInsets.only(top: 12, bottom: 12, right: 24, left: 24),
        decoration: BoxDecoration(
            color: const Color(0xff444550),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: StylesData.logoStyle.copyWith(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
