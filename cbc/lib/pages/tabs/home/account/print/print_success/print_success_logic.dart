import 'package:get/get.dart';

import 'print_success_state.dart';

class Print_successLogic extends GetxController {
  final Print_successState state = Print_successState();

  String email = '';

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments?['email']??'';
  }
}
