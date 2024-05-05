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
}
