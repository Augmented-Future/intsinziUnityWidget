import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/screens/pages/payments/widgets/proceed_button.dart';
import 'package:globaltrailblazersapp/screens/pages/payments/widgets/text_field.dart';

class PayWithCardWidget extends StatelessWidget {
  PayWithCardWidget({
    Key? key,
  }) : super(key: key);
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _expdateController = TextEditingController();
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) - 35,
      child: Column(
        children: [
          PaymentTextField(
            controller: _productController,
            label: "Product",
          ),
          PaymentTextField(
            controller: _nameController,
            label: "Names on card",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PaymentTextField(
                controller: _expdateController,
                label: "Exp Date",
                short: true,
              ),
              PaymentTextField(
                controller: _cvvController,
                label: "CVV",
                short: true,
              ),
            ],
          ),
          const SizedBox(height: 20),
          ProceedButton(
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
