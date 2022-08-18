import 'package:flutter/material.dart';
import 'package:globaltrailblazersapp/models/product.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar.buildAppbar(),
      body: Center(
        child: Text(
            "Product Details,\nName: ${widget.product.name},\nRange: ${widget.product.ages}"),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
