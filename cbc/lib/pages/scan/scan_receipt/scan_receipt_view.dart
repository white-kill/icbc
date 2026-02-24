import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../utils/color_util.dart';
import 'scan_receipt_logic.dart';
import 'scan_receipt_state.dart';

class ScanReceiptPage extends BaseStateless {
  ScanReceiptPage({Key? key}) : super(key: key,title: '电子回单');

  final Scan_receiptLogic logic = Get.put(Scan_receiptLogic());
  final Scan_receiptState state = Get.find<Scan_receiptLogic>().state;


  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        String name = state.titleNames[index];

        bool red = name == '收款金额' || name == '手续费' || name == '合计';
        if (name == 'top') {
          return SizedBox(
            height: 50.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Image(image: 'ic_cbc'.png3x,width: 156.w,height: 20.w,),

                    BaseText(
                      text: '境内汇款电子回单',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFF607483),
                      ),
                    )
                  ],
                ).withPadding(left: 16.w,right: 16.w).expanded(),
                Container(
                  width: 1.sw,
                  height: 0.8.w,
                  color: const Color(0xffE9E9E9),
                ),
              ],
            ),
          );
        }
        if (name == 'bottom') {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BaseText(
                    text: '重要提示:本回单不作为收款方发货依据，并请勿重复记账',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xFF607483),
                    ),
                  ),
                  SizedBox(height: 4.w,),
                  BaseText(
                    text: '手机银行转账汇款免收手续费',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: BColors.mainColor,
                    ),
                  ).withPadding(left: 90.w),
                  SizedBox(height: 8.w,),
                  // Image(image: 'ic_code1'.png,width: 120.w,height: 120.w,),
                  GetBuilder(builder: (Scan_receiptLogic c){
                    return logic.qrImage == null?SizedBox(width: 120.w,height: 120.w,):PrettyQrView(
                      qrImage: logic.qrImage!,
                    ).withContainer(
                        width: 120.w,
                        height: 120.w
                    );
                  },id: 'code',),
                  SizedBox(height: 12.w,),
                  BaseText(
                    text: '请使用手机银行-扫一扫功能',
                    style: TextStyle(
                      fontSize: 12.sp,
                      // color: Color(0xFF607483),
                    ),
                  ),

                  SizedBox(height: 25.w,),

                  BaseText(
                    text: '来自 中国工商银行手机银行',
                    style: TextStyle(
                      fontSize: 12.sp,
                      // color: Color(0xFF607483),
                    ),
                  ).withContainer(
                      width: 1.sw,
                      padding: EdgeInsets.only(right: 12.w),
                      alignment: Alignment.centerRight
                  ),

                  SizedBox(height: ScreenUtil().bottomBarHeight + 10.w,),
                ],
              ).withContainer(width: 1.sw,padding: EdgeInsets.only(top: 92.w)),

              Positioned(
                  top:0,right:25.w,
                  child: Image(image: 'zdhd_z'.png,width: 110.w,height: 110.w,))
            ],
          );
        }
        if (name == '') {
          return Column(
            children: [
              Container(
                height: 15.w,
              ),
              Container(
                width: 1.sw,
                height: 0.8.w,
                color: const Color(0xffE9E9E9),
              ),
              Container(
                height: 15.w,
              ),
            ],
          );
        }
        return Container(
          padding: EdgeInsets.only(
            left: 12.w,
            top: 6.w,
            bottom: 8.w,
            right: 12.w,
          ),
          child: Row(
            children: [
              BaseText(
                text: name,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color(0xFF607483),
                ),
              ).withContainer(
                  width: 100.w, alignment: Alignment.centerRight),
              SizedBox(
                width: 40.w,
              ),
              GetBuilder(builder: (Scan_receiptLogic c){
                return BaseText(
                  text: logic.valueStr(name),
                  style:
                  TextStyle(fontSize: 12.sp, color:red?BColors.mainColor:Color(0xff333333)),
                );
              },id: 'updateCard',),

            ],
          ),
        );
      },
      itemCount: state.titleNames.length,
    );
  }

}
