// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

const Color white = Color.fromARGB(255, 255, 255, 255);
const Color black = Color.fromARGB(255, 0, 0, 0);
const Color grey = Color.fromARGB(255, 92, 92, 92);
const Color fontColor = Color.fromARGB(255, 0, 0, 0);
const Color baseColor = Color.fromARGB(255, 24, 204, 244);
const Color red = Color.fromARGB(255, 251, 19, 19);

class Styles {
  static TextStyle TitleStyle =
      TextStyle(fontSize: 25, color: fontColor, fontWeight: FontWeight.bold);
  static TextStyle appBarTitleStyle =
      TextStyle(fontSize: 18, color: fontColor, fontWeight: FontWeight.bold);

  static TextStyle textStyle =
      TextStyle(fontSize: 15, color: fontColor, fontWeight: FontWeight.w700);
  static TextStyle buttonTextStyle =
      TextStyle(fontSize: 15, color: fontColor, fontWeight: FontWeight.w800);

  static BoxDecoration baseColorFrame = BoxDecoration(
    border: Border.all(
      color: baseColor,
      width: 3.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );
static BoxDecoration redColorFrame = BoxDecoration(
    border: Border.all(
      color: red,
      width: 3.0,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );
  static BoxDecoration homeImageDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        colors: [
          white.withOpacity(0.5),
          white.withOpacity(1),
        ],
        stops: const [
          0.0,
          1.0,
        ]),
  );

  static BoxDecoration searchConnectionDecoration = BoxDecoration(
    color: white,
    borderRadius: BorderRadius.circular(15),
    // gradient: Styles.TitleSty,
    boxShadow: [
      Styles.shadowCard,
    ],
  );
  static BoxShadow shadowCard = BoxShadow(
    color: grey, // シャドウの色
    spreadRadius: 2, // シャドウの拡がり具合
    blurRadius: 5, // シャドウのぼかし具合
    offset: Offset(0, 3), // シャドウの位置
  );
}
