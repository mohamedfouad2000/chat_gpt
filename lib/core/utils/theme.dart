// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// ThemeData lightTheme = ThemeData(
//   fontFamily: "Girls",

//   scaffoldBackgroundColor: Colors.white,
//   inputDecorationTheme: InputDecorationTheme(
//       focusedBorder: const OutlineInputBorder(
//         // borderRadius: BorderRadius.circular(6.0),
//         borderSide: BorderSide(
//           color: Colors.grey,
//         ),
//       ),
//       suffixIconColor: Colors.grey,
//       disabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: Colors.grey[300]!,
//         ),
//       ),
//       fillColor: Colors.grey,
//       hoverColor: Colors.grey,
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(6.0),
//         borderSide: const BorderSide(
//           color: Colors.white,
//         ),
//       ),
//       labelStyle: const TextStyle(color: Colors.grey),
//       iconColor: Colors.grey,
//       prefixIconColor: Colors.grey,
//       hintStyle: const TextStyle(color: Colors.grey)),

//   buttonTheme: const ButtonThemeData(
//     buttonColor: Colors.amber,
//     textTheme: ButtonTextTheme.primary,
//   ),

//   textButtonTheme: TextButtonThemeData(
//       style: ButtonStyle(
//     foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
//   )),
//   textTheme: const TextTheme(
//       labelLarge: TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.w400,
//         color: Colors.black,
//       ),
//       // subtitle1: TextStyle(
//       //   fontSize: 17,
//       //   color: Colors.red,
//       // ),
//       titleSmall: TextStyle(
//         fontSize: 17,
//         color: Colors.white,
//       ),
//       bodyLarge: TextStyle(
//         fontSize: 25,
//         fontWeight: FontWeight.w600,
//         color: Colors.black,
//       ),
//       bodyMedium: TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.w300,
//         color: Colors.black,
//       ),
//       displayLarge: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w300,
//         color: Colors.black87,
//       ),
//       displayMedium: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w300,
//         color: Colors.black87,
//       ),
//       bodySmall: TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.w600,
//         color: Colors.grey,
//       )),
//   cardColor: Colors.white,
//   cardTheme: const CardTheme(
//     elevation: 5,
//     shadowColor: Colors.grey,
//   ),
//   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       type: BottomNavigationBarType.fixed,
//       elevation: 5,
//       selectedIconTheme: IconThemeData(
//         color: primaryColor,
//       ),
//       unselectedIconTheme: IconThemeData(
//         color: Colors.grey,
//       ),
//       selectedItemColor: primaryColor,
//       unselectedItemColor: Colors.grey,
//       showUnselectedLabels: true),
//   unselectedWidgetColor: Colors.grey,
//   checkboxTheme: CheckboxThemeData(
//     fillColor:
//         MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
//       if (states.contains(MaterialState.disabled)) {
//         return null;
//       }
//       if (states.contains(MaterialState.selected)) {
//         return primaryColor;
//       }
//       return null;
//     }),
//   ),
//   radioTheme: RadioThemeData(
//     fillColor:
//         MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
//       if (states.contains(MaterialState.disabled)) {
//         return null;
//       }
//       if (states.contains(MaterialState.selected)) {
//         return primaryColor;
//       }
//       return null;
//     }),
//   ),
//   switchTheme: SwitchThemeData(
//     thumbColor:
//         MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
//       if (states.contains(MaterialState.disabled)) {
//         return null;
//       }
//       if (states.contains(MaterialState.selected)) {
//         return primaryColor;
//       }
//       return null;
//     }),
//     trackColor:
//         MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
//       if (states.contains(MaterialState.disabled)) {
//         return null;
//       }
//       if (states.contains(MaterialState.selected)) {
//         return primaryColor;
//       }
//       return null;
//     }),
//   ),
// );
