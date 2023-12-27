import 'dart:io';

import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/Feature/home/presentation/screens/question_page.dart';
import 'package:chat_gpt/core/utils/assets_data.dart';
import 'package:chat_gpt/core/utils/colors.dart';
import 'package:chat_gpt/core/utils/components.dart';
import 'package:chat_gpt/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  HomeCubit.get(context).clearConversation().then((value) {});
                },
                child: ListTile(
                  title: const Text(
                    "Clear conversations",
                    style: StylesData.listTitleText,
                  ),
                  leading: Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(
                      HomeCubit.get(context).islight
                          ? AssetsData.iconT1black
                          : AssetsData.iconT1,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Upgrade to Plus",
                          style: StylesData.listTitleText,
                        ),
                      ),
                      Container(
                        height: 20,
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        decoration: BoxDecoration(
                          color: knewContainerColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "NEW",
                          style: StylesData.containerStyle,
                        )),
                      )
                    ],
                  ),
                  leading: Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(
                      HomeCubit.get(context).islight
                          ? AssetsData.iconT2black
                          : AssetsData.iconT2,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  HomeCubit.get(context).changeTheme();
                },
                child: ListTile(
                  title: Text(
                    HomeCubit.get(context).islight ? "Dark mode" : "Light mode",
                    style: StylesData.listTitleText,
                  ),
                  leading: Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(
                      HomeCubit.get(context).islight
                          ? AssetsData.iconT3black
                          : AssetsData.iconT3,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  NavegatorPush(context, const QuestionsPage());
                },
                child: ListTile(
                  title: const Text(
                    "Updates & FAQ",
                    style: StylesData.listTitleText,
                  ),
                  leading: Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(
                      HomeCubit.get(context).islight
                          ? AssetsData.iconT4black
                          : AssetsData.iconT4,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  exit(0);
                },
                child: ListTile(
                  title: Text(
                    "Logout",
                    style:
                        StylesData.listTitleText.copyWith(color: kLogoutColor),
                  ),
                  leading: Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(
                      HomeCubit.get(context).islight
                          ? AssetsData.iconT5Black
                          : AssetsData.iconT5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
