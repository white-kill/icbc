import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/app_config.dart';
import '../../../../../utils/comm_widget_utils.dart';
import 'dangmian_logic.dart';
import 'dangmian_state.dart';

class DangmianPage extends BaseStateless {
  DangmianPage({Key? key}) : super(key: key, title: '当面收款');

  final DangmianLogic logic = Get.put(DangmianLogic());
  final DangmianState state = Get.find<DangmianLogic>().state;

  @override
  List<Widget>? get rightAction => [
        CommWidgetUtils.getMoreIcon(icColor: const Color(0xFF607483)),
      ];

  String maskFirstChar(String input) {
    if (input.isEmpty) return input;
    return '*' + input.substring(1);
  }

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image(image: 'dmsk'.png3x,width: 1.sw * 0.88,).withPadding(
              top: 48.w
            ),
            
            Positioned(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 128.w,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  BaseText(text: '扫一扫，向',color: Color(0xff6666666),).withPadding(
                    top: 4.w
                  ),
                  BaseText(text:  maskFirstChar(AppConfig.config.abcLogic.memberInfo.realName),style: TextStyle(
                    fontSize: 18.sp,
                  ),),
                  BaseText(text: '付钱',color: Color(0xff999999),).withPadding(
                      top: 4.w
                  ),
                ],),

                SizedBox(height: 27.w,),
                Image(image: 'ic_code1'.png,width: 144.w,height: 144.w,),
                SizedBox(height: 47.w,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: 'ay'.png3x,width: 15.w,height: 15.w,),
                    BaseText(text: '工商银行借记卡(${AppConfig.config.abcLogic.cardFour()}) '),
                    SizedBox(width: 10.w,),
                    BaseText(text: '更换',color: Color(0xff4188FF),),
                  ],
                )
              ],
            ))
          ],
        )
      ],
    );
  }
}
