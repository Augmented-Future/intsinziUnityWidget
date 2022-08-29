import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:globaltrailblazersapp/helpers/validate.dart';
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
  final FocusNode _cvvFocusNode = FocusNode();

  final TextEditingController _expdateController = TextEditingController();
  final FocusNode _expDateFocusNode = FocusNode();
  late TextEditingController _productController;

  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();

  final TextEditingController _cardNumberController = TextEditingController();
  final FocusNode _cardFocusNode = FocusNode();

  @override
  void initState() {
    _productController =
        TextEditingController(text: widget.productpay.product.name);
    super.initState();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _cardFocusNode.dispose();
    _expDateFocusNode.dispose();
    _cvvFocusNode.dispose();
    super.dispose();
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
            showCursor: false,
            hintText: "Product name",
          ),
          PaymentTextField(
            controller: _nameController,
            label: "Names on card",
            hintText: "Eg. Kalisa Ernest",
            focusNode: _nameFocusNode,
          ),
          PaymentTextField(
            controller: _cardNumberController,
            label: "Card number",
            textInputType: TextInputType.number,
            hintText: "0000 0000 0000 0000",
            focusNode: _cardFocusNode,
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
                hintText: "00/00",
                focusNode: _expDateFocusNode,
              ),
              PaymentTextField(
                  controller: _cvvController,
                  label: "CVV",
                  focusNode: _cvvFocusNode,
                  short: true,
                  textInputType: TextInputType.number,
                  hintText: "000",
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
            ],
          ),
          const SizedBox(height: 20),
          ProceedButton(
            onPressed: () {
              final validName = ValidateInput.name(_nameController.text);
              final validCard =
                  ValidateInput.visaCard(_cardNumberController.text);
              final validDate = ValidateInput.expDate(_expdateController.text);
              final validCVV = ValidateInput.cvv(_cvvController.text);
              if (validName.inValid) {
                showToastError(validName.message, _nameFocusNode);
                return;
              }
              if (validCard.inValid) {
                showToastError(validCard.message, _cardFocusNode);
                return;
              }
              if (validDate.inValid) {
                showToastError(validDate.message, _expDateFocusNode);
                return;
              }
              if (validCVV.inValid) {
                showToastError(validCVV.message, _cvvFocusNode);
                return;
              }
              //There we go to call an API here.
            },
          )
        ],
      ),
    );
  }

  showToastError(String message, FocusNode node) {
    node.requestFocus();
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: color100,
      textColor: whiteColor,
    );
  }
}
