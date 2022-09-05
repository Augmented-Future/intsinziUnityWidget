import 'package:flutter/material.dart';

import '../shared/colors.dart';

class QuickAccessItem {
  int id;
  String text;
  Color color;
  String imgUrl;
  VoidCallback action;

  QuickAccessItem(
      {required this.action,
      required this.color,
      required this.id,
      required this.imgUrl,
      required this.text});
}

List<QuickAccessItem> quickAccessItems = [
  QuickAccessItem(
    action: () {},
    color: color100,
    id: 1,
    imgUrl: 'assets/images/keza.png',
    text:
        "Learn with me the touristic sites of Rwanda in The ABCs of Rwanda book",
  ),
  QuickAccessItem(
    action: () {},
    color: brandYellowColor,
    id: 2,
    imgUrl: 'assets/images/keza.png',
    text: "Number four is the only one with the same amount of letters.",
  ),
  QuickAccessItem(
    action: () {},
    color: Colors.green,
    id: 3,
    imgUrl: 'assets/images/keza.png',
    text: "No word in the dictionary rhyme with the word orange.",
  ),
];
