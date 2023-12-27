import 'package:chat_gpt/Feature/home/manager/home_cubit.dart';
import 'package:chat_gpt/Feature/home/manager/home_states.dart';
import 'package:chat_gpt/core/utils/assets_data.dart';
import 'package:chat_gpt/core/utils/colors.dart';
import 'package:chat_gpt/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_gpt/core/utils/components.dart';

class OptionList extends StatelessWidget {
  const OptionList({super.key, required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return Row(
          children: [
            Image(
              image: AssetImage(HomeCubit.get(context).islight
                  ? AssetsData.likeIconblack
                  : AssetsData.likeIcon),
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 16,
            ),
            Image(
              image: AssetImage(HomeCubit.get(context).islight
                  ? AssetsData.unLikeIconblack
                  : AssetsData.unLikeIcon),
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 40,
            ),
            Image(
              image: AssetImage(HomeCubit.get(context).islight
                  ? AssetsData.copyIconblack
                  : AssetsData.copyIcon),
              height: 12,
              width: 12,
            ),
            const SizedBox(
              width: 12,
            ),
            InkWell(
              onTap: () {
                Clipboard.setData(
                  ClipboardData(text: txt.trim()),
                );
                showToast(msg: "copy success");
              },
              child: Text(
                "Copy",
                style: StylesData.containerStyle
                    .copyWith(fontSize: 14, color: copyColor),
              ),
            ),
          ],
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
