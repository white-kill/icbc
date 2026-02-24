import 'package:get/get.dart';

import 'print_select_state.dart';

class PrintSelectLogic extends GetxController {
  final PrintSelectState state = PrintSelectState();

  List nameList = [];



  @override
  void onInit() {
    super.onInit();

    nameList = Get.arguments?['list']??[];
  }
}
