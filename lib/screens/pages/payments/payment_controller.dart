import 'package:get/get.dart';

class PaymentController extends GetxController {
  var payWithCard = false.obs;
  switchPaymentMethodWithCard(bool _payWithCard) {
    payWithCard.value = _payWithCard;
  }
}
