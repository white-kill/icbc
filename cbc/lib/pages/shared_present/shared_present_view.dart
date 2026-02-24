import 'package:cbc/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'shared_present_logic.dart';
import 'shared_present_state.dart';

class SharedPresentPage extends BaseStateless {
  SharedPresentPage({super.key});

  final SharedPresentLogic logic = Get.put(SharedPresentLogic());
  final SharedPresentState state = Get.find<SharedPresentLogic>().state;

  @override
  Widget? get titleWidget => BaseText(
        text: '分享有礼',
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
  Widget initBody(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.white,
          width: 1.sw,
          padding: EdgeInsets.only(bottom: 16.w,top: 32.w),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 32.w),
                  Image(
                    image: 'ic_avator'.png3x,
                    width: 64.w,
                    height: 64.w,
                  ),
                  SizedBox(width: 7.w),
                  Column(
                    children: [
                      BaseText(
                        text: AppConfig.config.abcLogic.memberInfo.realName
                            .removeFirstChar1(),
                        fontSize: 14.w,
                        color: const Color(0xFF111111),
                      ),
                      SizedBox(height: 3.w),
                      BaseText(
                        text: AppConfig.config.abcLogic.memberInfo.city,
                        fontSize: 13.w,
                        color: const Color(0xFF999999),
                      ),
                    ],
                  ),
                  SizedBox(width: 140.w),
                  BaseText(
                    text: '我的业绩 >',
                    fontSize: 13.w,
                    color: const Color(0xFFCA2626),
                  ),
                ],
              ),
            ],
          ),
        ),
        Image(
          image: 'img_shared_present'.png3x,
          width: 1.sw,
        ),
      ],
    );
  }
}
