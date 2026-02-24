import 'package:cbc/config/abc_config/balance_eye_widget.dart';
import 'package:cbc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../config/model/transfer_page_model.dart';

class HuikuanItemWidget extends StatefulWidget {
  final TransferPageList model;
  const HuikuanItemWidget({super.key, required this.model});

  @override
  State<HuikuanItemWidget> createState() => _HuikuanItemWidgetState();
}

class _HuikuanItemWidgetState extends State<HuikuanItemWidget> {

  String amount(){
    String p = widget.model.amount.bankBalance.replaceAll('-', '');
    String fh = widget.model.type == '2'?'-':'+';
    return fh + p;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height:81.w,
      width: 1.sw,
      child: Column(
        children: [
          widget.model.daily != ''? Container(
            width: 1.sw,
            height: 0.8.w,
            color: const Color(0xffE9E9E9),
          ):Container(
            width: 1.sw - 38.w,
            height: 0.8.w,
            margin: EdgeInsets.only(left: 38.w),
            color: const Color(0xffE9E9E9),
          ),
          Row(
            children: [
              Container(
                width: 38.w,
                height: 80.w,
                color: const Color(0xffFAFAFA),
                child: Column(
                  children: [
                    SizedBox(height: 14.w,),
                    BaseText(text: widget.model.daily,style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold
                    ),),
                    BaseText(text: widget.model.week,style: TextStyle(
                      fontSize: 9.sp,
                    ),),
                  ],
                ),
              ),
              Container(
                width: 1.sw - 38.w,
                height: 80.w,
                color: Colors.white,
                padding: EdgeInsets.only(left: 10.w,right: 12.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    netImage(url: widget.model.icon,width: 30.w,height: 30.w).withPadding(
                      right: 10.w,top: 12.w
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BaseText(text:  widget.model.oppositeName,style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xff303030),
                                fontWeight: FontWeight.bold,
                                height: 1
                            ),),
                            BaseText(text:  amount(),style: TextStyle(
                                fontSize: 18.sp,
                                color: widget.model.type == '1'?const Color(0xffC34236):const Color(0xff35827D),
                                fontWeight: FontWeight.bold,
                                height: 1
                            ),),
                          ],
                        ),

                        SizedBox(height: 5.w,),
                        BaseText(text:  widget.model.oppositeAccount,style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xff303030),
                            height: 1
                        ),),
                        SizedBox(height: 13.w,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                BaseText(text:  widget.model.time,style: TextStyle(
                                    fontSize: 10.sp,
                                    color: const Color(0xff696969),
                                    height: 1
                                ),),
                                // SizedBox(width: 10.w,),
                                // BaseText(text: '12-1',style: TextStyle(
                                //     fontSize: 10.sp,
                                //     color: const Color(0xff999999),
                                //     height: 1
                                // ),),
                              ],
                            ),
                            // Row(
                            //   children: [
                            //     BaseText(text: '余额:',style: TextStyle(
                            //         fontSize: 11.sp,
                            //         color: const Color(0xff4A515B),
                            //         height: 1
                            //     ),),
                            //     BaseText(text: 12.1.bankBalance,style: const TextStyle(
                            //         fontSize: 10.11,
                            //         color: Color(0xff4A515B),
                            //         fontWeight: FontWeight.bold,
                            //         height: 1
                            //     ),),
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ).expanded()
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
