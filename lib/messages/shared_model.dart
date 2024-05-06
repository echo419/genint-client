import 'package:flutter/material.dart';
import 'package:genint/messages/app_content_element_view.dart';

class SharedModel extends ChangeNotifier {
  AppContentElementView? _appContent;

  set appContent(AppContentElementView newAppContent) {
    _appContent = newAppContent;
    notifyListeners();
  }

  AppContentElementView get appContent {
    return _appContent ?? AppContentElementView(text: "[not initialised]");
  }
}
