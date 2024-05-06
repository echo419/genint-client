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

      case "code":
        return Icons.code;

      case "network":
        return Icons.wifi;

      case "network2":
        return Icons.network_check;

      case "question_mark":
        return Icons.question_mark;

      case "design":
        return Icons.design_services;

      case "document":
        return Icons.edit_document;

      case "dollar":
        return Icons.request_page;

      case "feedback":
        return Icons.announcement;

      case "note":
        return Icons.note;

      case "privacy":
        return Icons.privacy_tip;

      case "building":
        return Icons.construction;

      case "cloud":
        return Icons.cloud_rounded;

      case "location":
        return Icons.location_on;

      case "arrow":
        return Icons.keyboard_double_arrow_right;

      case "maintenance":
        return Icons.build;

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
