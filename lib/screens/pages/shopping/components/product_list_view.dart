import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/models/product.dart';

import 'product_card.dart';

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
        SizedBox(
          height: _size,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.products.length,
            itemBuilder: (context, index) =>
                ProductCard(size: _size, product: widget.products[index]),
          ),
        ),
      ],
    );
  }
}
