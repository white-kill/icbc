import 'package:cbc/config/app_config.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/comm_widget_utils.dart';
import 'diagnosis_logic.dart';
import 'diagnosis_state.dart';

class DiagnosisPage extends BaseStateless {
  DiagnosisPage({Key? key}) : super(key: key,title: '资产诊断');

  final DiagnosisLogic logic = Get.put(DiagnosisLogic());
  final DiagnosisState state = Get.find<DiagnosisLogic>().state;

  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'ic_nav_service'.png3x,
      width: 20.w,
      height: 20.w,
      color: const Color(0xFF607483),
    )
        .withPadding(right: 20.w)
        .withOnTap(onTap: () => Routes.mineService.push),
    CommWidgetUtils.getMoreIcon(icColor: const Color(0xFF607483)),
  ];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      children: [
        Image(image: 'zczd1'.png),
        Stack(
          children: [
            Image(image: 'zczd2'.png),
            BaseText(text: '¥${AppConfig.config.abcLogic.balance()}',color: BColors.mainColor,fontSize: 12.w,).withPadding(
              left: 55.w,
              top: 280.w
            )
          ],
        ),
        Image(image: 'zczd3'.png),
      ],
    );
  }
}
