import 'package:get/get.dart';

class RefreshController extends GetxController {
  var refreshValue = false.obs;
  refreshPage() {
    refreshValue.value = true;
  }

  unrefreshPage() {
    refreshValue.value = false;
  }
}
