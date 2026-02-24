import 'package:cbc/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class GyiscPage extends BaseStateless {
  GyiscPage({super.key}) : super(title: '工银i豆商城');

  @override
  Color? get navColor => Colors.white;

  @override
  Color? get titleColor => const Color(0xFF607483);

  @override
  Color? get backColor => const Color(0xFF607483);

  @override
  double? get lefItemWidth => 120.w;

  @override
  Widget? get leftItem {
    return Row(
      children: [
        // 返回按钮
        InkWell(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Icon(
              Icons.navigate_before,
              size: 30.h,
              color: const Color(0xFF607483),
            ),
          ),
          onTap: () => Get.back(),
        ),
        SizedBox(width: 5.w),
        // 关闭按钮
        BaseText(
          text: '关闭',
          style: TextStyle(
            fontSize: 16.sp,
            color: const Color(0xFF607483),
          ),
        ).withOnTap(onTap: () {
          Get.back();
        }),
      ],
    );
  }

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // 第一张图，上面有 Stack 显示 i 豆值
        Stack(
          children: [
            Image(
              image: 'gyisc'.png3x,
              width: 1.sw,
              fit: BoxFit.fitWidth,
            ),
            // i 豆值显示区域，需要根据实际图片位置调整
            Positioned(
              top: 178.w,
              left: 140.w,
              child: BaseText(
                text: AppConfig.config.abcLogic.memberInfo.peas.toString(),
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        // 第二张图
        Image(
          image: 'gyisc2'.png3x,
          width: 1.sw,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }
}
