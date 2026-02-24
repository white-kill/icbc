import 'package:cbc/pages/deposit/deposit_view.dart';
import 'package:cbc/pages/tabs/mine/component/alter_tip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../config/app_config.dart';
import '../account_detail_logic.dart';

class AccountDetailTopWidget extends StatefulWidget {
  const AccountDetailTopWidget({super.key});

  @override
  State<AccountDetailTopWidget> createState() => _AccountDetailTopWidgetState();
}

class _AccountDetailTopWidgetState extends State<AccountDetailTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.w,
      width: 1.sw,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: 1.sw,
            height: 0.8.w,
            color: const Color(0xffE9E9E9),
          ),
          Row(
            children: [
              Image(
                image: 'ic_gs_card'.png3x,
                width: 55.w,
                height: 40.w,
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text:
                        '借记卡( I  类) 尾号${AppConfig.config.abcLogic.cardFour()}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 6.w,
                  ),
                  BaseText(
                      text: '人民币余额:${AppConfig.config.abcLogic.balance()}'),
                ],
              ),
            ],
          ).withPadding(left: 12.w, top: 12.w),
          SizedBox(
            height: 15.w,
          ),
          GetBuilder(
            builder: (Account_detailLogic c) {
              return Container(
                width: 355.w,
                height: 65.w,
                color: Color(0xffFFFDF4),
                padding: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(text: '当页汇总笔数: ${c.mCount}'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 4.w),
                              child: Image(
                                image: 'ic_bill_info'.png3x,
                                width: 14.w,
                                height: 14.w,
                              ),
                            ).withOnTap(onTap: () {
                              showDialog(context: context, builder: (context) {
                                return const AlterTip3();
                              });
                            }),
                            const BaseText(text: '收'),
                            BaseText(
                              text: '￥${c.state.incomeTotal.bankBalance}',
                              style: const TextStyle(
                                color: Color(0xffE02D2D),
                                fontFamily: 'Regular',
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.w,
                        ),
                        Row(
                          children: [
                            const BaseText(text: '支'),
                            BaseText(
                              text: '￥${c.state.expensesTotal.bankBalance}',
                              style: const TextStyle(
                                  color: Color(0xff1B8561),
                                  fontFamily: 'Regular',
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            id: 'updateUI',
          )
        ],
      ),
    );
  }
}
