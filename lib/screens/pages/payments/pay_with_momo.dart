import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';

import 'widgets/proceed_button.dart';
import 'widgets/text_field.dart';

class PayWithMomoWidget extends StatelessWidget {
  PayWithMomoWidget({
    Key? key,
  }) : super(key: key);
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) - 35,
      child: Column(
        children: [
          PaymentTextField(controller: _productController, label: "Product"),
          PaymentTextField(controller: _nameController, label: "Name"),
          PaymentTextField(controller: _phoneController, label: "Phone Number"),
          const SizedBox(height: 20),
          ProceedButton(onPressed: () {}),
        ],
      ),
    );
  }
}
