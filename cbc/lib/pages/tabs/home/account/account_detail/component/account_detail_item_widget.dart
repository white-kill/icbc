import 'package:cbc/pages/deposit/deposit_view.dart';
import 'package:cbc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../config/model/bill_item_model.dart';

class AccountDetailItemWidget extends StatefulWidget {
  final BillItemList model;
  final int index;

  const AccountDetailItemWidget(
      {super.key, required this.model, required this.index});

  @override
  State<AccountDetailItemWidget> createState() =>
      _AccountDetailItemWidgetState();
}

class _AccountDetailItemWidgetState extends State<AccountDetailItemWidget> {
  String amount() {
    // 解析金额并格式化为带千位分隔符的格式
    double value = double.parse(widget.model.amount);
    String formattedAmount = value.abs().bankBalance;
    String fh = widget.model.type == '2' ? '-' : '+';
    return fh + formattedAmount;
  }

  String removeLeadingZero(String input) {
    return input.replaceAll(RegExp(r'^0+'), '');
  }

  Color _tColor(String text) {
    if (text == '周六' || text == '周日') return const Color(0xff496AC5);
    return const Color(0xff636B88);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 81.w,
      width: 1.sw,
      child: Column(
        children: [
          widget.model.daily != ''
              ? Container(
                  width: 1.sw,
                  height: 0.8.w,
                  color: const Color(0xffE9E9E9),
                )
              : Container(
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
                    SizedBox(
                      height: 14.w,
                    ),
                    BaseText(
                      text: removeLeadingZero(
                        widget.model.daily,
                      ),
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: _tColor(widget.model.week),
                          fontWeight: FontWeight.bold),
                    ),
                    BaseText(
                      text: widget.model.week,
                      style: TextStyle(
                          fontSize: 9.sp, color: _tColor(widget.model.week)),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1.sw - 38.w,
                height: 80.w,
                color: Colors.white,
                padding: EdgeInsets.only(left: 10.w, right: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BaseText(
                          text: widget.model.excerpt,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xff303030),
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                        buildAmountText(
                          amount: amount(),
                          color: widget.model.type == '1'
                              ? const Color(0xffC34236)
                              : const Color(0xff35827D),
                          fontSize: 18.sp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    BaseText(
                      text: widget.model.merchantBranch,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xff303030),
                          height: 1),
                    ),
                    SizedBox(
                      height: 13.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            BaseText(
                              text: formatBankCard(widget.model.bankCard),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: const Color(0xff696969),
                                  height: 1),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            BaseText(
                              text: widget.model.time,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: const Color(0xff999999),
                                  height: 1),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            BaseText(
                              text: '余额:',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: const Color(0xff4A515B),
                                  height: 1),
                            ),
                            buildAmountText(
                              amount: double.parse(widget.model.accountBalance).bankBalance,
                              color: const Color(0xff4A515B),
                              fontSize: 11.sp,
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
