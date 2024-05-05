import 'package:flutter/material.dart';
import 'package:genesys_interview/messages/app_content_element_view.dart';

class MockAppContent extends AppContentElementView {
  MockAppContent()
      : super(title: "Table of Contents", children: [
          AppContentElementView(
              title: "title-01",
              text: "text-01",
              icon: Icons.abc,
              children: [
                AppContentElementView(text: "text-01-01"),
                AppContentElementView(
                    title: "title-01-02",
                    text: "text-01-02",
                    children: [
                      AppContentElementView(
                          text: "text-01-02-01", icon: Icons.ac_unit_sharp)
                    ])
              ]),
          AppContentElementView(text: "text-02")
        ]);
}
