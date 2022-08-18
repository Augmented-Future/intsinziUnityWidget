import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/constants/colors.dart';
import 'package:globaltrailblazersapp/controllers/cart_controller.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/back_app_bar.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/bottom_navbar.dart';

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
      body: Column(
        children: [
          Text(
              "You have ${cartController.cartProducts.length} products in Cart."),
          Expanded(
            child: ListView.builder(
                itemCount: cartController.cartProducts.length,
                itemBuilder: (context, index) {
                  final product = cartController.cartProducts[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        cartController
                            .removeFromCart(cartController.cartProducts[index]);
                        setState(() {});
                      },
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: brandYellowColor,
                        backgroundImage: NetworkImage(product.productImage1),
                      ),
                      title: Text(product.name),
                      subtitle: Text(product.product),
                      trailing: Text("${product.price} RWF"),
                    ),
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
