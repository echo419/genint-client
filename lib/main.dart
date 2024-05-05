import 'package:flutter/material.dart';
import 'package:genesys_interview/messages/shared_model.dart';
import 'package:genesys_interview/widgets/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => SharedModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Genesys Interview',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    ),
  ));
}
