import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:genint/globals/colors.dart';
import 'package:genint/globals/decorations.dart';
import 'package:genint/globals/labels.dart';
import 'package:genint/globals/logic.dart';
import 'package:genint/globals/misc.dart';
import 'package:genint/globals/styles.dart';
import 'package:genint/messages/login_response.dart';
import 'package:genint/messages/shared_model.dart';
import 'package:genint/widgets/main_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

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

  Future<void> loginRequest(SharedModel sharedModel) async {
    //sharedModel.appContent = MockAppContent();

    String userName = _userNameController.text;
    String password = _passwordController.text;

    if (userName.isEmpty || password.isEmpty) {
      GLogic.showErrorSnackBar(
          message: GLabels.missingCredentials, context: context);
      return;
    }

    String passwordHash = md5.convert(utf8.encode(password)).toString();

    try {
      http.Response httpResponse = await http.get(Uri.parse(
          "${GMisc.loginUrlProd}?userName=$userName&passwordHash=$passwordHash"));

      Map<String, dynamic> httpResponseMap = jsonDecode(httpResponse.body);
      LoginResponse loginResponse = LoginResponse.fromMap(httpResponseMap);

      if (loginResponse.success == false) {
        if (context.mounted) {
          GLogic.showErrorSnackBar(
              message: loginResponse.message ?? GLabels.serverError,
              // ignore: use_build_context_synchronously
              context: context);
        }
      } else {
        if (loginResponse.record == null) {
          if (context.mounted) {
            GLogic.showErrorSnackBar(
                message: loginResponse.message ?? GLabels.loginFailed,
                // ignore: use_build_context_synchronously
                context: context);
          }
        } else if (context.mounted) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) {
              return MainPage(appContentElementView: loginResponse.record!);
            },
          ), (_) => false);
        }
      }
    } catch (ex) {
      if (context.mounted) {
        GLogic.showErrorSnackBar(
            message: GLabels.serverError,
            // ignore: use_build_context_synchronously
            context: context);
      }
    }

    return;
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
                      child: TextFormField(
                        controller: _userNameController,
                        style: GStyles.loginTextFieldStyle,
                        textAlign: TextAlign.center,
                        decoration: GDecorations.loginTextFieldDecoration(
                            GLabels.userName),
                        onFieldSubmitted: (value) async {
                          await loginRequest(sharedModel);
                        },
                      )),
                  const SizedBox(width: 500, child: Divider()),
                  SizedBox(
                      width: 500,
                      child: TextFormField(
                        controller: _passwordController,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        style: GStyles.loginTextFieldStyle,
                        decoration: GDecorations.loginTextFieldDecoration(
                            GLabels.password),
                        onFieldSubmitted: (value) async {
                          await loginRequest(sharedModel);
                        },
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
