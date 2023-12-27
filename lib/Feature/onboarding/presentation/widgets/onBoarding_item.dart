import 'package:chat_gpt/Feature/onboarding/presentation/widgets/page_view_iteam.dart';
import 'package:chat_gpt/core/utils/styles.dart';
import 'package:flutter/material.dart';

class InboardingItem extends StatelessWidget {
  const InboardingItem({super.key, required this.model});
  final OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(model.image!),
          width: 20,
          height: 20,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          model.title.toString(),
          style: StylesData.logoStyle
              .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 12, bottom: 12, right: 24, left: 24),
          decoration: BoxDecoration(
              color: const Color(0xff444550),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            model.txt1.toString(),
            style: StylesData.logoStyle.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 12, bottom: 12, right: 26, left: 26),
          decoration: BoxDecoration(
              color: const Color(0xff444550),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            model.txt2.toString(),
            style: StylesData.logoStyle.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 12, bottom: 12, right: 26, left: 26),
          decoration: BoxDecoration(
              color: const Color(0xff444550),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            model.txt3.toString(),
            style: StylesData.logoStyle.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
