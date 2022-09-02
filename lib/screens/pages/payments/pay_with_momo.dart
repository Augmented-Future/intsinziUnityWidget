import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:globaltrailblazersapp/screens/pages/payments/momo_payment_process.dart';
import 'package:globaltrailblazersapp/shared/colors.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:globaltrailblazersapp/helpers/validate.dart';
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
  final FocusNode _nameFocusNode = FocusNode();

  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _mobileNumberFocusNode = FocusNode();

  @override
  void initState() {
    String products = "";
    for (int i = 0; i < widget.productpay.products.length; i++) {
      products += widget.productpay.products[i].name;
      if (i + 1 == widget.productpay.products.length) continue;
      products += ", ";
    }
    _productController = TextEditingController(text: products);
    super.initState();
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _mobileNumberFocusNode.dispose();
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
              label: "Name",
              focusNode: _nameFocusNode,
              hintText: "Eg. Kalisa Ernest"),
          PaymentTextField(
            controller: _phoneController,
            label: "Mobile money",
            textInputType: TextInputType.phone,
            focusNode: _mobileNumberFocusNode,
            hintText: "0780000000",
          ),
          const SizedBox(height: 20),
          ProceedButton(onPressed: () async {
            final invalidName = ValidateInput.name(_nameController.text);
            final invalidNumber =
                ValidateInput.momoNumber(_phoneController.text);

            if (invalidName.inValid) {
              showToastError(invalidName.message, _nameFocusNode);
              return;
            }
            if (invalidNumber.inValid) {
              showToastError(invalidName.message, _mobileNumberFocusNode);
              return;
            }
            ProcessResponse result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentProcessPageMomo(
                    mobileNumber: _phoneController.text,
                    momoName: _nameController.text,
                    productPay: widget.productpay),
                fullscreenDialog: true,
              ),
            );
          }),
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
