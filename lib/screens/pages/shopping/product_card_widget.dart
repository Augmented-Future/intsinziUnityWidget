import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../../models/product.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  GestureDetector(
                    onDoubleTap: () => setState(() => showModal = true),
                    child: Container(
                      height: widget._size * 0.65,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F8F8),
                        image: DecorationImage(
                            image: NetworkImage(
                              widget.product.imgUrl,
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Container(
                    color: whiteColor,
                    margin: const EdgeInsets.only(right: 3),
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset('assets/icons/plus.svg'),
                  ),
                ],
              ),
              if (showModal)
                Container(
                  color: blackColor,
                  padding: const EdgeInsets.all(12),
                  height: widget._size * 0.6,
                  width: widget._size * 0.95,
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
                            color: primaryColor, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        "Add to cart",
                        style: TextStyle(
                          color: grayColor200,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/currency.svg', width: 18),
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
    );
  }
}
