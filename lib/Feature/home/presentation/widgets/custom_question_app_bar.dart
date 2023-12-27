import 'package:chat_gpt/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomQuestionAppbar extends StatelessWidget {
  const CustomQuestionAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(
                Icons.question_answer_outlined,
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Text("Some Question", style: StylesData.titleStyle)),
            ],
          ),
          Container(
            padding: EdgeInsets.zero,
            width: double.infinity,
            height: 1,
            color: Colors.white.withOpacity(.4),
          ),
        ],
      ),
    );
  }
}
