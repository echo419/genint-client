import 'package:flutter/material.dart';
import 'package:genesys_interview/globals/decorations.dart';
import 'package:genesys_interview/globals/misc.dart';
import 'package:genesys_interview/globals/styles.dart';
import 'package:genesys_interview/messages/app_content_element_view.dart';
import 'package:genesys_interview/widgets/main_page.dart';
import 'package:url_launcher/url_launcher.dart';

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

  RichText get contentRichText {
    if (widget.appContentElementView.text == null ||
        widget.appContentElementView.text!.isEmpty) {
      return RichText(text: const TextSpan(children: []));
    }

    List<InlineSpan> mainSpanArray = [];
    String currentPlainText = "";

    for (var element in widget.appContentElementView.text!.split(" ")) {
      if (isImageLink(element)) {
        mainSpanArray.add(TextSpan(
            text: currentPlainText,
            style: GStyles.appContentWidgetElementStyle));
        currentPlainText = " ";
        mainSpanArray.add(WidgetSpan(
            child: GestureDetector(
          onTap: () {
            launchUrl(Uri.parse(element));
          },
          child: MouseRegion(
            cursor: MaterialStateMouseCursor.clickable,
            child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(8),
              decoration: GDecorations.contentImageDecoration,
              child: Image.network(element),
            ),
          ),
        )));
      } else {
        currentPlainText += "$element ";
      }
    }

    if (currentPlainText.trim().isNotEmpty) {
      mainSpanArray.add(TextSpan(
          text: currentPlainText, style: GStyles.appContentWidgetElementStyle));
    }

    return RichText(
        text: TextSpan(
            children: mainSpanArray,
            style: GStyles.appContentWidgetElementStyle));
  }

  bool isImageLink(String element) {
    if (!element.startsWith("http") && !element.startsWith("https")) {
      return false;
    }

    // at this point we know it starts with any of the valid prefixes, we can safely exit if we catch any image extension ending
    for (var extension in GMisc.imageExtensions) {
      if (element.endsWith(extension)) return true;
    }

    return false;
  }

  Widget get baseWidget {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:
            _mouseEntered ? GDecorations.mouseEnteredBoxDecoration : null,
        //color: _mouseEntered ? GColors.defaultAmberLight : null,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                widget.appContentElementView.icon,
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: contentRichText,
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
