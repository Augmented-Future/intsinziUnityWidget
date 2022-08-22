import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/controllers/cart_controller.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/product_details.dart';

import '../../../../constants/colors.dart';
import '../../../../models/product.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, required double size, required this.product})
      : _size = size,
        super(key: key);

  final double _size;
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool showModal = false;
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: widget._size,
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                  color: blackColor.withOpacity(0.2),
                  offset: const Offset(2, 2),
                  blurRadius: 0.4),
            ],
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(
                                () => ProductDetails(product: widget.product)),
                            child: Container(
                              height: widget._size * 0.65,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8F8F8),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      widget.product.productImage1,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => setState(() => showModal = true),
                            child: Container(
                              color: whiteColor,
                              margin: const EdgeInsets.only(right: 3),
                              padding: const EdgeInsets.all(8),
                              child: SvgPicture.asset('assets/icons/plus.svg'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                onTap: () =>
                                    cartController.addToCart(widget.product),
                                child: Ink(
                                  child: const Text(
                                    "Add to cart",
                                    style: TextStyle(
                                      color: grayColor200,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/currency.svg',
                                width: 18),
                            Text(
                              " ${widget.product.price.round()} RWF",
                              style: const TextStyle(color: primaryColor),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              if (showModal)
                Container(
                  color: blackColor,
                  padding: const EdgeInsets.all(12),
                  height: widget._size,
                  width: widget._size,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              widget.product.description,
                              style: const TextStyle(
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => showModal = false),
                        child: SvgPicture.asset('assets/icons/white_close.svg'),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios),
            SizedBox(width: widget._size - 30),
            const Icon(Icons.arrow_forward_ios),
          ],
        )
      ],
    );
  }
}
