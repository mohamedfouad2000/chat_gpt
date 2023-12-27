import 'package:chat_gpt/Feature/home/data/messageModel/message_model.dart';
import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/Feature/home/presentation/widgets/custom_conversion_app_bar.dart';
import 'package:chat_gpt/Feature/home/presentation/widgets/custom_send_buttom.dart';
import 'package:chat_gpt/Feature/home/presentation/widgets/loading_text.dart';
import 'package:chat_gpt/Feature/home/presentation/widgets/message_reseve.dart';
import 'package:chat_gpt/Feature/home/presentation/widgets/message_send.dart';
import 'package:chat_gpt/Feature/home/presentation/widgets/option_list.dart';
import 'package:chat_gpt/Feature/home/presentation/widgets/regenerate_item.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ConversationPage extends StatelessWidget {
  ConversationPage({super.key, this.editModel, this.indexOfModel});
  List<MessageModel>? editModel;
  int? indexOfModel;
  @override
  Widget build(BuildContext context) {
    TextEditingController msqCont = TextEditingController();
    ScrollController sc = ScrollController();
    if (editModel != null) {
      HomeCubit.get(context).putEditList(editModel: editModel!);
    }

    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        // ignore: deprecated_member_use
        return WillPopScope(
          onWillPop: () async {
            if (HomeCubit.get(context).chatList.length % 2 == 0) {
              HomeCubit.get(context)
                  .addNewChat(index: indexOfModel)
                  .then((value) {
                Navigator.pop(context, true);
                return true;
              });
            }
            return false;
          },
          child: Scaffold(
            body: Column(
              children: [
                CustoomConverstionAppBar(indexOfModel: indexOfModel),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ConditionalBuilder(
                        condition: HomeCubit.get(context).chatList.isNotEmpty,
                        builder: (BuildContext context) {
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            controller: sc,
                            itemBuilder: (BuildContext context, int index) {
                              if (HomeCubit.get(context).chatList[index].id ==
                                  1) {
                                return Column(
                                  children: [
                                    MessageSender(
                                      text: HomeCubit.get(context)
                                          .chatList[index]
                                          .text,
                                    ),
                                    if (state is LoadingGetResponState &&
                                        index ==
                                            HomeCubit.get(context)
                                                    .chatList
                                                    .length -
                                                1)
                                      const LoadingText(),
                                  ],
                                );
                              } else {
                                return Column(
                                  children: [
                                    MessageReciver(
                                      text: HomeCubit.get(context)
                                          .chatList[index]
                                          .text,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    OptionList(
                                        txt: HomeCubit.get(context)
                                            .chatList[index]
                                            .text!),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                );
                              }
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 6,
                                width: double.infinity,
                              );
                            },
                            itemCount: HomeCubit.get(context).chatList.length,
                          );
                        },
                        fallback: (BuildContext context) {
                          return Center(
                            child: Text(
                              "Ask anything, get your answer",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white.withOpacity(.4),
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                        },
                      )),
                ),
                if (HomeCubit.get(context).chatList.isNotEmpty &&
                    HomeCubit.get(context).chatList.length % 2 == 0)
                  RegenerateItem(
                      txt: HomeCubit.get(context)
                          .chatList[HomeCubit.get(context).chatList.length - 2]
                          .text!),
                if (state is FailureGetResponState)
                  const Center(child: Text("Oops, something went wrong")),
                CustomSenButton(msqCont: msqCont),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {
        if (state is AddTolistState) {
          Future.delayed(
              const Duration(milliseconds: 300),
              () => sc.animateTo(sc.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn));
        }
      },
    );
  }
}
