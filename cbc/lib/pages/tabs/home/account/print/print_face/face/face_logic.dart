import 'package:get/get.dart';
import 'face_state.dart';

class FaceLogic extends GetxController {
  final FaceState state = FaceState();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    state.dispose();
    super.onClose();
  }
}

