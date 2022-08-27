import 'package:get/get.dart';
import 'package:globaltrailblazersapp/models/product_pay.dart';

class DeliveryController extends GetxController {
  var deliver = true.obs;
  var priceToPay = 0.obs;
  var location = Rx<DeliverLocation?>(null);
  var cellPhone = Rx<String?>(null);
  deliveryChoosed(bool choice, int price) {
    deliver.value = choice;
    priceToPay.value = price;
  }

  incrementQuantityPrice(int price) {
    priceToPay.value = priceToPay.value + price;
  }

  decrementQuantityPrice(int price) {
    priceToPay.value = priceToPay.value - price;
  }

  changeLocation(DeliverLocation newLocation) {
    location.value = newLocation;
  }

  changeCellPhone(String _cellPhone) {
    if (_cellPhone.length <= 13 && _cellPhone.length >= 10) {
      cellPhone.value = _cellPhone;
    } else {
      cellPhone.value = "Invalid cell phone provided";
    }
  }
}
