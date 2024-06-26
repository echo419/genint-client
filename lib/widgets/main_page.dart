import 'package:flutter/material.dart';
import 'package:genint/globals/colors.dart';
import 'package:genint/globals/decorations.dart';
import 'package:genint/globals/styles.dart';
import 'package:genint/messages/app_content_element_view.dart';
import 'package:genint/messages/shared_model.dart';
import 'package:genint/widgets/app_content_element_widget.dart';
import 'package:genint/widgets/login_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  final AppContentElementView appContentElementView;

  const MainPage({super.key, required this.appContentElementView});

  void logout(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return const LoginPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedModel>(builder: (context, sharedModel, child) {
      return Container(
        color: GColors.defaultWhite,
        child: Center(
          child: Container(
            decoration: GDecorations.mainContainerDecoration,
            constraints: const BoxConstraints(minWidth: 500, maxWidth: 1024),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: GColors.defaultWhite,
                appBar: AppBar(
                  actions: [
                    Builder(
                        builder: (innerContext) => IconButton(
                            onPressed: () {
                              logout(context);
                            },
                            icon: const Icon(
                              Icons.logout,
                            ))),
                  ],
                  iconTheme: IconThemeData(
                    color: GColors.defaultWhite,
                  ),
                  centerTitle: true,
                  backgroundColor: GColors.defaultAmber,
                  title: Text(appContentElementView.title ?? "no title",
                      style: GStyles.mainTitleStyle),
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                          itemCount:
                              appContentElementView.children?.length ?? 0,
                          itemBuilder: (context, index) {
                            return AppContentElementWidget(
                                appContentElementView:
                                    appContentElementView.children![index]);
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: GColors.defaultAmber,
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
