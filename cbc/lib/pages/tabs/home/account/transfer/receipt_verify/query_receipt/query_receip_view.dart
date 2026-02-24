import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../routes/app_pages.dart';
import '../../../../../../../utils/comm_widget_utils.dart';
import 'query_receip_logic.dart';
import 'query_receip_state.dart';

class QueryReceiptPage extends BaseStateless {
  QueryReceiptPage({Key? key}) : super(key: key,title: '查询电子回单');

  final Query_receiptLogic logic = Get.put(Query_receiptLogic());
  final Query_receiptState state = Get.find<Query_receiptLogic>().state;


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
        itemBuilder: (context,index){
          String name  = state.titleNames[index];

          if(name == '电子渠道' || name == '柜面渠道'){
            return Container(
              height: 30.w,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 12.w,right: 12.w),
              child: BaseText(text: name),
            );
          }

          return Container(
            height: 50.w,
            color: Colors.white,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 12.w,right: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseText(text: name,fontSize: 15.sp,),

                Image(image: 'ic_jt_right'.png3x,width: 24.w,height: 24.w,),
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
    }, itemCount: state.titleNames.length);
  }

}
