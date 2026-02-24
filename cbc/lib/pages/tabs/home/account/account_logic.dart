import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import 'account_state.dart';

class AccountLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final AccountState state = AccountState();

  late AnimationController controller;
  late Animation<double> firstWidgetAnimation;
  late Animation<double> secondWidgetAnimation;

  var showFirst = true.obs;
  var isAnimating = false.obs;

  @override
  void onInit() {
    super.onInit();

    controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    // 第一个widget的动画：向下移动并淡出
    firstWidgetAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    // 第二个widget的动画：从底部向上移动并淡入
    secondWidgetAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        isAnimating.value = false;
      }
    });

  }

  void switchWidgets() {
    if (isAnimating.value) return;

    isAnimating.value = true;

    if (showFirst.value) {
      controller.forward();
    } else {
      controller.reverse();
    }
    showFirst.value = !showFirst.value;
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
