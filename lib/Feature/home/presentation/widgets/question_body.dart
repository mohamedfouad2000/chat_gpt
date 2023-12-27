import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/Feature/home/presentation/widgets/custom_question_app_bar.dart';
import 'package:chat_gpt/Feature/home/presentation/widgets/question_item.dart';
import 'package:chat_gpt/core/utils/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionBody extends StatelessWidget {
  const QuestionBody({super.key, required this.question});
  final List<String> question;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) => Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            const CustomQuestionAppbar(),
            Expanded(
              child: ConditionalBuilder(
                builder: (BuildContext context) {
                  return ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return QuestionItem(text: question[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: question.length,
                  );
                },
                condition: question.isNotEmpty,
                fallback: (BuildContext context) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: kMainColor,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      listener: (context, state) => {},
    );
  }
}
