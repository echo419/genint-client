import 'package:flutter/material.dart';
import 'package:genesys_interview/globals/colors.dart';

class GStyles {
  static TextStyle titleStyle =
      const TextStyle(fontFamily: "Verdana", fontSize: 20);

  static TextStyle loginTextFieldStyle = TextStyle(
    fontSize: 20.0,
    color: GColors.defaultBlack,
    fontFamily: "Verdana",
  );

  static TextStyle appContentWidgetElementStyle = TextStyle(
      fontSize: 16.0,
      color: GColors.defaultBlack,
      fontFamily: "Verdana",
      fontWeight: FontWeight.w200);

  static TextStyle loginSubtitleStyle = TextStyle(
      fontSize: 16.0,
      color: GColors.defaultBlack,
      fontFamily: "Verdana",
      shadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(10, 10),
        )
      ],
      fontWeight: FontWeight.w200);

  static TextStyle mainTitleStyle = TextStyle(
    fontSize: 20.0,
    color: GColors.defaultWhite,
    fontFamily: "Verdana",
    fontWeight: FontWeight.bold,
    shadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3),
      )
    ],
  );
}
