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
