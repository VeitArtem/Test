import 'package:flutter/material.dart';
import 'package:flutter_test_task/const/size_config.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: appBarTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: inputDecorationTheme(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white), color: Colors.black);
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: BorderSide(color: Colors.white),
    gapPadding: 10,
  );

  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
