import 'package:flutter/material.dart';
import 'package:genesys_interview/globals/colors.dart';
import 'package:genesys_interview/globals/styles.dart';
import 'package:genesys_interview/messages/app_content_element_view.dart';
import 'package:genesys_interview/widgets/main_page.dart';

class AppContentElementWidget extends StatefulWidget {
  final AppContentElementView appContentElementView;

  const AppContentElementWidget(
      {super.key, required this.appContentElementView});

  @override
  State<AppContentElementWidget> createState() =>
      _AppContentElementWidgetState();
}

class _AppContentElementWidgetState extends State<AppContentElementWidget> {
  bool _mouseEntered = false;

  Widget get baseWidget {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: _mouseEntered ? GColors.defaultAmberLight : null,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(widget.appContentElementView.icon),
            ),
            Expanded(
                child: Text(
              widget.appContentElementView.text ?? "",
              style: GStyles.appContentWidgetElementStyle,
            ))
          ],
        ),
      ),
    );
  }

  void widgetTapped(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return MainPage(appContentElementView: widget.appContentElementView);
      },
    ));
  }

  void widgetTappedAnimation(BuildContext context) {
    Navigator.of(context).push(
        PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
      return MainPage(appContentElementView: widget.appContentElementView);
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

  void mouseEntered() {
    setState(() {
      _mouseEntered = true;
    });
  }

  void mouseLeft() {
    setState(() {
      _mouseEntered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.appContentElementView.children == null ||
        widget.appContentElementView.children!.isEmpty) {
      return baseWidget;
    }

    return MouseRegion(
      onEnter: (event) {
        mouseEntered();
      },
      onExit: (event) {
        mouseLeft();
      },
      cursor: MaterialStateMouseCursor.clickable,
      child: GestureDetector(
          onTap: () {
            widgetTappedAnimation(context);
          },
          child: baseWidget),
    );
  }
}
