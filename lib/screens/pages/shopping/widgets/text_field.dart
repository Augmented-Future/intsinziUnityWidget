import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class TextWidgetProduct extends StatefulWidget {
  const TextWidgetProduct(
      {Key? key,
      required this.controller,
      required this.textInputType,
      required this.text})
      : super(key: key);
  final TextEditingController controller;
  final TextInputType textInputType;
  final String text;
  @override
  State<TextWidgetProduct> createState() => _TextWidgetProductState();
}

class _TextWidgetProductState extends State<TextWidgetProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.location_on,
            color: primaryColor,
            size: 38,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("  ${widget.text}"),
                TextFormField(
                  controller: widget.controller,
                  cursorColor: softBlack,
                  keyboardType: widget.textInputType,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: softBlack),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
