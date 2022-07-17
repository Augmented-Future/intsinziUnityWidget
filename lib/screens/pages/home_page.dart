import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/screens/pages/components/tip_two_card_view.dart';
import 'package:globaltrailblazersapp/screens/pages/components/animations_card_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TipTwoCardPageView(),
        AnimationsCardView(),
      ],
    );
  }
}
