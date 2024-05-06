import 'package:flutter/material.dart';
import 'package:genint/globals/colors.dart';

class GLogic {
  static void showErrorSnackBar(
      {required String message, required BuildContext context}) {
    showSnackBar(
        context: context,
        backgroundColor: GColors.errorRed,
        textColor: GColors.defaultWhite,
        message: message);
  }

  static void showSuccessSnackBar(
      {required String message, required BuildContext context}) {
    showSnackBar(
        context: context,
        backgroundColor: GColors.successGreen,
        textColor: GColors.defaultWhite,
        message: message);
  }

  static void showWarningSnackBar(
      {required String message, required BuildContext context}) {
    showSnackBar(
        context: context,
        backgroundColor: GColors.defaultAmber,
        textColor: GColors.defaultWhite,
        message: message);
  }

  static void showSnackBar(
      {required Color backgroundColor,
      required Color textColor,
      required String message,
      required BuildContext context}) {
    SnackBar snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        textAlign: TextAlign.center,
        message,
        style: TextStyle(
            color: textColor,
            fontFamily: "Verdana",
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
