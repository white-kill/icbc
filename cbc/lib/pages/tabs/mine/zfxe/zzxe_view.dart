import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/comm_widget_utils.dart';
import 'zzxe_logic.dart';
import 'zzxe_state.dart';

class ZzxePage extends BaseStateless {
  ZzxePage({Key? key}) : super(key: key,title: '支付限额');

  final ZzxeLogic logic = Get.put(ZzxeLogic());
  final ZzxeState state = Get.find<ZzxeLogic>().state;

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
        Image(image: 'zzxe'.png),
      ],
    );
  }
}
