import 'package:cbc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/model/pay_ment_model.dart';

class BillItemWidget extends StatefulWidget {
  final  PayMentList model;
  const BillItemWidget({super.key, required this.model});

  @override
  State<BillItemWidget> createState() => _BillItemWidgetState();
}

class _BillItemWidgetState extends State<BillItemWidget> {

  Color _tColor(String text) {
    if (text == '周六' || text == '周日') return const Color(0xff496AC5);
    return const Color(0xff636B88);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:100.w,
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
                height: 80.w + 19.w,
                color: const Color(0xffFAFAFA),
                child: Column(
                  children: [
                    SizedBox(height: 14.w,),
                    BaseText(text: widget.model.daily,style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                        color: _tColor(widget.model.week),
                    ),),
                    BaseText(text: widget.model.week,style: TextStyle(
                        fontSize: 9.sp,
                      color: _tColor(widget.model.week)
                    ),),
                  ],
                ),
              ),
              Container(
                width: 1.sw - 38.w,
                height: 80.w + 19.w,
                color: Colors.white,
                padding: EdgeInsets.only(left: 10.w,right: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            netImage(
                              url: widget.model.categoryIcon,
                              width: 26.w,
                              height: 26.w,
                            ).withPadding(
                              left: 6.w,
                              right: 6.w,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BaseText(text: widget.model.excerpt,style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    height: 1
                                ),),
                                SizedBox(height: 12.w,),
                                BaseText(text: widget.model.merchantBranch,style: TextStyle(
                                    fontSize: 13.sp,
                                    // color: const Color(0xff333333),
                                    fontWeight: FontWeight.w500,
                                    height: 1
                                ),).withContainer(
                                  width: 170.w
                                ),
                              ],
                            )
                          ],
                        ),

                        buildAmountText(
                          amount: double.parse(widget.model.amount) > 0 
                              ? "+${double.parse(widget.model.amount).bankBalance}" 
                              : double.parse(widget.model.amount).bankBalance,
                          color: widget.model.type == '1'
                              ? const Color(0xffC34236)
                              : const Color(0xff35827D),
                          fontSize: 19.sp,
                        ),
                      ],
                    ),


                    SizedBox(height: 15.w,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 30.w,),
                            BaseText(text: formatBankCard(widget.model.bankCard),style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xff696969),
                                height: 1
                            ),),
                            SizedBox(width: 10.w,),
                            BaseText(text: widget.model.time,style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xff696969),
                                height: 1
                            ),),
                          ],
                        ),
                        Row(
                          children: [
                            BaseText(text: '余额: ',style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xff4A515B),
                                height: 1
                            ),),
                            buildAmountText(
                              amount: double.parse(widget.model.accountBalance).bankBalance,
                              color: const Color(0xff4A515B),
                              fontSize: 13.sp,
                              height: 1.0
                            ),
                          ],
                        ),
                      ],
                    ),
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
