import 'package:cbc/config/abc_config/balance_eye_widget.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:cbc/utils/widget_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/model/pay_ment_model.dart';
import '../bill_analyze/bill_analyze_view.dart';
import 'bill_tip.dart';

class BillItemMonth extends StatefulWidget {
  final PayMentList model;

  const BillItemMonth({super.key, required this.model});

  @override
  State<BillItemMonth> createState() => _BillItemMonthState();
}

class _BillItemMonthState extends State<BillItemMonth> {
  int year = 0;
  int month = 0;

  int currentMonty = 0;
  int currentYear = 0;

  @override
  void initState() {
    super.initState();
    List<String> parts =
        widget.model.day.replaceAll("年", "-").replaceAll("月", "").split("-");
    year = int.parse(parts[0]);
    month = int.parse(parts[1]);
    currentMonty = DateTime.now().month;
    currentYear = DateTime.now().year;
  }

  Color monthColor(int month) {
    if (month == 1 || month == 2) {
      return const Color(0xff686A81);
    }
    if (month == 3 || month == 6 || month == 7) {
      return const Color(0xff55954A);
    }
    if (month == 4 || month == 5) {
      return const Color(0xff6AA08A);
    }
    if (month == 8 || month == 12) {
      return const Color(0xff2B1A75);
    }
    if (month == 9) {
      return const Color(0xff718B45);
    }
    if (month == 10) {
      return const Color(0xff224750);
    }
    if (month == 11) {
      return const Color(0xff937F4B);
    }
    return Color(0xff1B8561);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image(
          image: 'bill_$month'.png3x,
          fit: BoxFit.fill,
          width: 1.sw,
          height: (currentMonty == month && currentYear == year) ? 80.w : 68.w,
        ),
        Positioned(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(
                  image: 'm_bill_$month'.png3x,
                  width: 32.w,
                  height: 32.w,
                ).withPadding(right: 12.w),
                (currentMonty == month && currentYear == year)
                    ? Container(
                        width: 100.w,
                        height: 32.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: monthColor(month),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.w))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BaseText(
                              text: '收支分析',
                              style: TextStyle(
                                  fontSize: 14.w,
                                  color: Colors.white,
                                  height: 1.2),
                            ),
                            Image(
                              image: 'ic_jt_right'.png3x,
                              width: 18.w,
                              height: 18.w,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ).withOnTap(onTap: () {
                        Get.to(() => BillAnalyzePage());
                      })
                    : const SizedBox.shrink(),
              ],
            ),
            (widget.model.incomeTotal == 0 && widget.model.expensesTotal == 0)
                ? const BaseText(text: '本月无交易数据')
                : Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BaseText(text: '收 ', fontSize: 15.sp,),
                          buildAmountText(
                            amount: '¥${widget.model.incomeTotal.bankBalance}',
                            color: BColors.mainColor,
                            fontSize: 19.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BaseText(text: '支 ', fontSize: 15.sp,),
                          buildAmountText(
                            amount: '¥${widget.model.expensesTotal.bankBalance}',
                            color: const Color(0xff35827D),
                            fontSize: 19.sp,
                          ),
                        ],
                      ),
                    ],
                  )
          ],
        ).withContainer(
          padding: EdgeInsets.only(left: 12.w, right: 12.w),
          width: 1.sw,
        )),
      ],
    );
  }
}
