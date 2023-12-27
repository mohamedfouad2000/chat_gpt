import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/Feature/home/presentation/widgets/chat_deatils.dart';
import 'package:chat_gpt/Feature/home/presentation/widgets/custom_app_bar.dart';
import 'package:chat_gpt/Feature/home/presentation/widgets/list_item.dart';
import 'package:chat_gpt/core/utils/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor:
              HomeCubit.get(context).islight ? Colors.white : kChatColor,
          body: Column(
            children: [
              const CustomAppBar(),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                  child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return HomeCubit.get(context).chats.isNotEmpty
                      ? ChatDetails(
                          index: index + 1,
                          listModel:
                              HomeCubit.get(context).chats[index + 1] == null
                                  ? []
                                  : HomeCubit.get(context).chats[index + 1]!,
                        )
                      : Container();
                },
                itemCount: HomeCubit.get(context).chats.length,
              )),
              Container(
                width: double.infinity,
                height: 1,
                color: HomeCubit.get(context).islight
                    ? Colors.black.withOpacity(.4)
                    : Colors.white.withOpacity(.4),
              ),
              const ListItem()
            ],
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
