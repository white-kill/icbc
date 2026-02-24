import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'payment_state.dart';

class PaymentLogic extends GetxController {
  var navActionColor = Colors.black.obs;
  var tabIndex = 0.obs;
  var typeIndex = 0.obs;
  final PaymentState state = PaymentState();

  @override
  void onInit() {
    super.onInit();
    typeIndex.value = Get.arguments?['index']??0;
  }
}
