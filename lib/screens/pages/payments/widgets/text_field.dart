import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';

import '../../../../shared/colors.dart';

class PaymentTextField extends StatelessWidget {
  const PaymentTextField(
      {Key? key,
      required this.controller,
      required this.label,
      this.short,
      this.initialText,
      this.textInputType,
      this.inputFormatters,
      this.showCursor,
      required this.hintText,
      this.focusNode})
      : super(key: key);
  final TextEditingController controller;
  final String label;
  final bool? short;
  final String? initialText;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? showCursor;
  final String hintText;
  final FocusNode? focusNode;

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
            inputFormatters: inputFormatters,
            keyboardType: textInputType,
            showCursor: showCursor,
            enabled: showCursor,
            focusNode: focusNode,
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                color: softBlack,
              ),
              fillColor: whiteColor,
              filled: true,
              hintText: hintText,
              hintStyle: const TextStyle(color: Color(0xFFD6D6D6)),
              contentPadding: const EdgeInsets.all(18),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: softBlack,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: primaryColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: grayColor200,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              suffixIcon: showCursor != null && showCursor == false
                  ? const Icon(Icons.check)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
