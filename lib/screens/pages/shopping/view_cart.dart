import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/constants/shared.dart';
import 'package:globaltrailblazersapp/controllers/cart_controller.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';

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
      appBar: BackAppBar.buildAppbar(),
      body: CustomScrollView(
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

                return Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenWidth(context) / 4,
                        height: 100,
                        child: Image.network(
                          product.productImage1,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Text("${product.price} RWF"),
                              Text("${product.ages} years | ${product.grade}"),
                              Row(
                                children: [
                                  const Icon(Icons.av_timer),
                                  Text(
                                      "${date.day}-${months[date.month - 1]}-${date.year}, $actualTime")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          PopupMenuButton<int>(
                            color: grayColor200,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            tooltip: "Show Actions",
                            icon: const Icon(Icons.more_vert),
                            onSelected: (value) {
                              if (value == 1) {
                                setState(() {
                                  cartController.removeFromCart(product);
                                });
                              } else {}
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem<int>(
                                value: 0,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Checkout",
                                    style: TextStyle(color: whiteColor),
                                  ),
                                ),
                              ),
                              const PopupMenuItem<int>(
                                value: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Remove",
                                    style: TextStyle(color: whiteColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text("Quantity")
                        ],
                      ),
                    ],
                  ),
                );
              },
              childCount: cartController.cartProducts.length,
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 150,
        decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Total"),
                SizedBox(height: 5),
                Text(
                  "10,000 RWf",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
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
      ),
    );
  }
}
