import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class ProceedButton extends StatelessWidget {
  const ProceedButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        "Proceed".toUpperCase(),
        style: const TextStyle(
            color: brandYellowColor,
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
    );
  }
}
