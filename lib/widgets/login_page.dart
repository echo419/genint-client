import 'package:flutter/material.dart';
import 'package:genesys_interview/globals/colors.dart';
import 'package:genesys_interview/globals/decorations.dart';
import 'package:genesys_interview/globals/styles.dart';
import 'package:genesys_interview/messages/mock_app_content.dart';
import 'package:genesys_interview/messages/shared_model.dart';
import 'package:genesys_interview/widgets/main_page.dart';
import 'package:provider/provider.dart';

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

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        return MainPage(appContentElementView: MockAppContent());
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SharedModel>(builder: (context, sharedModel, child) {
      return Scaffold(
          backgroundColor: GColors.defaultWhite,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    width: 200,
                    height: 200,
                    child: Image(image: AssetImage("assets/genesys_logo.jpg"))),
                const Divider(),
                SizedBox(
                    width: 500,
                    child: TextField(
                      controller: _userNameController,
                      style: GStyles.loginTextFieldStyle,
                      textAlign: TextAlign.center,
                      decoration:
                          GDecorations.loginTextFieldDecoration("Username"),
                    )),
                const Divider(),
                SizedBox(
                    width: 500,
                    child: TextField(
                      controller: _passwordController,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      style: GStyles.loginTextFieldStyle,
                      decoration:
                          GDecorations.loginTextFieldDecoration("Password"),
                    )),
                const Divider()
              ],
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
