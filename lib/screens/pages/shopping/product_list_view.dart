import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/models/product.dart';

import '../../../constants/colors.dart';
import 'components/product_card_widget.dart';

class ProductListView extends StatefulWidget {
  final List<Product> products;
  const ProductListView({Key? key, required this.products}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final double _size = 200;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 8, right: 8),
          child: SizedBox(
            height: _size,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.products.length,
              itemBuilder: (context, index) =>
                  ProductCard(size: _size, product: widget.products[index]),
            ),
          ),
        ),
        if (widget.products.length > 5)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildLeftButton(),
              buildRightButton(),
            ],
          )
      ],
    );
  }

  Container buildRightButton() {
    return Container(
      height: _size - 25,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(
          right: Radius.circular(8),
        ),
        gradient: LinearGradient(
          colors: [
            grayColor200.withOpacity(0.0),
            grayColor200.withOpacity(0.8),
            grayColor.withOpacity(0.8),
          ],
        ),
      ),
      child: const Icon(
        Icons.arrow_forward_ios,
        color: whiteColor,
      ),
    );
  }

  Container buildLeftButton() {
    return Container(
      height: _size - 25,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(8),
        ),
        gradient: LinearGradient(
          colors: [
            grayColor.withOpacity(0.8),
            grayColor200.withOpacity(0.8),
            grayColor200.withOpacity(0.0),
          ],
        ),
      ),
      child: const Icon(
        Icons.arrow_back_ios,
        color: whiteColor,
      ),
    );
  }
}
