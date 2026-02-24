import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'wealth_state.dart';

class WealthLogic extends GetxController {
  var navActionColor = Colors.white.obs;
  var canSee = false.obs;
  final WealthState state = WealthState();
}
