import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../config/app_config.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/comm_widget_utils.dart';
import 'login_manage_logic.dart';
import 'login_manage_state.dart';

class LoginManagePage extends BaseStateless {
  LoginManagePage({Key? key}) : super(key: key,title: '登录管理');

  final Login_manageLogic logic = Get.put(Login_manageLogic());
  final Login_manageState state = Get.find<Login_manageLogic>().state;


  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'ic_nav_service'.png3x,
      width: 20.w,
      height: 20.w,
      color: const Color(0xFF607483),
    )
        .withPadding(right: 20.w)
        .withOnTap(onTap: () => Routes.mineService.push),
    CommWidgetUtils.getMoreIcon(icColor: const Color(0xFF607483)),
  ];


  @override
  Widget initBody(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Image(image: 'dkgl1'.png),
            BaseText(text: '您好,${AppConfig.config.abcLogic.realName()}',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.w
            ),).withPadding(
              left: 15.w,top: 8.w,
            ),

            GetBuilder(builder: (Login_manageLogic c){
              return Column(
                children:state.titleNames.map((e){
                  return Row(
                    children: [
                      BaseText(text: '$e  ',fontSize: 11.sp,color: Color(0xff666666),),
                      BaseText(text: logic.valueStr(e),fontSize: 11.sp,color: Color(0xff666666),)
                    ],
                  ).withPadding(
                      top: 4.w
                  );
                }).toList(),
              ).withPadding(
                  left: 15.w,
                  top: 30.w
              );
            },id: 'updateUI',)
          ],
        ),
        Image(image: 'dkgl2'.png),
        Image(image: 'dkgl3'.png),
      ],
    );
  }
}
