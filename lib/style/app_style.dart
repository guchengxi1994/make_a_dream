import 'package:flutter/material.dart';

class AppStyle {
  AppStyle._();
  static const appColor = Color.fromARGB(255, 132, 142, 209);

  static const InputDecoration inputDecoration = InputDecoration(
      errorStyle: TextStyle(height: 0),
      hintStyle:
          TextStyle(color: Color.fromARGB(255, 159, 159, 159), fontSize: 12),
      contentPadding: EdgeInsets.only(left: 10, bottom: 15),
      border: InputBorder.none,
      // focusedErrorBorder:
      //     OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
      focusedErrorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: AppStyle.appColor)),
      errorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
      focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: AppStyle.appColor)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 159, 159, 159))));

  static InputDecoration inputDecorationWithHint(String hint,
      {double fontSize = 12}) {
    return InputDecoration(
        hintText: hint,
        errorStyle: const TextStyle(height: 0),
        hintStyle: TextStyle(
            color: const Color.fromARGB(255, 159, 159, 159),
            fontSize: fontSize),
        contentPadding: const EdgeInsets.only(left: 10, bottom: 15),
        border: InputBorder.none,
        // focusedErrorBorder:
        //     OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppStyle.appColor)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppStyle.appColor)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 159, 159, 159))));
  }
}
