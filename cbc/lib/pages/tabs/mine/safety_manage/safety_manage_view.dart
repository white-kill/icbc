import 'package:cbc/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'safety_manage_logic.dart';
import 'safety_manage_state.dart';

class SafetyManagePage extends BaseStateless {
  SafetyManagePage({Key? key}) : super(key: key,title: '智能测');

  final Safety_manageLogic logic = Get.put(Safety_manageLogic());
  final Safety_manageState state = Get.find<Safety_manageLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      children: [
        Image(image: 'aqgl1'.png),
        Image(image: 'aqgl2'.png),
      ],
    );
  }
}
