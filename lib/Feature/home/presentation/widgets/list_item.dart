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
                child: const ListTile(
                  title: Text(
                    "Clear conversations",
                    style: StylesData.listTitleText,
                  ),
                  leading: Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(
                      AssetsData.iconT1,
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
                  leading: const Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(
                      AssetsData.iconT2,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  title: Text(
                    "Light mode",
                    style: StylesData.listTitleText,
                  ),
                  leading: Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(
                      AssetsData.iconT3,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Nav(context, const QuestionsPage());
                },
                child: const ListTile(
                  title: Text(
                    "Updates & FAQ",
                    style: StylesData.listTitleText,
                  ),
                  leading: Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(
                      AssetsData.iconT4,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text(
                    "Logout",
                    style:
                        StylesData.listTitleText.copyWith(color: kLogoutColor),
                  ),
                  leading: const Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(
                      AssetsData.iconT5,
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
