import 'package:cbc/utils/abc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../routes/app_pages.dart';
import 'print_success_logic.dart';
import 'print_success_state.dart';

class PrintSuccessPage extends BaseStateless {
  PrintSuccessPage({Key? key}) : super(key: key, title: '历史明细打印');

  final Print_successLogic logic = Get.put(Print_successLogic());
  final Print_successState state = Get.find<Print_successLogic>().state;

  @override
  List<Widget>? get rightAction => [
        BaseText(
          text: '分享',
          fontSize: 14.sp,
          color: const Color(0xFF607483),
        ).withContainer(
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: 12.w),
        )
      ];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 8.w),
      children: [
        Stack(
          children: [
            Image(image: 'xdcg'.png),
            BaseText(
                maxLines: 10,
                text:
                '请您在邮箱${logic.email}中接收历史明细文档,并自行打印。'
                    '\n\n如果您喜欢这个功能，可以点击右上角“分享"将该功能分享给朋友。',
              color: Color(0xff666666),).withPadding(
                left: 12.w,right: 12.w,top: 100.w
            )
          ],
        ),

        SizedBox(height: 20.w,),
        AbcButton(
          title: '办理进度',
          fontSize: 18.sp,
          bgColor: Color(0xffCF0000),
          radius: 4.sp,
          height: 45.w,
          onTap: () {
            Routes.printProgressPage.push;
          },
          margin: EdgeInsets.only(left: 18.w, right: 18.w,bottom: 12.w),
        ),

        AbcButton(
          title: '返回首页',
          titleColor: Color(0xffCF0000),
          bgColor: Colors.white,
          fontSize: 18.sp,
          border: Border.all(color: Color(0xffCF0000),width: 1),
          radius: 4.sp,
          height: 45.w,
          onTap: () {
            Get.offAllNamed(Routes.tabs);
          },
          margin: EdgeInsets.only(left: 18.w, right: 18.w,bottom: 12.w),
        ),

        AbcButton(
          title: '返回上一页',
          titleColor: Color(0xffCF0000),
          fontSize: 18.sp,
          bgColor: Colors.white,
          radius: 4.sp,
          height: 45.w,
          border: Border.all(color: Color(0xffF35855),width: 1),
          onTap: () {
            Get.back();
          },
          margin: EdgeInsets.only(left: 18.w, right: 18.w,bottom: 12.w),
        ),
      ],
    );
  }
}
