import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/controllers/cart_controller.dart';
import 'package:globaltrailblazersapp/models/product_cart.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/checkout_product.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/funcs.dart';

class ProductCartCardTile extends StatefulWidget {
  const ProductCartCardTile({
    Key? key,
    required this.productCart,
    required this.actualTime,
    required this.date,
  }) : super(key: key);
  final ProductCart productCart;
  final DateTime date;
  final String actualTime;

  @override
  State<ProductCartCardTile> createState() => _ProductCartCardTileState();
}

class _ProductCartCardTileState extends State<ProductCartCardTile> {
  final _cart = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    String showYear = "-${widget.date.year}\n";
    if (widget.date.year == DateTime.now().year) {
      showYear = ", ";
    }
    int quantity = 1;
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 5.0,
            offset: const Offset(2, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth(context) / 4,
            height: 100,
            child: Image.network(
              widget.productCart.product.productImage1,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productCart.product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Text("${widget.productCart.product.price} RWF"),
                  Text(
                      "${widget.productCart.product.ages} years | ${widget.productCart.product.grade}"),
                  Row(
                    children: [
                      const Icon(Icons.av_timer),
                      Text(
                        "${widget.date.day}-${months[widget.date.month - 1]}$showYear${widget.actualTime}",
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
                  if (value == 0) {
                    showRemoveFromCartModal(widget.productCart);
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CheckoutPage(
                        products: [widget.productCart.product],
                        price: widget.productCart.product.price,
                      ),
                    ),
                  );
                },
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Checkout",
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                  const PopupMenuItem<int>(
                    value: 0,
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFD6D6D6),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Icon(
                        Icons.remove,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Text(
                    " $quantity ",
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFFD6D6D6),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Icon(
                        Icons.add,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  showRemoveFromCartModal(ProductCart productCart) {
    BorderRadius radius = BorderRadius.circular(40);
    return showDialog(
        context: context,
        builder: (dialogContext) {
          bool isChecked = false;
          String action = "APPLY";
          return StatefulBuilder(
            builder: (stfContext, stfSetState) {
              return Dialog(
                elevation: 0.0,
                shape: RoundedRectangleBorder(borderRadius: radius),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration:
                      BoxDecoration(color: whiteColor, borderRadius: radius),
                  height: 210,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Ink(
                          child: SvgPicture.asset(
                            "assets/icons/white_close.svg",
                            color: grayColor,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Image.asset('assets/images/keza.png'),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                    "Coucou,\nAre you sure you want to remove this from your Cart?"),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      stfSetState(() {
                                        action = "Removing..";
                                      });
                                      dynamic result =
                                          await DatabaseService.removeFromCart(
                                              productCart.id);
                                      if (result != true && mounted) {
                                        stfSetState(() {
                                          action = "Failed";
                                        });
                                        return;
                                      }
                                      _cart.refreshPage();
                                      Navigator.pop(context);
                                    },
                                    child: Text(action),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: grayColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                  ),
                                ),
                                Row(
                                  children: [
                                    if (!isChecked)
                                      GestureDetector(
                                        onTap: () {
                                          stfSetState(() {
                                            isChecked = true;
                                          });
                                        },
                                        child: SvgPicture.asset(
                                            "assets/icons/white_checkbox.svg"),
                                      ),
                                    if (isChecked)
                                      GestureDetector(
                                        onTap: () {
                                          stfSetState(() {
                                            isChecked = false;
                                          });
                                        },
                                        child: SvgPicture.asset(
                                            "assets/icons/checked_mark.svg"),
                                      ),
                                    const Expanded(
                                        child: Text(" Don't show this again"))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
