import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class DeliveryController extends GetxController {
  var deliver = true.obs;
  var priceToPay = 0.obs;
  var location = LatLng(0, 0).obs;
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

  changeLocation(LatLng newLocation) {
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
