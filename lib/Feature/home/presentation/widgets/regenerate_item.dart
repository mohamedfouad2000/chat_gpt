import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_gpt/core/utils/assets_data.dart';
import 'package:chat_gpt/core/utils/styles.dart';

class RegenerateItem extends StatelessWidget {
  const RegenerateItem({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) => Container(
        height: 40,
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        decoration: BoxDecoration(
            color: const Color(0xff202123),
            borderRadius: BorderRadius.circular(
              10,
            ),
            boxShadow: [
              BoxShadow(color: Colors.white.withOpacity(.2), spreadRadius: .5)
            ]),
        child: InkWell(
          onTap: () async {
            HomeCubit.get(context).chatList.removeLast();
            HomeCubit.get(context).chatList.removeLast();
            HomeCubit.get(context)
                .addTochangeList(
                    text: txt.toString(),
                    id: 1,
                    dateTime: DateTime.now().toString())
                .then((value) {
              HomeCubit.get(context)
                  .chatwithGpt(msq: txt.toString())
                  .then((value) {});
            });
          },
          child: Row(
            children: [
              const Image(
                image: AssetImage(
                  AssetsData.regenerateIcon,
                ),
                fit: BoxFit.cover,
                width: 12,
                height: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Regenerate response",
                style: StylesData.regenerateStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      listener: (context, state) => {},
    );
  }
}
