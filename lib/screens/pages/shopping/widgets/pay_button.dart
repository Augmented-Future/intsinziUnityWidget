import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/models/product.dart';
import 'package:globaltrailblazersapp/models/product_pay.dart';
import 'package:globaltrailblazersapp/screens/pages/payments/payment_page.dart';

import '../../../../constants/colors.dart';

class PayButton extends StatelessWidget {
  const PayButton(
      {Key? key,
      required this.price,
      required this.purchaseType,
      required this.product,
      required this.quantity,
      required this.location,
      required this.cellPhone})
      : super(key: key);

  final int price, quantity;
  final PurchaseType purchaseType;
  final Product product;
  final String? location;
  final String? cellPhone;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        () => PaymentPage(
          productPay: ProductPay(
            product: product,
            priceToBePaid: price,
            purchaseType: purchaseType,
            quantity: quantity,
            cellPhone:
                (purchaseType == PurchaseType.delivery) ? cellPhone : null,
            location: (purchaseType == PurchaseType.delivery) ? location : null,
          ),
        ),
      ),
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
}
