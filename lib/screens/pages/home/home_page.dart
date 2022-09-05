import 'package:flutter/material.dart';

import '../../../shared/colors.dart';
import 'components/animations_card_view.dart';
import 'quick_access.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: grayColor200.withOpacity(0.15),
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Coucou, \nWelcome back to the\nhome of engaging\nlearning",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
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
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            'Quick Access',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorPurple,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const QuickAccessView(),
        const AnimationsCardView(),
      ],
    );
  }
}
