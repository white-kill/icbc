import 'package:cbc/config/app_config.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:cbc/utils/comm_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'safe_manage_logic.dart';
import 'safe_manage_state.dart';

class SafeManagePage extends BaseStateless {
  SafeManagePage({super.key});

  final SafeManageLogic logic = Get.put(SafeManageLogic());
  final SafeManageState state = Get.find<SafeManageLogic>().state;

  @override
  Widget? get titleWidget => BaseText(
        text: '安全管理',
        fontSize: 17.w,
        color: const Color(0xFF607483),
      );

  @override
  Widget? get leftItem => Container(
        padding: EdgeInsets.symmetric(vertical: 12.w),
        child:
            Image(image: 'ic_left_back'.png3x, color: const Color(0xFF5B6A80)),
      ).withOnTap(onTap: () => Get.back());

  @override
  List<Widget>? get rightAction => [
        Image(image: 'ic_nav_service'.png3x, width: 20.w, height: 20.w)
            .withPadding(right: 20.w)
            .withOnTap(onTap: () => Routes.mineService.push),
        CommWidgetUtils.getMoreIcon(),
      ];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Image(
              image: 'bg_safe_manage'.png3x,
              width: 1.sw,
            ),
            Positioned(
              right: 28.w,
              top: 13.w,
              child: BaseText(
                text: AppConfig.config.abcLogic.phone(),
                fontSize: 13.w,
                color: const Color(0xFF333333),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
