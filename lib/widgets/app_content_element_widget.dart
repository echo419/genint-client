import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        Expanded(child: Text(appContentElementView.text ?? ""))
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

  void widgetTappedAnimation(BuildContext context) {
    Navigator.of(context).push(
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
      return MainPage(appContentElementView: appContentElementView);
    }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.decelerate;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    if (appContentElementView.children == null ||
        appContentElementView.children!.isEmpty) {
      return baseWidget;
    }

    return GestureDetector(
        onTap: () {
          widgetTappedAnimation(context);
        },
        child: baseWidget);
  }
}
