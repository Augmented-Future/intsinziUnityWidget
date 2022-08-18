import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  List<Product> cartProducts = RxList<Product>([]);
  void addToCart(Product product) {
    if (!(cartProducts.any((productA) => productA.id == product.id))) {
      cartProducts.add(product);
    }
  }

  void removeFromCart(Product _product) {
    cartProducts.remove(_product);
  }
}
