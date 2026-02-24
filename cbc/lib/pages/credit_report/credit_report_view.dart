import 'package:cbc/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'credit_report_logic.dart';
import 'credit_report_state.dart';

class CreditReportPage extends BaseStateless {
  CreditReportPage({super.key});

  final CreditReportLogic logic = Get.put(CreditReportLogic());
  final CreditReportState state = Get.find<CreditReportLogic>().state;

  @override
  Widget? get titleWidget => BaseText(
        text: '查询信用报告',
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
        BaseText(
          text: '查询记录',
          style: TextStyle(
            height: 34 / 14,
            fontSize: 14.w,
            color: const Color(0xFF607483),
          ),
        ).withPadding(right: 18.w)
      ];

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: const Color(0xFFF4F4F4),
      padding: EdgeInsets.only(top: 9.w),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: 1.sw,
            height: 139.w,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                    width: 1.sw, height: 0.8.w, color: const Color(0xFFE5E5E5)),
                _buildItem(
                  '姓名',
                  AppConfig.config.abcLogic.realName(),
                ),
                Container(
                    width: 1.sw, height: 0.8.w, color: const Color(0xFFE5E5E5)),
                _buildItem(
                  '证件号码',
                  (AppConfig.config.abcLogic.memberInfo.serialNumber.isNullOrEmpty?'342000000000000024':AppConfig.config.abcLogic.memberInfo.serialNumber)
                      .desensitize(prefixLen: 3, suffixLen: 2),
                ),
                Container(
                    width: 1.sw, height: 0.8.w, color: const Color(0xFFE5E5E5)),
                _buildItem(
                  '手机号码',
                  AppConfig.config.abcLogic.phone(),
                ),
                Container(
                    width: 1.sw, height: 0.8.w, color: const Color(0xFFE5E5E5)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6.w),
            padding: EdgeInsets.only(top: 18.w),
            child: Text.rich(
              style: const TextStyle(
                height: 1.5,
              ),
              TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Obx(
                        () => Image(
                          image: state.selected.value
                              ? 'ic_credit_report_check'.png3x
                              : 'ic_credit_report_uncheck'.png3x,
                          width: 15.w,
                          height: 15.w,
                        ),
                      ),
                    ).withOnTap(
                        onTap: () =>
                            state.selected.value = !state.selected.value),
                  ),
                  TextSpan(
                    text: '我已阅读并同意',
                    style: TextStyle(
                      fontSize: 14.w,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  TextSpan(
                    text: '《中国工商银行个人信用报告查询授权协议》',
                    style: TextStyle(
                      fontSize: 14.w,
                      color: const Color(0xFF196FD5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 13.w, vertical: 11.w),
              height: 42.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.w),
                color: state.selected.value
                    ? const Color(0xFFCC3333)
                    : const Color(0xFF8B8B8B),
              ),
              child: Center(
                child: BaseText(
                  text: '刷脸查询',
                  fontSize: 17.w,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Image(
            image: 'img_credit_report_rule'.png3x,
            width: 1.sw,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String title, String value) {
    return Container(
      width: 1.sw,
      height: 45.w,
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseText(
            text: title,
            fontSize: 14.w,
            color: const Color(0xFF333333),
          ),
          BaseText(
            text: value,
            fontSize: 14.w,
            color: const Color(0xFF333333),
          ),
        ],
      ),
    );
  }
}
