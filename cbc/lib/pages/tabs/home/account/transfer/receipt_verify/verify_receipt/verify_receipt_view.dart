import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../routes/app_pages.dart';
import '../../../../../../../utils/abc_button.dart';
import '../../../../../../../utils/comm_widget_utils.dart';
import 'verify_receipt_logic.dart';
import 'verify_receipt_state.dart';

class VerifyReceiptPage extends BaseStateless {
  VerifyReceiptPage({Key? key}) : super(key: key,title: '验证电子回单');

  final Verify_receiptLogic logic = Get.put(Verify_receiptLogic());
  final Verify_receiptState state = Get.find<Verify_receiptLogic>().state;


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
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 10.w),
            itemBuilder: (context,index){
              String name  = state.titleNames[index];
              return Container(
                height: 50.w,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 12.w,right: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(text: name,fontSize: 15.sp,),

                    index == 0?const TextFieldWidget(
                      hintText: '请输入12或16或20位的回单号',
                      textAlign: TextAlign.end,
                    ).withContainer(
                        width: 250.w
                    ):BaseText(text: '个人业务回单',color: Colors.blue,)
                  ],
                ),
              ).withOnTap(onTap: (){
                if(name == '转账汇款回单'){
                  Routes.huiKuanPage.push;
                }
              });
            }, separatorBuilder: (context,index){
          return Container(
            width: 1.sw,
            height: 0.8.w,
            color: const Color(0xffE9E9E9),
          );
        }, itemCount: state.titleNames.length),

        AbcButton(
          title: '读取回单二维码',
          height: 48.w,
          radius: 6.w,
          onTap: () {
          },
          margin: EdgeInsets.only(left: 12.w, right: 12.w,top: 20.w),
        ),

        AbcButton(
          title: '确定',
          height: 48.w,
          radius: 6.w,
          onTap: () {
          },
          margin: EdgeInsets.only(left: 12.w, right: 12.w,top: 10.w),
        )
      ],
    );
  }
}
