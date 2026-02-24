import 'package:cbc/routes/app_pages.dart';
import 'package:cbc/utils/comm_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'mine_follow_logic.dart';
import 'mine_follow_state.dart';

class MineFollowPage extends BaseStateless {
  MineFollowPage({super.key});

  final MineFollowLogic logic = Get.put(MineFollowLogic());
  final MineFollowState state = Get.find<MineFollowLogic>().state;

  @override
  Widget? get titleWidget => BaseText(
        text: '我的关注',
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
      padding: EdgeInsets.zero,
      children: [
        Image(
          image: 'wdgz1_1'.png3x,
          width: 1.sw,
        ),
        Image(
          image: 'wdgz1_2'.png3x,
          width: 1.sw,
        ),
      ],
    );
  }
}
