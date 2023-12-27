import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomQuestionAppbar extends StatelessWidget {
  const CustomQuestionAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return Container(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
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
                      child:
                          Text("Some Question", style: StylesData.titleStyle)),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.zero,
                width: double.infinity,
                height: 1,
                color: HomeCubit.get(context).islight
                    ? Colors.black.withOpacity(.4)
                    : Colors.white.withOpacity(.4),
              ),
            ],
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
