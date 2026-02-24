import 'package:cbc/config/abc_config/balance_widget.dart';
import 'package:cbc/config/abc_config/cbc_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../routes/app_pages.dart';
import 'transfer_success_logic.dart';
import 'transfer_success_state.dart';

class TransferSuccessPage extends BaseStateless {
  TransferSuccessPage({Key? key}) : super(key: key,title: '转账汇款');

  final TransferSuccessLogic logic = Get.put(TransferSuccessLogic());
  final TransferSuccessState state = Get.find<TransferSuccessLogic>().state;


  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Image(image: 'ic_t_s1'.png3x),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 6.w,),
            BaseText(text: '款项已经汇入收款人账户。',color: Color(0xff333333),fontSize: 17.sp,),
            SizedBox(height: 10.w,),
            Text.rich(
              maxLines: 20,
              TextSpan(
                children: [
                  TextSpan(
                    text: '提示:   您的${logic.bankName}卡(尾号${logic.cardNo.getLastFourByList()}) '
                        '尚未添加至我行手机银行。添加后可享受在我行手机银行服务。',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xff333333),
                    ),
                  ),
                  TextSpan(
                    text: '立即添加>',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xff2F6FED),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).withContainer(
          color: Colors.white,
          width: 1.sw,
          padding: EdgeInsets.only(left: 28.w,right: 28.w,bottom: 20.w)
        ),
        Stack(
          children: [
            Image(image: 'ic_t_s2'.png3x),

            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.w,right: 15.w),
                  height: 48.w,
                  width: 1.sw,
                ).withOnTap(onTap: (){
                  Get.back();
                }),
                SizedBox(height: 8.w,),
                Container(
                  margin: EdgeInsets.only(left: 15.w,right: 15.w),
                  height: 48.w,
                  width: 1.sw,
                ).withOnTap(onTap: (){
                  Get.back();
                }),
                SizedBox(height: 8.w,),
                Container(
                  margin: EdgeInsets.only(left: 15.w,right: 15.w),
                  height: 48.w,
                  width: 1.sw,
                ).withOnTap(onTap: (){
                  Routes.huiKuanPage.push;
                }),
                SizedBox(height: 8.w,),
                Container(
                  margin: EdgeInsets.only(left: 15.w,right: 15.w),
                  height: 48.w,
                  width: 1.sw,
                ),
                SizedBox(height: 8.w,),
                Container(
                  margin: EdgeInsets.only(left: 15.w,right: 15.w),
                  height: 48.w,
                  width: 1.sw,
                )
              ],
            ).withPadding(
              top: 26.w,
            )
          ],
        )
      ],
    );
  }
}
