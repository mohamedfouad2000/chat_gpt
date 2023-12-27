import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/Feature/home/presentation/home_page.dart';
import 'package:chat_gpt/core/utils/assets_data.dart';
import 'package:chat_gpt/core/utils/components.dart';
import 'package:chat_gpt/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CustoomConverstionAppBar extends StatelessWidget {
  CustoomConverstionAppBar({super.key, this.indexOfModel});
  int? indexOfModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 22,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 22, right: 22, top: 22, bottom: 22),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (HomeCubit.get(context).chatList.length % 2 == 0) {
                          HomeCubit.get(context)
                              .addNewChat(index: indexOfModel)
                              .then((value) {
                            Nav(context, const HomePage());
                          });
                        }
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                        weight: 6.75,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                        child: Text("Back", style: StylesData.titleStyle)),
                    Image(
                      image: AssetImage(HomeCubit.get(context).islight
                          ? AssetsData.vectorBlack
                          : AssetsData.vector),
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
              Container(
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
