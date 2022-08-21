import 'package:get/get.dart';

class DeliveryController extends GetxController {
  var deliver = true.obs;
  var priceToPay = 0.obs;
  var location = "No choosen location".obs;
  var cellPhone = "No cell phone provided".obs;
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

  changeLocation(String newLocation) {
    if (newLocation.length > 5) {
      location.value = newLocation;
    } else {
      location.value = "Invalid Location provided";
    }
  }

  changeCellPhone(String _cellPhone) {
    if (_cellPhone.length <= 13 && _cellPhone.length >= 10) {
      cellPhone.value = _cellPhone;
    } else {
      cellPhone.value = "Invalid cell phone provided";
    }
  }
}
