import 'package:get/get.dart';

import 'state.dart';

class RobotLogic extends GetxController {
  final RobotState state = RobotState();

  bool loading = true;

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2), () {
      loading = false;
      update();
    });
    super.onInit();
  }

  @override
  void dispose() {

    super.dispose();
  }
}
