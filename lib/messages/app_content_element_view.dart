import 'package:flutter/material.dart';

class AppContentElementView {
  final String? title;
  final List<AppContentElementView>? children;
  final String? text;
  final IconData? icon;

  AppContentElementView({this.children, this.text, this.icon, this.title});

  static IconData? getIconData(String? icon) {
    switch (icon) {
      case "error":
        return Icons.error;

      case "person":
        return Icons.person;

      default:
        return null;
    }
  }

  factory AppContentElementView.fromMap(Map<String, dynamic> map) {
    final title = map["title"] as String?;
    final text = map["text"] as String?;
    final icon = map["icon"] as String?;
    final children = map["children"] as List<dynamic>?;

    return AppContentElementView(
        title: title,
        text: text,
        icon: getIconData(icon),
        children: children
            ?.map(
                (e) => AppContentElementView.fromMap(e as Map<String, dynamic>))
            .toList());
  }
}
