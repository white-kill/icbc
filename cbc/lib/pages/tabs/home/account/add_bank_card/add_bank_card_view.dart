import 'package:cbc/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../utils/abc_button.dart';
import '../../../../../utils/comm_widget_utils.dart';
import 'add_bank_card_logic.dart';
import 'add_bank_card_state.dart';

class AddBankCardPage extends BaseStateless {
  AddBankCardPage({Key? key}) : super(key: key, title: '添加银行卡');

  final AddBankCardLogic logic = Get.put(AddBankCardLogic());
  final AddBankCardState state = Get.find<AddBankCardLogic>().state;



  @override
  List<Widget>? get rightAction =>  [
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
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 45.w,
          width: 1.sw,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 12.w),
          child: BaseText(text: '银行卡信息',fontSize: 15.sp,color: Color(0xff666666),),
        ),
        
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _itemWidget(state.titleList[index]);
          },
          itemCount: state.titleList.length,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              width: 1.sw,
              height: 0.5.w,
              color: const Color(0xffEFEFEF),
            );
          }, //state.list.length,
        ),
        
        SizedBox(height: 25.w,),
        AbcButton(
          title: '下一步',
          height: 48.w,
          radius: 6.w,
          bgColor: Color(0xff999999),
          onTap: () {

          },
          margin: EdgeInsets.only(left: 12.w, right: 12.w),
        ),

      ],
    );
  }

  Widget _itemWidget(String name) {
    return Container(
      height: 45.w,
      width: 1.sw,
      color: Colors.white,
      padding: EdgeInsets.only(left: 12.w, right: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [BaseText(text: name), _rightWidget(name)],
      ),
    );
  }

  Widget _rightWidget(String name) {
    if (name == '银行卡号') {
      return Row(
        children: [
          BaseText(
            text: '支持本人的工行和地行卡',
            fontSize: 12.sp,
            color: Color(0xff999999),
          ),
          Image(
            image: 'bg_camera'.png3x,
            width: 25.w,
            height: 25.w,
          ),
        ],
      );
    }
    if (name == '开户银行') {
      return Row(
        children: [
          BaseText(
            text: '请选择',
            fontSize: 12.sp,
            color: Colors.blueAccent,
          ),
          Image(
            image: 'ic_jt_right'.png3x,
            width: 25.w,
            height: 25.w,
          ),
        ],
      );
    }
    if (name == '持卡人姓名') {
      return BaseText(
        text: maskFirstChar(AppConfig.config.abcLogic.memberInfo.realName),
        fontSize: 15.sp,
        color: Colors.blueAccent,
      );
    }
    return Container();
  }

  String maskFirstChar(String input) {
    if (input.isEmpty) return input;
    return '*' + input.substring(1);
  }
}
