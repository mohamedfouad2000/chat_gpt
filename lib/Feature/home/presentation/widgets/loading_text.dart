import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/core/utils/assets_data.dart';
import 'package:chat_gpt/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class LoadingText extends StatelessWidget {
  const LoadingText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              // padding: const EdgeInsets.all(14.0),
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
              child: Lottie.asset(
                width: 61,
                height: 43,
                fit: BoxFit.fill,
                AssetsData.loadingText,
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
