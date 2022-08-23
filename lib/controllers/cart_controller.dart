import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  List<Product> cartProducts = RxList<Product>([]);
  var checkoutAllPrice = 0.obs;
  void addToCart(Product product) {
    if (!(cartProducts.any((productA) => productA.id == product.id))) {
      cartProducts.add(product);
      checkoutAllPrice.value = checkoutAllPrice.value + product.price;
    }
  }

  void removeFromCart(Product _product) {
    checkoutAllPrice.value = checkoutAllPrice.value - _product.price;
    cartProducts.remove(_product);
  }

  removeAllFromCart() {
    checkoutAllPrice.value = 0;
    cartProducts.clear();
  }
}
