import 'package:cbc/config/app_config.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:cbc/utils/comm_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'payment_logic.dart';
import 'payment_state.dart';

class PaymentPage extends BaseStateless {
  PaymentPage({super.key});

  final PaymentLogic logic = Get.put(PaymentLogic());
  final PaymentState state = Get.find<PaymentLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Color? get navColor => Colors.white;

  @override
  Color? get titleColor => const Color(0xFF607483);

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
        logic.navActionColor.value = v ? const Color(0xFF607483) : Colors.black;
      };

  @override
  Widget? get titleWidget => Obx(() => BaseText(
        text: "支付",
        fontSize: 17.w,
        color: logic.navActionColor.value,
      ));

  @override
  Widget? get leftItem => Obx(() => Container(
        padding: EdgeInsets.symmetric(vertical: 12.w),
        child: Image(
            image: 'ic_left_back'.png3x, color: logic.navActionColor.value),
      ).withOnTap(onTap: () => Get.back()));

  @override
  List<Widget>? get rightAction => [
        Obx(
          () => Image(
            image: 'ic_nav_service'.png3x,
            width: 20.w,
            height: 20.w,
            color: logic.navActionColor.value,
          )
              .withPadding(right: 20.w)
              .withOnTap(onTap: () => Routes.mineService.push),
        ),
        Obx(
          () =>
              CommWidgetUtils.getMoreIcon(icColor: logic.navActionColor.value),
        ),
      ];

  @override
  Widget initBody(BuildContext context) {
    return Obx(() => Column(
          children: [
            Container(
              height: 136.w,
              child: Stack(
                children: [
                  Image(
                    image: state
                        .tabImg[logic.tabIndex.value]
                            ['tab${logic.typeIndex.value}']!
                        .png3x,
                    width: 1.sw,
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 125.w,
                          height: 40.w,
                        ).withOnTap(onTap: () => logic.tabIndex.value = 0),
                        SizedBox(
                          width: 125.w,
                          height: 40.w,
                        ).withOnTap(onTap: () => logic.tabIndex.value = 1),
                        SizedBox(
                          width: 125.w,
                          height: 40.w,
                        ).withOnTap(onTap: () => logic.tabIndex.value = 2),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Stack(
                    children: [
                      Image(
                        image: state
                            .tabImg[logic.tabIndex.value]
                                ['content${logic.typeIndex.value}']!
                            .png3x,
                        width: 1.sw,
                      ),
                      if (logic.tabIndex.value == 0)
                        Positioned(
                          left: 0,
                          bottom: 17.w,
                          child: SizedBox(
                            width: 1.sw,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 78.w, height: 30.w).withOnTap(
                                  onTap: () => logic.typeIndex.value = 0,
                                ),
                                SizedBox(width: 78.w, height: 30.w).withOnTap(
                                  onTap: () => logic.typeIndex.value = 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (logic.tabIndex.value == 0 &&
                          logic.typeIndex.value == 1)
                        Positioned(
                          left: 16.w,
                          bottom: 58.w,
                          child: SizedBox(
                            width: 200.w,
                            height: 40.w,
                            child: Row(
                              children: [
                                Image(
                                  image: 'ay'.png3x,
                                  width: 24.w,
                                ).withPadding(left: 14.w),
                                BaseText(
                                  text: AppConfig.config.abcLogic.cardInfo(),
                                  fontSize: 14.w,
                                ).withPadding(left: 7.w),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  Stack(
                    children: [
                      Image(
                        image: 'img_payment_footer'.png3x,
                        width: 1.sw,
                      ),
                      Positioned(
                        top: 12.w,
                        left: 15.w,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 69.w,
                              height: 80.w,
                            ).withOnTap(onTap: () => Routes.qrScan.push),
                            SizedBox(
                              width: 69.w,
                              height: 80.w,
                            ).withOnTap(
                                onTap: () => _showYunPayNetPay(context)),
                            SizedBox(
                              width: 69.w,
                              height: 80.w,
                            ).withOnTap(onTap: () => Routes.payDetail.push),
                            SizedBox(
                              width: 69.w,
                              height: 80.w,
                            ).withOnTap(onTap: () => Routes.safeManage.push),
                            SizedBox(
                              width: 69.w,
                              height: 80.w,
                            ).withOnTap(
                                onTap: () => Routes.allPayFunction.push),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }

  void _showYunPayNetPay(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 12.w),
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: Container(
            width: double.infinity,
            height: 202.w,
            padding: EdgeInsets.only(
              top: 24.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.w),
              color: Colors.white,
            ),
            child: Column(
              children: [
                BaseText(
                  text: '云网支付授权提示',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.5.w,
                    color: const Color(0xFF222222),
                  ),
                ).withPadding(left: 24.w, right: 24.w),
                SizedBox(height: 18.w),
                BaseText(
                  text: '您尚未授权开通云闪付网络平台支付，是否开通授权？',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    height: 28 / 15,
                    fontSize: 15.w,
                    color: const Color(0xFF555555),
                  ),
                  maxLines: 2,
                ).withPadding(left: 24.w, right: 24.w),
                SizedBox(height: 33.5.w),
                Container(
                  width: double.infinity,
                  height: 1.w,
                  color: const Color(0xFFEEEEEE),
                ),
                Container(
                  width: 351.w,
                  height: 46.w,
                  child: Row(
                    children: [
                      Container(
                        width: 175.w,
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: BaseText(
                          text: '取消',
                          fontSize: 16.w,
                          color: const Color(0xFF999999),
                        ),
                      ).withOnTap(onTap: () => Get.back()),
                      Container(
                        width: 1.w,
                        height: double.infinity,
                        color: const Color(0xFFEEEEEE),
                      ),
                      Container(
                        width: 175.w,
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: BaseText(
                          text: '立即授权',
                          fontSize: 16.w,
                          color: const Color(0xFFCF0000),
                        ),
                      ).withOnTap(onTap: () => Get.back()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
