import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Image.asset("/assets/genesys_logo.jpg"),
              const Text("text01")
            ],
          ),
        ));
  }
}
