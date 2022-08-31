import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/helpers/validate.dart';
import 'package:globaltrailblazersapp/models/product.dart';
import 'package:globaltrailblazersapp/models/product_pay.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/components/delivery_controller.dart';

import '../../../../shared/colors.dart';
import '../../payments/payment_page.dart';

class PayButton extends StatelessWidget {
  const PayButton(
      {Key? key,
      required this.price,
      required this.purchaseType,
      required this.product,
      required this.quantity,
      required this.location,
      required this.cellPhone,
      required this.deliveryController})
      : super(key: key);

  final int price, quantity;
  final PurchaseType purchaseType;
  final Product product;
  final DeliverLocation? location;
  final String? cellPhone;
  final DeliveryController deliveryController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final validNumber =
            ValidateInput.phoneNumber(deliveryController.cellPhone.value ?? "");

        if (deliveryController.deliver.isFalse) {
          gotoPayment(context: context);
          return;
        }
        if (validNumber.inValid) {
          showToast(validNumber.message);
          return;
        }
        if (deliveryController.location.value == null) {
          showToast("Please choose location");
          return;
        }
        gotoPayment(context: context, cellPhone: cellPhone, location: location);
      },
      splashColor: color100.withOpacity(0.5),
      highlightColor: whiteColor.withOpacity(0.2),
      child: Ink(
        decoration: const BoxDecoration(color: primaryColor),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/pay_cash.svg'),
            const SizedBox(width: 10),
            Text(
              " Pay ${price.round()} Rwf",
              style: const TextStyle(
                  color: whiteColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  gotoPayment(
      {required BuildContext context,
      String? cellPhone,
      DeliverLocation? location}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentPage(
          productPay: ProductPay(
            products: [product],
            priceToBePaid: price,
            purchaseType: purchaseType,
            quantity: quantity,
            cellPhone: cellPhone,
            location: location,
          ),
        ),
        fullscreenDialog: true,
      ),
    );
  }

  showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: color100,
      textColor: whiteColor,
    );
  }
}
