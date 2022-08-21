import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/components/delivery_controller.dart';

import '../../../../constants/colors.dart';

class TextWidgetProduct extends StatefulWidget {
  const TextWidgetProduct(
      {Key? key, required this.textInputType, required this.text})
      : super(key: key);
  final TextInputType textInputType;
  final String text;
  @override
  State<TextWidgetProduct> createState() => _TextWidgetProductState();
}

class _TextWidgetProductState extends State<TextWidgetProduct> {
  final _deliveryController = Get.find<DeliveryController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.location_on,
            color: primaryColor,
            size: 45,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("  ${widget.text}"),
                TextFormField(
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
                  onChanged: (value) {
                    if (widget.textInputType == TextInputType.phone) {
                      _deliveryController
                          .changeCellPhone(value.removeAllWhitespace);
                    } else {
                      _deliveryController.changeLocation(value);
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
