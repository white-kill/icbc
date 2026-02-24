import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/comm_widget_utils.dart';
import 'fixed_nav_logic.dart';
import 'fixed_nav_state.dart';

class FixedNavPage extends BaseStateless {
  FixedNavPage({Key? key})
      : super(key: key, title: Get.arguments?['title'] ?? '无title参数');

  final FixedNavLogic logic = Get.put(FixedNavLogic());
  final FixedNavState state = Get.find<FixedNavLogic>().state;

  @override
  Color? get navColor => Get.arguments?['navColor'] ?? Colors.white;

  @override
  Color? get titleColor =>
      Get.arguments?['titleColor'] ?? const Color(0xFF607483);

  @override
  Color? get background => Get.arguments?['background'];

  @override
  Color? get backColor =>
      Get.arguments?['backColor'] ??
      Get.arguments?['titleColor'] ??
      const Color(0xFF607483);

  @override
  List<Widget>? get rightAction {
    // 1. 如果传入了自定义 rightWidget，直接使用
    if (Get.arguments?['rightWidget'] != null) {
      Widget customWidget = Get.arguments?['rightWidget'];
      return [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: 12.w),
          child: customWidget,
        )
      ];
    }
    
    // 2. 如果 hideRightAction 为 true，则不显示右边按钮
    if (Get.arguments?['hideRightAction'] == true) {
      return null;
    }

    // 3. 分享按钮模式
    if (Get.arguments?['rightShare'] == true) {
      return [
        Image(
          image: 'share'.png,
          width: 20.w,
          height: 20.w,
        ).withPadding(right: 20.w).withOnTap(onTap: Get.arguments?['onShareTap'] ?? () {})
      ];
    }

    // 4. 默认模式：根据 right 参数显示更多按钮
    if (Get.arguments?['right'] == true) {
      return [
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
    }

    return [];
  }

  @override
  double? get lefItemWidth =>Get.arguments?['lefItemWidth'];

  @override
  Widget? get titleWidget => Get.arguments?['titleWidget'];

  @override
  Widget? get bottomNav => Get.arguments?['bottomNav'];

  @override
  Widget initBody(BuildContext context) {
    // 如果传入了自定义 bodyWidget，直接使用
    if (Get.arguments?['bodyWidget'] != null) {
      return Get.arguments['bodyWidget'] as Widget;
    }

    return ListView(
      padding: EdgeInsets.only(top: (Get.arguments?['top'] ?? 0).toDouble()),
      children: [
        Get.arguments?['topWidget'] ??const SizedBox.shrink(),
        if (logic.state.assetsImagePath != '')
          Image(
            image: logic.state.assetsImagePath.png3x,
            fit: BoxFit.fitWidth,
            width: 1.sw,
          ),
        if (logic.state.assetsImagePathList.isNotEmpty)
          buildImageList(),
      ],
    );
  }


  buildImageList() {
    List<Widget> images = [];
    for (String assets in logic.state.assetsImagePathList) {
      images.add(Image(
        image: assets.png3x,
        fit: BoxFit.fitWidth,
        width: 1.sw,
      ));
    }
    return Column(
      children: images,
    );
  }
}
