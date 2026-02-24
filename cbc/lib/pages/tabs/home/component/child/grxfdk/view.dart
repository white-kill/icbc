import 'package:cbc/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class GrxfdkPage extends BaseStateless {
  GrxfdkPage({Key? key}) : super(key: key, title: "个人消费贷款");

  final GrxfdkLogic logic = Get.put(GrxfdkLogic());
  final GrxfdkState state = Get.find<GrxfdkLogic>().state;
  
  @override
  Widget initBody(BuildContext context) {
    return Stack(
      children: [
        Image(image: "grxfdk".png, width: 1.sw,),
        Positioned(
            left: 120.w,
            top: 15.w,
            child: Text(AppConfig.config.abcLogic.realName(), style: TextStyle(
          fontSize: 12.w,
          height: 1.0,
          color: Colors.black
        ),)),
        Positioned(
            left: 120.w,
            top: 45.w,
            child: Text(AppConfig.config.abcLogic.memberInfo.idCard.desensitize(prefixLen: 3,suffixLen: 2), style: TextStyle(
                fontSize: 12.w,
                height: 1.0,
                color: Colors.black
            ),)),
        Positioned(
            left: 120.w,
            top: 75.w,
            child: Text("${AppConfig.config.abcLogic.memberInfo.certificateEndTime}", style: TextStyle(
                fontSize: 12.w,
                height: 1.0,
                color: Colors.black
            ),)),
        Positioned(
            left: 120.w,
            top: 105.w,
            child: Text(AppConfig.config.abcLogic.memberInfo.sex == "1" ? "男" : "女", style: TextStyle(
                fontSize: 12.w,
                height: 1.0,
                color: Colors.black
            ),)),
        Positioned(
            left: 120.w,
            top: 183.w,
            child: Text(AppConfig.config.abcLogic.memberInfo.city, style: TextStyle(
                fontSize: 12.w,
                height: 1.0,
                color: Color(0xFF2273EB)
            ),)),
        Positioned(
            left: 120.w,
            top: 372.w,
            child: Text(AppConfig.config.abcLogic.memberInfo.phone.desensitize(prefixLen: 3, suffixLen: 4), style: TextStyle(
                fontSize: 12.w,
                height: 1.0,
                color: Color(0xFF2273EB)
            ),))

        // Container(
        //     width: 1.sw, height: 0.8.w, color: const Color(0xFFE5E5E5)),
        // _buildItem(
        //   '证件号码',
        //   (AppConfig.config.abcLogic.memberInfo.serialNumber.isNullOrEmpty?'342000000000000024':AppConfig.config.abcLogic.memberInfo.serialNumber)
        //       .desensitize(prefixLen: 3, suffixLen: 2),
        // ),
        // Container(
        //     width: 1.sw, height: 0.8.w, color: const Color(0xFFE5E5E5)),
        // _buildItem(
        //   '手机号码',
        //   AppConfig.config.abcLogic.phone(),
        // ),
      ],
    );
  }
}
