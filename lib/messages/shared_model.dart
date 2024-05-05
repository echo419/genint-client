import 'package:flutter/material.dart';
import 'package:genesys_interview/messages/app_content_element_view.dart';

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
