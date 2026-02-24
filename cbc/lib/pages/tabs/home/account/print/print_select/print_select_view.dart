import 'package:cbc/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'print_select_logic.dart';
import 'print_select_state.dart';

class PrintSelectPage extends BaseStateless {
  PrintSelectPage({Key? key}) : super(key: key,title:Get.arguments?['title']??'');

  final PrintSelectLogic logic = Get.put(PrintSelectLogic());
  final PrintSelectState state = Get.find<PrintSelectLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return logic.nameList.isEmpty?Column(
      children: [
        SizedBox(height: 8.w,),
        Container(
          height: 45.w,
          color: Colors.white,
          padding: EdgeInsets.only(left: 15.w,right: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                    image: 'ic_gs_card'.png3x,
                    width: 40.w,
                    height: 32.w,
                  ),
                  SizedBox(width: 8.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseText(text: '${AppConfig.config.abcLogic.memberInfo.city} 工银借记卡',fontSize: 12.sp,),
                      BaseText(text: AppConfig.config.abcLogic.card(),fontSize: 12.sp,)
                    ],
                  )
                ],
              ),
              Image(image: 'ic_jt_right'.png3x,width: 23.w,height: 23.w,)
            ],
          ),
        ).withOnTap(onTap: (){
          Get.back();
        })
      ],
    ): ListView.separated(
        padding: EdgeInsets.only(top: 8.w),
        itemBuilder: (context,index){
          return Container(
            height: 42.w,
            color: Colors.white,
            padding: EdgeInsets.only(left: 15.w,right: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(text: logic.nameList[index]),
                Image(image: 'ic_jt_right'.png3x,width: 23.w,height: 23.w,)
              ],
            ),
          ).withOnTap(onTap: (){
            Get.back(result: logic.nameList[index]);
          });
        }, separatorBuilder: (context,index){
      return Container(
        width: 1.sw,
        height: 0.8.w,
        color: const Color(0xffE9E9E9),
      );
    }, itemCount: logic.nameList.length);
  }
}
