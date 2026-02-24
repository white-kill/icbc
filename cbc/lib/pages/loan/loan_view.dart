import 'package:card_swiper/card_swiper.dart';
import 'package:cbc/pages/component/rect_swiper_plugin.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:cbc/utils/comm_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'loan_logic.dart';
import 'loan_state.dart';

class LoanPage extends BaseStateless {
  LoanPage({super.key});

  final LoanLogic logic = Get.put(LoanLogic());
  final LoanState state = Get.find<LoanLogic>().state;

  @override
  Widget? get titleWidget => BaseText(
        text: '贷款',
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
        _buildBanner(),
        Image(
          image: 'bg_loan_bottom'.png3x,
          width: 1.sw,
        ),
      ],
    );
  }

  Widget _buildBanner() {
    return Container(
      width: 1.sw,
      height: 180.w,
      color: Colors.white,
      child: Swiper(
        loop: false,
        viewportFraction: 0.94,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
            right: 2.w,
            bottom: 6.w,
          ),
          builder: RectSwiperPlugin(),
        ),
        itemCount: 2,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              alignment: Alignment.center,
              child: Image(
                image: 'img_loan_banner1'.png3x,
                width: 375.w,
                height: 155.w,
                fit: BoxFit.fill,
              ),
            );
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image(
                  image: 'img_loan_banner2'.png3x,
                  width: 375.w,
                  height: 155.w,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: 20.w,
                  top: 12.w,
                  child: Container(
                    width: 312.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            BaseText(
                              text: '贷款余额(元)',
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
                        SizedBox(height: 6.w),
                        Obx(
                          () => BaseText(
                            text: logic.canSee.value ? '0.00' : '****',
                            color: Colors.white,
                            fontSize: 21.w,
                          ),
                        ),
                        SizedBox(height: 10.w),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                BaseText(
                                  text: '最近一期还款金额(元)',
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
                                text: logic.canSee.value ? '0.00' : '****',
                                color: Colors.white,
                                fontSize: 11.5.w,
                              ),
                              Row(
                                children: [
                                  BaseText(
                                    text: logic.canSee.value
                                        ? '-'
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
          );
        },
      ),
    );
  }
}
