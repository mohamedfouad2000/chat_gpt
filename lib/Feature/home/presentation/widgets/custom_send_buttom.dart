import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';

import 'package:chat_gpt/core/utils/assets_data.dart';
import 'package:chat_gpt/core/utils/colors.dart';
import 'package:chat_gpt/core/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSenButton extends StatelessWidget {
  const CustomSenButton({super.key, required this.msqCont});
  final TextEditingController msqCont;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color:
                  HomeCubit.get(context).islight ? Colors.white : kConverColor,
              border: Border.all(
                  color: HomeCubit.get(context).islight
                      ? Colors.black.withOpacity(.2)
                      : Colors.white.withOpacity(.2)),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Expanded(
                  child: customTextFormedFiled(
                controller: msqCont,
                cursorColor:
                    HomeCubit.get(context).islight ? Colors.teal : Colors.white,
              )),
              InkWell(
                onTap: () {
                  if (msqCont.text == '') {
                  } else {
                    HomeCubit.get(context)
                        .addTochangeList(
                            text: msqCont.text.toString(),
                            id: 1,
                            dateTime: DateTime.now().toString())
                        .then((value) {
                      HomeCubit.get(context)
                          .chatwithGpt(msq: msqCont.text.toString())
                          .then((value) {
                        msqCont.text = '';
                      });
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Image(
                      height: 20,
                      width: 20,
                      image: AssetImage(AssetsData.sendButton)),
                ),
              ),
            ],
          ),
        ),
      ),
      listener: (context, state) => {},
    );
  }
}
