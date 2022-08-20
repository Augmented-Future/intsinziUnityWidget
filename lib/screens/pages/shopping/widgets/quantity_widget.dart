import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget(
      {Key? key,
      required this.decrease,
      required this.increase,
      required this.quantity})
      : super(key: key);
  final VoidCallback increase;
  final VoidCallback decrease;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: decrease,
          borderRadius: BorderRadius.circular(30),
          child: Ink(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.remove,
              size: 28,
              color: whiteColor,
            ),
          ),
        ),
        Text(
          " $quantity ",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        InkWell(
          onTap: increase,
          borderRadius: BorderRadius.circular(30),
          child: Ink(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.add,
              size: 28,
              color: whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
