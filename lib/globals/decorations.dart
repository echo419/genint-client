import 'package:flutter/material.dart';
import 'package:genesys_interview/globals/colors.dart';

class GDecorations {
  static InputDecoration loginTextFieldDecoration(String label) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: GColors.defaultWhite,
        labelText: label,
        labelStyle: TextStyle(color: GColors.defaultBlack),
        floatingLabelStyle: TextStyle(color: GColors.defaultLightGrey),
        hintMaxLines: 2,
        hintTextDirection: TextDirection.rtl);
  }

  static BoxDecoration mouseEnteredBoxDecoration = BoxDecoration(
      color: GColors.defaultAmberLight,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(4, 4),
        ),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(20)));

  static Decoration mainContainerDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ]);

  static Decoration contentImageDecoration = BoxDecoration(
      color: Colors.black,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ]);
}
