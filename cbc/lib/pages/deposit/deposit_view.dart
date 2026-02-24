import 'package:cbc/routes/app_pages.dart';
import 'package:cbc/utils/comm_widget_utils.dart';
import 'package:cbc/utils/scale_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'deposit_logic.dart';
import 'deposit_state.dart';

class DepositPage extends BaseStateless {
  DepositPage({super.key});

  final DepositLogic logic = Get.put(DepositLogic());
  final DepositState state = Get.find<DepositLogic>().state;

  @override
  Widget? get titleWidget => BaseText(
        text: '存款',
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
        SizedBox(
          width: 1.sw,
          child: Stack(
            children: [
              Image(
                image: 'bg_deposit'.png3x,
                width: 1.sw,
              ),
              Positioned(
                top: 36.w,
                left: 34.w,
                child: Container(
                  width: 312.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          BaseText(
                            text: '我的存款(元)',
                            color: Colors.white,
                            fontSize: 11.5.w,
                          ),
                          SizedBox(width: 9.w),
                          Obx(
                            () => Image(
                              image: logic.canSee.value
                                  ? 'ic_deposit_eye_open'.png3x
                                  : 'ic_deposit_eye_close'.png3x,
                              width: 16.w,
                            ),
                          ),
                        ],
                      ).withOnTap(onTap: () {
                        logic.canSee.value = !logic.canSee.value;
                      }),
                      SizedBox(height: 10.w),
                      Obx(
                        () => BaseText(
                          text: logic.canSee.value ? '0.00' : '****',
                          color: Colors.white,
                          fontSize: 21.w,
                        ),
                      ),
                      SizedBox(height: 16.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              BaseText(
                                text: '最近一笔即将到期存款',
                                color: Colors.white,
                                fontSize: 10.w,
                              ),
                              SizedBox(width: 7.w),
                              Image(
                                image: 'ic_deposit_info'.png3x,
                                width: 14.w,
                              ),
                            ],
                          ),
                          BaseText(
                            text: '到期日',
                            color: Colors.white,
                            fontSize: 10.w,
                          ),
                        ],
                      ),
                      SizedBox(height: 8.w),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BaseText(
                              text: logic.canSee.value ? '暂无' : '****',
                              color: Colors.white,
                              fontSize: 11.5.w,
                            ),
                            Row(
                              children: [
                                logic.canSee.value
                                    ? Image(
                                        image: 'ic_deposit_voice'.png3x,
                                        width: 12.w,
                                      )
                                    : const SizedBox.shrink(),
                                logic.canSee.value
                                    ? SizedBox(width: 8.w)
                                    : const SizedBox.shrink(),
                                BaseText(
                                  text: logic.canSee.value
                                      ? '尚未存入存款，快来存一笔吧!'
                                      : '****',
                                  color: Colors.white,
                                  fontSize: 11.5.w,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
