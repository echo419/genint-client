import 'package:flutter/material.dart';

class AppContentElementView {
  final String? title;
  final List<AppContentElementView>? children;
  final String? text;
  final IconData? icon;

  AppContentElementView({this.children, this.text, this.icon, this.title});
}
