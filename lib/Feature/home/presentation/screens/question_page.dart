import 'dart:math';

import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/Feature/home/presentation/widgets/question_body.dart';
import 'package:chat_gpt/core/utils/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<String> questions = [
  'What is ChatGPT?',
  'How is ChatGPT different from previous models like GPT-3?',
  'How can I access ChatGPT?',
  'What type of tasks can ChatGPT handle?',
  'Is ChatGPT aware of current events?',
  'Can ChatGPT understand context in a conversation?',
  'Is ChatGPT free to use?',
  'How can I handle biases in ChatGPT sresponses?',
  'What are the ethical considerations when using ChatGPT?',
  'Where can I find additional resources and support for ChatGPT?',
  'If you could have dinner with any fictional character, who would it be and why?',
  "What's your favorite smell, and does it bring back any specific memories?",
  "If you could instantly master any skill, what would it be?",
  "What's the most unusual food you've ever tried, and did you like it?",
  "If you could time travel, which era would you visit and why?",
  "What's the weirdest dream you've ever had?",
  "If you could be any animal for a day, which one would you choose?",
  "What's the last book, movie, or TV show that made a significant impact on you?",
  "If you could teleport to any place right now, where would you go?",
  "What's your favorite way to unwind and relax after a long day?",
  "What's the most important lesson life has taught you so far?",
  "If you could give one piece of advice to your younger self, what would it be?",
  "What's a small, everyday moment that brings you joy?",
  "If your life was a book, what would be the title of the current chapter?",
  "What's a goal you've set for yourself recently, and how do you plan to achieve it?",
  "If you could have a dinner party with any three people, living or dead, who would they be and why?",
  "What's a quote or mantra that inspires you and guides your decisions?",
  "How do you define success in your life?",
  "If you could choose one skill or ability to master instantly, what would it be?",
  "What's something you've always wanted to do but haven't had the chance to yet?"
];

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> randomItems = [];
    // ignore: unused_local_variable
    for (var element in questions) {
      randomItems.add(questions[Random().nextInt(questions.length - 1)]);
    }
    Set<String> itemSet = randomItems.toSet();
    List<String> finshList = itemSet.take(4).toList();
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
            backgroundColor:
                HomeCubit.get(context).islight ? Colors.white : kChatColor,
            body: QuestionBody(
              question: finshList,
            ));
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
