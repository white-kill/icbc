import 'package:cbc/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'message_center_logic.dart';
import 'message_center_state.dart';

class MessageCenterPage extends BaseStateless {
  MessageCenterPage({super.key});

  final MessageCenterLogic logic = Get.put(MessageCenterLogic());
  final MessageCenterState state = Get.find<MessageCenterLogic>().state;

  @override
  Color? get navColor => Colors.white;

  @override
  Widget? get titleWidget => Obx(
        () => BaseText(
          text: '消息中心',
          fontSize: 17.w,
          color: logic.navActionColor.value,
        ),
      );

  @override
  Widget? get leftItem => Obx(
        () => Container(
          padding: EdgeInsets.symmetric(vertical: 12.w),
          child: Image(
            image: 'ic_left_back'.png3x,
            color: logic.navActionColor.value,
          ),
        ).withOnTap(onTap: () => Get.back()),
      );

  @override
  List<Widget>? get rightAction => [
        Obx(() => Container(
              padding: EdgeInsets.only(right: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: 'ic_message_center_clean'.png3x,
                    width: 20.w,
                    height: 20.w,
                    color: logic.navActionColor.value,
                  ),
                  BaseText(
                    text: '全部已读',
                    fontSize: 9.w,
                    color: logic.navActionColor.value,
                  ),
                ],
              ),
            )),
        Obx(() => Container(
              padding: EdgeInsets.only(right: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: 'ic_message_center_user'.png3x,
                    width: 20.w,
                    height: 20.w,
                    color: logic.navActionColor.value,
                  ),
                  BaseText(
                    text: '消息管理',
                    fontSize: 9.w,
                    color: logic.navActionColor.value,
                  ),
                ],
              ),
            ).withOnTap(onTap: () => Routes.messageManager.push)),
      ];

  @override
  Color? get background => const Color(0xFFF4F5F7);

  @override
  bool get isChangeNav => true;

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
        logic.navActionColor.value = v ? Colors.black : Colors.white;
      };

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Image(
          image: 'bg_xxzx'.png3x,
          fit: BoxFit.fitWidth,
          width: 1.sw,
        ),
      ],
    );
  }
}
