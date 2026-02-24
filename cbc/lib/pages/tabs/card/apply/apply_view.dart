import 'package:cbc/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'apply_logic.dart';
import 'apply_state.dart';

class ApplyPage extends BaseStateless {
  ApplyPage({Key? key}) : super(key: key,title: '全部信用卡');

  final ApplyLogic logic = Get.put(ApplyLogic());
  final ApplyState state = Get.find<ApplyLogic>().state;


  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image(image: 'qxxyk'.png3x),
            Positioned(
                left: 36.w,
                top: 12.5.w,
                child: BaseText(text: AppConfig.config.abcLogic.memberInfo.city))
          ],
        )
      ],
    );
  }
}
