import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/components/tip_two_card_view.dart';
import 'package:globaltrailblazersapp/components/tvzone_two_card_view.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TipTwoCardPageView(),
        TvzoneTwoCardPageView(),
      ],
    );
  }
}
