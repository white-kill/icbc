import 'package:cbc/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class CpxqPage extends BaseStateless {
  CpxqPage({Key? key}) : super(key: key, title: "产品详情");

  final CpxqLogic logic = Get.put(CpxqLogic());
  final CpxqState state = Get.find<CpxqLogic>().state;
  
  
  @override
  // TODO: implement bottomNav
  Widget? get bottomNav => Image(image: "home_ad_1_bottom".png);

  @override
  List<Widget>? get rightAction => [
    _buildTitleAction('ic_title_service', '我的客服')
        .withOnTap(onTap: () => Routes.mineService.push),
    SizedBox(width: 15.w),
    _buildTitleAction('ic_title_share', '分享'),

    SizedBox(width: 15.w),
  ];

  Widget _buildTitleAction(String img, String text) {
    return Container(
      padding: EdgeInsets.only(top: 8.w, right: 7.w),
      child: Column(
        children: [
          Image(
            image: img.png3x,
            height: 20.w,
          ),
        ],
      ),
    );
  }

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Image(image: "home_ad_1_top".png),
        SingleChildScrollView(
          child: Image(image: "home_ad_1_content".png),
        )
      ],
    );
  }
}
