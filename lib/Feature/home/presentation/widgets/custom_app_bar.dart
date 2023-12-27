import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/Feature/home/presentation/screens/conversation_page.dart';
import 'package:chat_gpt/core/utils/assets_data.dart';
import 'package:chat_gpt/core/utils/components.dart';
import 'package:chat_gpt/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Container(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Image(
                      image: AssetImage(HomeCubit.get(context).islight
                          ? AssetsData.chatIconBlack
                          : AssetsData.chatIcon),
                      height: 20,
                      width: 20,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Expanded(
                        child: Text("New Chat", style: StylesData.titleStyle)),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        NavegatorPush(context, ConversationPage());
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 16,
                        weight: 6.75,
                      ),
                    ),
                  ],
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
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
