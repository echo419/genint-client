import 'package:flutter/material.dart';
import 'package:genint/messages/shared_model.dart';
import 'package:genint/widgets/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => SharedModel(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GenInt Aftermath',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    ),
  ));
}
