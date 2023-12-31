import 'package:chat_gpt/core/utils/colors.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:ecommers/core/utils/size_config.dart';
// import 'package:ecommers/core/utils/size_config.dart';

Widget defaultButton({required VoidCallback fun, required textWidget}) =>
    Container(
      decoration: BoxDecoration(
          color: kMainColor, borderRadius: BorderRadius.circular(10)),
      height: 60,
      width: double.infinity,
      child: TextButton(
        onPressed: fun,
        child: textWidget,
      ),
    );

Widget customTextFiled(
        {required TextEditingController controller,
        required TextStyle textstyle,
        TextInputType type = TextInputType.name,
        var ontapFun,
        bool enabled = true,
        int maxLines = 1}) =>
    TextField(
      enabled: enabled,
      controller: controller,
      onTap: ontapFun,
      onSubmitted: (v) {
        ontapFun;
      },
      maxLines: maxLines,
      keyboardType: type,
      style: textstyle,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),

        // labelText: 'Password',
      ),
    );
Widget customTextFormedFiled({
  required cursorColor,
  required controller,
  TextInputType type = TextInputType.name,
  IconData? preicon,
  bool obscureText = false,
  String val = "",
  var sufficon,
  String? hintText,
  var sufFunction,
}) =>
    TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: type,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return val;
        } else {
          return null;
        }
      },
      cursorColor: cursorColor,
      decoration: const InputDecoration(
          hoverColor: Colors.white,
          border: InputBorder.none,
          focusColor: Colors.white,
          labelStyle: TextStyle(color: Colors.white, fontSize: 16.0)),
    );

void showToast({
  required msg,
}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: kMainColor,
        textColor: Colors.white,
        fontSize: 16.0);

NavegatorPush(context, page) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (builder) => page),
  );
}

Nav(context, page) {
  return Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (builder) => page), (route) => false);
}

Widget eroorFieds() => Container(
      width: double.infinity,
      height: 30,
      color: Colors.red,
      child: const Text(
        "Please Enter All Fileds ",
        // style: StylesData.titleInfo.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
