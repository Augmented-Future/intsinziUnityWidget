import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/controllers/cart_controller.dart';
import 'package:globaltrailblazersapp/models/product.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/widgets/product_cart.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:lottie/lottie.dart';

class CartViewPage extends StatefulWidget {
  const CartViewPage({Key? key}) : super(key: key);

  @override
  State<CartViewPage> createState() => _CartViewPageState();
}

class _CartViewPageState extends State<CartViewPage> {
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BackButtonWidget(),
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: false,
        actions: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: const [
                      Text("ACTIONS"),
                      Icon(Icons.arrow_drop_down)
                    ],
                  )),
              buildActionButton(),
            ],
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Obx(() {
          if (cartController.cartProducts.isEmpty) {
            return Container(
              child: Lottie.asset("assets/lottie/empty_cart.json"),
            );
          } else {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final product = cartController.cartProducts[index];
                      final date = product.createdAt;

                      String actualTime = "${date.hour}:${date.minute} AM";
                      if (date.hour > 12) {
                        actualTime = "${date.hour - 12}:${date.minute} PM";
                      }

                      return Dismissible(
                        key: ObjectKey(product),
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
                        onDismissed: (direction) {
                          cartController.removeFromCart(product);
                          Get.snackbar("${product.name} has removed from cart!",
                              "We hope to see you buying another product from us! You remain with ${cartController.cartProducts.length} products in Cart.");
                        },
                        child: buildCartProduct(
                            context, product, date, actualTime),
                      );
                    },
                    childCount: cartController.cartProducts.length,
                  ),
                )
              ],
            );
          }
        }),
      ),
      bottomSheet: Obx(() {
        if (cartController.cartProducts.isEmpty) {
          return Container();
        } else {
          return buildBottomSheetCheckout();
        }
      }),
    );
  }

  Widget buildCartProduct(
      BuildContext context, Product product, DateTime date, String actualTime) {
    return ProductCartCardTile(
        product: product, actualTime: actualTime, date: date);
  }

  Container buildBottomSheetCheckout() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Total"),
              const SizedBox(height: 5),
              Obx(() {
                return Text(
                  "${cartController.checkoutAllPrice} RWF",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                );
              }),
            ],
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
                color: primaryColor,
              ),
              label: const Text(
                "Checkout",
                style: TextStyle(color: primaryColor),
              ),
              style: ElevatedButton.styleFrom(
                primary: filterYellow,
                elevation: 0.0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          )
        ],
      ),
    );
  }

  PopupMenuButton<int> buildActionButton() {
    return PopupMenuButton(
        icon: const Text(
          "ACTIONS",
          style: TextStyle(color: Colors.transparent),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tooltip: "Show Actions",
        onSelected: (selected) {
          if (selected == 1) {
            //Do checkout logic
          } else {
            setState(() {
              cartController.removeAllFromCart();
            });
          }
        },
        color: primaryColor,
        itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 1,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Checkout All",
                    style: TextStyle(color: whiteColor),
                  ),
                ),
              ),
              const PopupMenuItem<int>(
                value: 0,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Remove All",
                    style: TextStyle(color: whiteColor),
                  ),
                ),
              ),
            ]);
  }
}
