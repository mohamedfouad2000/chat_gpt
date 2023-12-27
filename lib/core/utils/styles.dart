import 'package:chat_gpt/core/utils/colors.dart';
import 'package:flutter/material.dart';

abstract class StylesData {
  static TextStyle logoStyle = TextStyle(
    fontSize: 40,
    color: kTextColor,
    fontWeight: FontWeight.w700,
  );

  static const titleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static const buttonText =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  static const listTitleText =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle containerStyle =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: knewColor);

  static TextStyle regenerateStyle =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
}
