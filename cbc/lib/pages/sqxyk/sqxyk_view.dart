import 'package:cbc/config/app_config.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:cbc/utils/comm_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'sqxyk_logic.dart';
import 'sqxyk_state.dart';

/// 申请信用卡
class SqxykPage extends BaseStateless {
  SqxykPage({super.key});

  final SqxykLogic logic = Get.put(SqxykLogic());
  final SqxykState state = Get.find<SqxykLogic>().state;

  @override
  Widget? get titleWidget => BaseText(
        text: '申请信用卡',
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
              image: 'img_sqxyk'.png3x,
              width: 1.sw,
            ),
            Positioned(
              left: 10.w,
              top: 13.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: 'nav_left_loc'.png3x,
                    width: 24.w,
                    height: 24.w,
                    color: const Color(0xFF333333),
                  ),
                  BaseText(
                    text: AppConfig.config.abcLogic.memberInfo.city,
                    fontSize: 14.w,
                    color: const Color(0xFF333333),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
