import 'package:cbc/config/dio/network.dart';
import 'package:cbc/config/net_config/apis.dart';
import 'package:cbc/pages/tabs/home/account/print/component/code_alter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../../../../utils/abc_button.dart';
import '../../../../../../utils/comm_widget_utils.dart';
import '../print_face/pre_face/pre_face_view.dart';
import '../print_success/print_success_view.dart';
import 'print_confirm_logic.dart';
import 'print_confirm_state.dart';

class Print_confirmPage extends BaseStateless {
  Print_confirmPage({Key? key}) : super(key: key,title: '订单确认');

  final Print_confirmLogic logic = Get.put(Print_confirmLogic());
  final Print_confirmState state = Get.find<Print_confirmLogic>().state;

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
      padding: EdgeInsets.zero,
      children: [
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 8.w),
            itemBuilder: (context,index){
              return Container(
                height: 42.w,
                color: Colors.white,
                padding: EdgeInsets.only(left: 15.w,right: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(text: state.nameList[index],color: Color(0xff666666),),
                    BaseText(text: logic.valueStr(state.nameList[index]),color: Color(0xff666666),),
                  ],
                ),
              );
            }, separatorBuilder: (context,index){
          return Container(
            width: 1.sw,
            height: 0.8.w,
            color: const Color(0xffE9E9E9),
          );
        }, itemCount: state.nameList.length),

        SizedBox(height: 25.w,),
        AbcButton(
          title: '确认下单',
          height: 48.w,
          radius: 6.w,
          fontSize: 17.sp,
          bgColor: Color(0xffCF0000),
          onTap: () async {



            await Get.to(() => PreFacePage());
            AlterWidget.alterWidget(builder: (context) {
              return CodeAlterWidget(
                sureCallBack: () {
                  print(logic.reqPrint.toJson());
                  SmartDialog.dismiss();
                  Http.post(Apis.print,data: logic.reqPrint.toJson()).then((v){
                    if(v != null){
                      Get.to(() => PrintSuccessPage(),arguments: {
                        'email':logic.reqPrint.email
                      });
                    }
                  });
                },
              );
            });
          },
          margin: EdgeInsets.only(left: 12.w, right: 12.w),
        ),
      ],
    );
  }
}
