import 'package:chat_gpt/Feature/home/data/messageModel/message_model.dart';
import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/Feature/home/presentation/screens/conversation_page.dart';
import 'package:chat_gpt/core/utils/assets_data.dart';
import 'package:chat_gpt/core/utils/colors.dart';
import 'package:chat_gpt/core/utils/components.dart';
import 'package:chat_gpt/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetails extends StatelessWidget {
  const ChatDetails({super.key, required this.listModel, required this.index});
  final List<MessageModel> listModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return listModel.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Image(
                          image: AssetImage(AssetsData.fram4Icon),
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: Text(
                                listModel[listModel.length - 2].text.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: StylesData.titleStyle
                                    .copyWith(fontWeight: FontWeight.w500))),
                        PopupMenuButton(
                          padding: EdgeInsets.zero,
                          color: kBackGroundColor,
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                onTap: () {
                                  NavegatorPush(
                                      context,
                                      ConversationPage(
                                        editModel: listModel,
                                        indexOfModel: index,
                                      ));
                                },
                                child: const Row(
                                  children: [
                                    Image(
                                      image: AssetImage(AssetsData.editIcon),
                                      width: 16,
                                      height: 16,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text("edit")
                                  ],
                                )),
                            PopupMenuItem(
                              onTap: () {
                                HomeCubit.get(context)
                                    .deleteList(index: index)
                                    .then((value) {});
                              },
                              // padding: EdgeInsets.zero,
                              child: Row(
                                children: [
                                  const Image(
                                    image: AssetImage(AssetsData.deletIcon),
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "delete",
                                    style: TextStyle(color: kLogoutColor),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            NavegatorPush(
                                context,
                                ConversationPage(
                                  editModel: listModel,
                                  indexOfModel: index,
                                ));
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 16,
                            weight: 6.75,
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.white.withOpacity(.4),
                    ),
                  ],
                ),
              )
            : Container();
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
