import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../config/app_config.dart';
import '../../../../utils/color_util.dart';
import 'alter_tip.dart';

class MineAccount1Widget extends StatefulWidget {
  const MineAccount1Widget({super.key});

  @override
  State<MineAccount1Widget> createState() => _MineAccount1WidgetState();
}

class _MineAccount1WidgetState extends State<MineAccount1Widget> {
  bool isOpen = false;

  String getChineseUnitSimple(double number) {
    if (number < 1000) {
      return '';
    }

    final absNumber = number.abs();
    final digits = absNumber.toStringAsFixed(0).length;

    if (digits <= 4) {
      return '千';
    } else if (digits <= 5) {
      return '万';
    } else if (digits <= 6) {
      return '十万';
    } else if (digits <= 7) {
      return '百万';
    } else if (digits <= 8) {
      return '千万';
    } else if (digits <= 9) {
      return '亿';
    } else if (digits <= 10) {
      return '十亿';
    } else if (digits <= 11) {
      return '百亿';
    } else if (digits <= 12) {
      return '千亿';
    } else {
      return '万亿';
    }
  }

  @override
  Widget build(BuildContext context) {
    double expenses = AppConfig.config.abcLogic.memberInfo.expensesTotal;
    double income = AppConfig.config.abcLogic.memberInfo.incomeTotal;
    double t = expenses.abs() + income;
    double p = expenses.abs() - income;
    return Container(
      margin: EdgeInsets.only(top: 6.w),
      child: Stack(
        children: [
          Image(
            image: 'mine_m_0'.png3x,
            width: 1.sw,
            height: isOpen ? 200.w : 130.w,
            fit: BoxFit.fill,
          ),
          Positioned(
              top: 19.w,
              left: 24.w,
              right: 24.w,
              child: Row(
                children: [
                  BaseText(
                    text: '我的本月收支',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Image(
                    image: 'ic_tag_w'.png3x,
                    width: 15.w,
                    height: 15.w,
                  ).withOnTap(onTap: () {
                    AlterWidget.alterWidget(builder: (context) {
                      return const AlterTip();
                    });
                  }),
                  SizedBox(
                    width: 8.w,
                  ),
                  Image(
                    image: isOpen ? 'ic_eye_open'.png3x : 'ic_eye_close'.png3x,
                    width: 18.w,
                    height: 18.w,
                  ).withOnTap(onTap: () {
                    isOpen = !isOpen;
                    setState(() {});
                  }),
                ],
              ).withContainer(
                width: 1.sw,
              )),
          Positioned(
              top: isOpen?45.w:35.w,
              left: 20.w,
              right: 20.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 12.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            text: '本月收入(元)',
                            color: Color(0xff646465),
                            fontSize: 12.sp,
                          ),
                          SizedBox(
                            height: 6.w,
                          ),
                          BaseText(
                            text: ' ${isOpen
                                ? AppConfig.config.abcLogic.memberInfo
                                    .incomeTotal.bankBalance
                                : '****'}',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          !isOpen?const SizedBox.shrink(): getChineseUnitSimple(AppConfig.config.abcLogic.memberInfo.incomeTotal) == ''
                              ? const SizedBox.shrink()
                              : Container(
                            margin: EdgeInsets.only(top: 2.w),
                            padding: EdgeInsets.only(
                                left: 4.w,
                                right: 4.w,
                                top: 3.w,
                                bottom: 2.w),
                            constraints: BoxConstraints(
                              minWidth: 25.w,
                              minHeight: 22.w,
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: 'tag02'.png,
                                  fit: BoxFit.fill
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(2.w))),
                                  child: BaseText(
                                    text: getChineseUnitSimple(AppConfig.config.abcLogic.memberInfo.incomeTotal),
                                    color: BColors.mainColor,
                                    fontSize: 12.sp,
                                    textAlign: TextAlign.center,
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 12.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          BaseText(
                            text: '本月支出(元)',
                            color: Color(0xff646465),
                            fontSize: 12.sp,
                          ),
                          SizedBox(
                            height: 6.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BaseText(
                                text:" "+ (isOpen
                                    ? AppConfig.config.abcLogic.memberInfo
                                        .expensesTotal.bankBalance
                                    : '****'),
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                             !isOpen?const SizedBox.shrink():getChineseUnitSimple((AppConfig.config.abcLogic .memberInfo.expensesTotal) .abs()) ==''
                                  ? const SizedBox.shrink()
                                  : Container(
                               margin: EdgeInsets.only(top: 2.w),
                               padding: EdgeInsets.only(
                                   left: 4.w,
                                   right: 4.w,
                                   top: 3.w,
                                   bottom: 2.w),
                               constraints: BoxConstraints(
                                 minWidth: 25.w,
                                 minHeight: 22.w,
                               ),
                               decoration: BoxDecoration(
                                   image: DecorationImage(
                                       image: 'tag01'.png,
                                       fit: BoxFit.fill
                                   ),
                                   borderRadius: BorderRadius.all(
                                       Radius.circular(2.w))),
                                      child: BaseText(
                                        text: getChineseUnitSimple((AppConfig
                                                    .config
                                                    .abcLogic
                                                    .memberInfo
                                                    .expensesTotal)
                                            .abs()),
                                        color: BColors.main1Color,
                                        fontSize: 12.sp,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ).withContainer(
                height: 80.w,
                width: 1.sw,
              )),
          isOpen
              ? Positioned(
                  left: 35.w,
                  top: 130.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.w),
                    child: Row(
                      children: [
                        Container(
                          height: 3.w,
                          width: (1.sw - 65.w) * (t == 0 ? 0.5 : (income / t)),
                          decoration: BoxDecoration(
                              color: Color(0xffdd5959),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6.w),
                                bottomLeft: Radius.circular(6.w),
                              )),
                        ),
                        Container(
                          height: 3.w,
                          width: (1.sw - 65.w) *
                              (t == 0 ? 0.5 : (expenses.abs() / t)),
                          decoration: BoxDecoration(
                              color: Color(0xff22aa7b),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(6.w),
                                bottomRight: Radius.circular(6.w),
                              )),
                        )
                      ],
                    ).withContainer(
                      width: 1.sw - 62.w,
                    ),
                  ))
              : SizedBox.shrink(),
          isOpen
              ? Positioned(
                  top: 140.w,
                  right: 38.w,
                  child: Row(
                    children: [
                      BaseText(
                        text: p > 0 ? '本月超支 ' : '本月结余  ',
                        fontSize: 12.sp,
                        color: Color(0xff666666),
                      ),
                      BaseText(
                        text: (p.abs()).bankBalance,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: p > 0?BColors.main1Color:BColors.mainColor
                        ),
                      )
                    ],
                  ))
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
