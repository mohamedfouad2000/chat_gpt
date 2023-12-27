import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MessageReciver extends StatelessWidget {
  MessageReciver({super.key, required this.text});
  String? text;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            right: 40,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: kConverColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    // topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),

                    // topRight:
                  ),
                ),
                child: Text(
                  text.toString().trim(),
                  // textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
