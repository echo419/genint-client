import 'package:flutter/material.dart';
import 'package:genint/messages/app_content_element_view.dart';

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
                          text:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                              "Mattis rhoncus urna neque viverra justo nec ultrices. Blandit cursus risus at ultrices mi tempus imperdiet."
                              "Vitae suscipit tellus mauris a diam. Fringilla ut morbi tincidunt augue interdum velit euismod in."
                              "Fringilla ut morbi tincidunt augue interdum. Pretium viverra suspendisse potenti nullam."
                              "Bibendum arcu vitae elementum curabitur. In mollis nunc sed id semper risus. Amet porttitor eget dolor morbi non arcu."
                              "Tristique senectus et netus et malesuada fames ac turpis. Volutpat maecenas volutpat blandit aliquam etiam."
                              "In nisl nisi scelerisque eu ultrices. Aliquet nec ullamcorper sit amet."
                              "Lectus quam id leo in vitae. Id faucibus nisl tincidunt eget nullam non.\n\n"
                              "sample cat image:\n "
                              "https://cdn.pixabay.com/photo/2020/05/20/08/27/cat-5195431_1280.jpg \n"
                              "Quam id leo in vitae turpis massa sed elementum tempus. Amet tellus cras adipiscing enim."
                              "Tempor commodo ullamcorper a lacus vestibulum sed arcu non odio. Arcu non sodales neque sodales ut etiam sit amet."
                              "Ante in nibh mauris cursus mattis molestie a iaculis. Duis at consectetur lorem donec massa sapien."
                              "Non quam lacus suspendisse faucibus. Sit amet risus nullam eget felis."
                              "Ac feugiat sed lectus vestibulum mattis ullamcorper velit. Tempor orci eu lobortis elementum."
                              "Lacus laoreet non curabitur gravida arcu. Vel eros donec ac odio tempor orci dapibus ultrices."
                              "Velit laoreet id donec ultrices. Dis parturient montes nascetur ridiculus mus mauris vitae ultricies leo."
                              "Pellentesque elit ullamcorper dignissim cras tincidunt lobortis feugiat vivamus at."
                              "Orci eu lobortis elementum nibh tellus molestie nunc non. Dolor morbi non arcu risus quis."
                              "Egestas fringilla phasellus faucibus scelerisque eleifend donec. Suspendisse ultrices gravida dictum fusce"
                              "ut placerat orci nulla. Nulla aliquet porttitor lacus luctus accumsan tortor posuere."
                              "Curabitur gravida arcu ac tortor. Odio facilisis mauris sit amet massa vitae tortor condimentum."
                              "Consectetur adipiscing elit ut aliquam. Enim neque volutpat ac tincidunt vitae semper quis lectus nulla."
                              "Elementum pulvinar etiam non quam lacus. Tellus at urna condimentum mattis pellentesque."
                              "Parturient montes nascetur ridiculus mus mauris vitae ultricies. Magna sit amet purus gravida quis blandit turpis cursus in."
                              "Sagittis orci a scelerisque purus semper. Velit dignissim sodales ut eu sem integer vitae justo eget."
                              "Feugiat nisl pretium fusce id velit. Vitae tortor condimentum lacinia quis vel eros."
                              "Egestas congue quisque egestas diam in. Feugiat scelerisque varius morbi enim nunc faucibus a pellentesque sit."
                              "Urna nec tincidunt praesent semper feugiat nibh. Tincidunt dui ut ornare lectus. Nisl nunc mi ipsum faucibus vitae."
                              "Magna fermentum iaculis eu non diam phasellus vestibulum. Sed adipiscing diam donec adipiscing tristique risus."
                              "Ut venenatis tellus in metus. Tristique nulla aliquet enim tortor. Enim neque volutpat ac tincidunt vitae semper quis lectus."
                              "Consectetur libero id faucibus nisl tincidunt eget nullam non nisi. Eu ultrices vitae auctor eu augue ut lectus arcu. Condimentum id venenatis a condimentum vitae sapien pellentesque. Eu facilisis sed odio morbi quis commodo odio aenean. Ac placerat vestibulum lectus mauris ultrices. Sollicitudin aliquam ultrices sagittis orci a scelerisque. Sed vulputate odio ut enim blandit volutpat maecenas volutpat. Aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Pretium aenean pharetra magna ac."
                              "Et ultrices neque ornare aenean euismod. Consectetur adipiscing elit pellentesque habitant morbi tristique."
                              "Diam ut venenatis tellus in. Est lorem ipsum dolor sit. Adipiscing elit ut aliquam purus."
                              "Libero justo laoreet sit amet cursus sit. Varius vel pharetra vel turpis nunc eget. Mauris in aliquam sem fringilla ut morbi."
                              "Blandit aliquam etiam erat velit. Donec enim diam vulputate ut pharetra. Imperdiet dui accumsan"
                              "sit amet nulla facilisi morbi tempus iaculis. Justo laoreet sit amet cursus sit amet dictum sit amet.",
                          icon: Icons.ac_unit_sharp)
                    ])
              ]),
          AppContentElementView(text: "text-02")
        ]);
}
