import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/models/product_pay.dart';
import 'package:globaltrailblazersapp/screens/pages/payments/widgets/proceed_button.dart';
import 'package:globaltrailblazersapp/screens/pages/payments/widgets/text_field.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class PayWithCardWidget extends StatefulWidget {
  const PayWithCardWidget({Key? key, required this.productpay})
      : super(key: key);
  final ProductPay productpay;

  @override
  State<PayWithCardWidget> createState() => _PayWithCardWidgetState();
}

class _PayWithCardWidgetState extends State<PayWithCardWidget> {
  final TextEditingController _cvvController = TextEditingController();

  final TextEditingController _expdateController = TextEditingController();

  late TextEditingController _productController;

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _cardNumberController = TextEditingController();

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
          ),
          PaymentTextField(
            controller: _nameController,
            label: "Names on card",
          ),
          PaymentTextField(
            controller: _cardNumberController,
            label: "Card number",
            textInputType: TextInputType.number,
            inputFormatters: [
              CreditCardFormatter(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PaymentTextField(
                controller: _expdateController,
                label: "Exp Date",
                short: true,
                textInputType: TextInputType.number,
                inputFormatters: [
                  DateInputFormatter(),
                ],
              ),
              PaymentTextField(
                  controller: _cvvController,
                  label: "CVV",
                  short: true,
                  textInputType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
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
