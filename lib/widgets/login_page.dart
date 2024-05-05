import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:genesys_interview/globals/colors.dart';
import 'package:genesys_interview/globals/decorations.dart';
import 'package:genesys_interview/globals/labels.dart';
import 'package:genesys_interview/globals/styles.dart';
import 'package:genesys_interview/messages/mock_app_content.dart';
import 'package:genesys_interview/messages/shared_model.dart';
import 'package:genesys_interview/widgets/main_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _userNameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
  }

  loginRequest(SharedModel sharedModel) {
    //sharedModel.appContent = MockAppContent();

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return MainPage(appContentElementView: MockAppContent());
      },
    ), (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedModel>(builder: (context, sharedModel, child) {
      return Scaffold(
          backgroundColor: GColors.defaultWhite,
          body: Center(
            child: Container(
              constraints: const BoxConstraints(minWidth: 500, maxWidth: 1024),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 200,
                      child: MouseRegion(
                        cursor: MaterialStateMouseCursor.clickable,
                        child: GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse("https://www.genesys.com/"));
                          },
                          child: const Image(
                              image: AssetImage("assets/genesys_logo_02.png")),
                        ),
                      )),
                  Text(
                    GLabels.subTitle,
                    style: GStyles.loginSubtitleStyle,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const SizedBox(width: 500, child: Divider()),
                  SizedBox(
                      width: 500,
                      child: TextField(
                        controller: _userNameController,
                        style: GStyles.loginTextFieldStyle,
                        textAlign: TextAlign.center,
                        decoration: GDecorations.loginTextFieldDecoration(
                            GLabels.userName),
                      )),
                  const SizedBox(width: 500, child: Divider()),
                  SizedBox(
                      width: 500,
                      child: TextField(
                        controller: _passwordController,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        style: GStyles.loginTextFieldStyle,
                        decoration: GDecorations.loginTextFieldDecoration(
                            GLabels.password),
                      )),
                  const SizedBox(width: 500, child: Divider()),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 10,
            backgroundColor: GColors.defaultAmber,
            foregroundColor: GColors.defaultWhite,
            onPressed: () async {
              await loginRequest(sharedModel);
            },
            child: Icon(
              Icons.login,
              size: 30,
              shadows: [
                Shadow(
                    color: GColors.defaultBlack,
                    blurRadius: 2,
                    offset: const Offset(1, 1))
              ],
            ),
          ));
    });
  }
}
