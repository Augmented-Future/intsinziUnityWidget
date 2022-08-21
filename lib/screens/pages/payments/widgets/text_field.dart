import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';

import '../../../../constants/colors.dart';

class PaymentTextField extends StatelessWidget {
  const PaymentTextField(
      {Key? key,
      required this.controller,
      required this.label,
      this.short,
      this.initialText})
      : super(key: key);
  final TextEditingController controller;
  final String label;
  final bool? short;
  final String? initialText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: short == true ? screenWidth(context) / 3 : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Text(
              label,
              style: const TextStyle(
                color: softBlack,
                fontSize: 18.0,
              ),
            ),
          ),
          TextFormField(
            cursorColor: softBlack,
            controller: controller,
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                color: softBlack,
              ),
              fillColor: whiteColor,
              filled: true,
              contentPadding: const EdgeInsets.all(18),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: softBlack,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: softBlack,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
