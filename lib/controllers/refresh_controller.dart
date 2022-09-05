import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class RefreshController extends GetxController {
  var refreshValue = false.obs;
  refreshPage() {
    refreshValue.value = true;
  }

  unrefreshPage() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      refreshValue.value = false;
    });
  }
}
