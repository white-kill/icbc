import 'package:get/get.dart';

import 'transfer_success_state.dart';

class TransferSuccessLogic extends GetxController {
  final TransferSuccessState state = TransferSuccessState();

  String cardNo = '';
  String bankName = '';

  @override
  void onInit() {
    super.onInit();
    cardNo = Get.arguments?['cardNo']??'';
    bankName = Get.arguments?['bankName']??'';
  }
}
