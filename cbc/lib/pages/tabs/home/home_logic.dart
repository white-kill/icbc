import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {

  var navActionColor = Colors.black.obs;
  var navChange = false.obs;


  var homeTabIndex = 0.obs;
  final HomeState state = HomeState();

}
