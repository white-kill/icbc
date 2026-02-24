import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../utils/comm_widget_utils.dart';
import 'detail_logic.dart';
import 'detail_state.dart';

class DetailPage extends BaseStateless {
  DetailPage({Key? key}) : super(key: key,title: '个人信息');

  final DetailLogic logic = Get.put(DetailLogic());
  final DetailState state = Get.find<DetailLogic>().state;

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
    return ListView.separated(
      padding: EdgeInsets.only(top: 8.w),
      itemBuilder: (context, index) {
        String title = state.titleList[index];
        return Container(
          height:42.w,
          width: 1.sw,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseText(text: title),
              Row(
                children: [
                  title == '头像'?Image(
                    image: 'ic_avator'.png3x,
                    width: 55.w,
                  ):BaseText(text: logic.valueStr(title)),
                  Image(image: 'ic_jt_right'.png3x,width: 22.w,height: 22.w,),
                ],
              )
            ],
          ).withPadding(
              left: 16.w,right: 12.w
          ),
        );
      },
      itemCount: state.titleList.length,
      separatorBuilder: (BuildContext context, int index) {
        bool line = (
            state.titleList[index] == '性别'
                || state.titleList[index] == '证件有效期'
                || state.titleList[index] == '联系地址'
                || state.titleList[index] == '个人信息维护明细'
        );
        return Container(
          width: 1.sw,
          height:line?10.w:0.8.w,
          color:const Color(0xFFF5F5F5),
        );
      },
    );
  }
}
