import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globaltrailblazersapp/shared/funcs.dart';
import 'package:globaltrailblazersapp/controllers/cart_controller.dart';
import 'package:globaltrailblazersapp/models/product_cart.dart';
import 'package:globaltrailblazersapp/screens/pages/shopping/checkout_product.dart';
import 'package:globaltrailblazersapp/screens/pages/widgets/home_cards_shimmer.dart';
import 'package:globaltrailblazersapp/services/database_service.dart';
import 'package:lottie/lottie.dart';

import '../../../models/product_model.dart';
import '../../../shared/colors.dart';
import '../widgets/back_app_bar.dart';
import 'widgets/cart_list_items.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final _cart = Get.put(CartController());
  late IsLoading isLoading;
  List<ProductCart>? _productCarts;
  ErrorException? _error;
  int? checkoutPrice;
  List<Product> products = [];
  getCarts() async {
    if (mounted) isLoading = IsLoading.loading;

    dynamic result = await DatabaseService.fetchAllCarts();
    if (result.runtimeType == ErrorException && mounted) {
      setState(() {
        _error = result;
        isLoading = IsLoading.failed;
      });
    } else if (mounted) {
      setState(() {
        _productCarts = result;
        checkoutPrice = 0;
        for (var i = 0; i < _productCarts!.length; i++) {
          checkoutPrice = _productCarts![i].product.price + checkoutPrice!;
          products.add(_productCarts![i].product);
        }
        isLoading = IsLoading.done;
      });
    }
  }

  @override
  void initState() {
    _cart.unrefreshPage();
    getCarts();
    super.initState();
  }

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
          if (isLoading == IsLoading.done)
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
                  ),
                ),
                buildActionButton(context, products, checkoutPrice!),
              ],
            ),
          const SizedBox(width: 20)
        ],
      ),
      body: Obx(() {
        if (_cart.refreshCart.isTrue) {
          getCarts();
          _cart.unrefreshPage();
        }

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: isLoading == IsLoading.done
              ? ProductCartsListView(listProducts: _productCarts!)
              : (isLoading == IsLoading.loading
                  ? ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) =>
                          const HomeCardShimmerWidget(),
                    )
                  : Column(
                      children: [
                        Lottie.asset("assets/lottie/empty_cart.json"),
                        Text(
                          "(${_error!.statusCode}) ${_error!.errorMessage.toUpperCase()} ",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: colorPurple,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            wordSpacing: 5,
                          ),
                        ),
                      ],
                    )),
        );
      }),
      bottomSheet: checkoutPrice != null && isLoading == IsLoading.done
          ? buildBottomSheetCheckout(checkoutPrice!, products, context)
          : Container(height: 0),
    );
  }
}

Container buildBottomSheetCheckout(
    int price, List<Product> productsA, BuildContext context) {
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
            Text(
              "$price RWF",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )
          ],
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>
                        CheckoutPage(price: price, products: productsA),
                    fullscreenDialog: true)),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
        )
      ],
    ),
  );
}

PopupMenuButton<int> buildActionButton(
    BuildContext context, List<Product> products, int price) {
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
      if (selected == 0) {
        //Remove all cart from database.
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CheckoutPage(
            products: products,
            price: price,
          ),
        ),
      );
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
    ],
  );
}
