import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/product_pay.dart';

import 'widgets/proceed_button.dart';
import 'widgets/text_field.dart';

class PayWithMomoWidget extends StatefulWidget {
  const PayWithMomoWidget({Key? key, required this.productpay})
      : super(key: key);
  final ProductPay productpay;

  @override
  State<PayWithMomoWidget> createState() => _PayWithMomoWidgetState();
}

class _PayWithMomoWidgetState extends State<PayWithMomoWidget> {
  late TextEditingController _productController;

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    _productController =
        TextEditingController(text: widget.productpay.product.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) - 35,
      child: Column(
        children: [
          PaymentTextField(
            controller: _productController,
            label: "Product",
            initialText: widget.productpay.product.name,
          ),
          PaymentTextField(controller: _nameController, label: "Name"),
          PaymentTextField(
            controller: _phoneController,
            label: "Phone Number",
            textInputType: TextInputType.phone,
          ),
          const SizedBox(height: 20),
          ProceedButton(onPressed: () {}),
        ],
      ),
    );
  }
}
