import 'package:get/get.dart';

class CartController extends GetxController {
  var refreshCart = false.obs;
  refreshPage() {
    refreshCart.value = true;
  }

  unrefreshPage() {
    refreshCart.value = false;
  }
}
