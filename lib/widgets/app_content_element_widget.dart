import 'package:flutter/material.dart';
import 'package:genesys_interview/messages/app_content_element_view.dart';
import 'package:genesys_interview/widgets/main_page.dart';

class AppContentElementWidget extends StatelessWidget {
  final AppContentElementView appContentElementView;

  const AppContentElementWidget(
      {super.key, required this.appContentElementView});

  Widget get baseWidget {
    return Row(
      children: [
        Icon(appContentElementView.icon),
        Text(appContentElementView.text ?? "")
      ],
    );
  }

  void widgetTapped(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return MainPage(appContentElementView: appContentElementView);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (appContentElementView.children == null ||
        appContentElementView.children!.isEmpty) {
      return baseWidget;
    }

    return GestureDetector(
        onTap: () {
          widgetTapped(context);
        },
        child: baseWidget);
  }
}
