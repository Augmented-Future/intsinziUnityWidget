import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';

import '../../../../shared/colors.dart';
import '../../../../controllers/cart_controller.dart';
import '../../../../models/product_cart.dart';
import '../../../../services/database_service.dart';
import 'product_cart.dart';

class ProductCartsListView extends StatefulWidget {
  const ProductCartsListView({Key? key, required this.listProducts})
      : super(key: key);

  final List<ProductCart> listProducts;

  @override
  State<ProductCartsListView> createState() => _ProductCartsListViewState();
}

class _ProductCartsListViewState extends State<ProductCartsListView> {
  final _cart = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Center(
              child: Text(
            "Around ${widget.listProducts.length} in your Cart",
            style: const TextStyle(fontSize: 18, color: primaryColor),
          )),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final productCart = widget.listProducts[index];
              final date = productCart.createdAt;

              String actualTime = "${date.hour}:${date.minute} AM";
              if (date.hour > 12) {
                actualTime = "${date.hour - 12}:${date.minute} PM";
              }

              return Dismissible(
                key: ObjectKey(productCart),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(12),
                  child: const Text(
                    "Checkout from cart",
                    style: TextStyle(
                      color: filterYellow,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                secondaryBackground: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "Remove from Cart",
                    style: TextStyle(
                      color: Colors.red.shade400,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onDismissed: (direction) async {
                  dynamic result =
                      await DatabaseService.removeFromCart(productCart.id);
                  if (result != true) {
                    showToast(
                        message: "Failed to remove from cart", success: false);
                    _cart.refreshPage();
                    return;
                  }
                  showToast(message: "Cart removed");
                  _cart.refreshPage();
                },
                child: buildCartProduct(context, productCart, date, actualTime),
              );
            },
            childCount: widget.listProducts.length,
          ),
        )
      ],
    );
  }
}

Widget buildCartProduct(BuildContext context, ProductCart productCart,
    DateTime date, String actualTime) {
  return ProductCartCardTile(
      productCart: productCart, actualTime: actualTime, date: date);
}
