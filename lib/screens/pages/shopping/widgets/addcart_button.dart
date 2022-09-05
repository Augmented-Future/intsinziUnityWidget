import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../models/product_model.dart';
import '../../../../services/database_service.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/funcs.dart';

class AddCartButton extends StatefulWidget {
  const AddCartButton({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<AddCartButton> createState() => _AddCartButtonState();
}

class _AddCartButtonState extends State<AddCartButton> {
  String action = "ADD TO CART";
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          action = "Adding to cart";
        });
        dynamic result = await DatabaseService.addToCart(widget.product.id);
        if (result != true && mounted) {
          setState(() {
            action = "Failed | Try again";
            showToast(message: result.errorMessage, success: false);
          });
          return;
        }
        setState(() {
          action = "Added to cart";
          showToast(
            message: "${widget.product.name} Added to cart successfully!",
          );
        });
      },
      splashColor: brandYellowColor.withOpacity(0.5),
      highlightColor: whiteColor.withOpacity(0.2),
      child: Ink(
        decoration: BoxDecoration(color: Colors.grey[400]),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (action == "ADD TO CART")
              SvgPicture.asset(
                'assets/icons/cart.svg',
                color: whiteColor,
              ),
            if (action == "Adding to cart")
              const SizedBox(
                height: 18,
                child: LoadingIndicator(
                  indicatorType: Indicator.lineScaleParty,
                  colors: [whiteColor],
                  strokeWidth: 2,
                ),
              ),
            if (action == "Failed | Try again")
              Stack(
                alignment: Alignment.topRight,
                children: [
                  SvgPicture.asset(
                    'assets/icons/cart.svg',
                    color: whiteColor,
                  ),
                  const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 18,
                  ),
                ],
              ),
            if (action == "Added to cart")
              Stack(
                alignment: Alignment.topRight,
                children: [
                  SvgPicture.asset(
                    'assets/icons/cart.svg',
                    color: whiteColor,
                  ),
                  const Icon(
                    Icons.check,
                    color: coolGreen,
                    size: 18,
                  ),
                ],
              ),
            const SizedBox(width: 12),
            Text(
              action.toUpperCase(),
              style: const TextStyle(
                  color: whiteColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
