// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:Tasawe7/controller/core/constants/color.dart';



ThemeData lightTheme =  ThemeData(
  brightness: Brightness.light,
  fontFamily: 'ElMessiri',
  primaryColor: Colors.blue,
  splashColor: Colors.blue,
  primarySwatch: Colors.blue,
  textTheme:  TextTheme(
        bodyLarge: TextStyle(color: AppColor.ColorText),
        bodyMedium: TextStyle(color: AppColor.ColorText),
        bodySmall: TextStyle(color: AppColor.ColorText),
      ),
      inputDecorationTheme:  InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: outlineInputBorderW,
        focusedBorder: outlineInputBorderW,
        border: outlineInputBorderW,
      ),
  
);

ThemeData darkTheme =  ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'ElMessiri',
  primaryColor: Colors.blue,
  splashColor: Colors.blue,
  primarySwatch: Colors.blue,
   textTheme:  TextTheme(
        bodyLarge: TextStyle(color: AppColor.ColorTextB),
        bodyMedium: TextStyle(color: AppColor.ColorTextB),
        bodySmall: TextStyle(color: AppColor.ColorTextB),
      ),
      inputDecorationTheme:  InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: outlineInputBorderB,
        focusedBorder: outlineInputBorderB,
        border: outlineInputBorderB,
      ),
  
);



 OutlineInputBorder outlineInputBorderW = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(28)),
  borderSide: BorderSide(color: AppColor.ColorText),
  gapPadding: 10,
);


 OutlineInputBorder outlineInputBorderB = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(28)),
  borderSide: BorderSide(color: AppColor.ColorTextB),
  gapPadding: 10,
);