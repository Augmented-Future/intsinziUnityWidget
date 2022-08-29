import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import 'components/animations_card_view.dart';
import 'quick_access_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: grayColor200.withOpacity(0.15),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Coucou, \nWelcome back to the\nhome of engaging\nlearning",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              Column(
                children: [
                  const Text("Tutoring"),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(top: 2),
                    decoration: const BoxDecoration(color: whiteColor),
                    child: const Text("3"),
                  )
                ],
              )
            ],
          ),
        ),
        const QuickAccessView(),
        const AnimationsCardView(),
      ],
    );
  }
}
