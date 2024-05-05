import 'package:flutter/material.dart';
import 'package:genesys_interview/globals/colors.dart';
import 'package:genesys_interview/messages/app_content_element_view.dart';
import 'package:genesys_interview/messages/shared_model.dart';
import 'package:genesys_interview/widgets/app_content_element_widget.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  final AppContentElementView appContentElementView;

  const MainPage({super.key, required this.appContentElementView});

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedModel>(builder: (context, sharedModel, child) {
      return Container(
        color: GColors.defaultWhite,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(appContentElementView.title ?? "no title"),
            ),
            backgroundColor: GColors.defaultWhite,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: appContentElementView.children?.length ?? 0,
                      itemBuilder: (context, index) {
                        return AppContentElementWidget(
                            appContentElementView:
                                appContentElementView.children![index]);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
