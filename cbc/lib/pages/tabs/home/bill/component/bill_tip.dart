import 'package:cbc/config/app_config.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';


class BillTip extends StatefulWidget {
  const BillTip({super.key});

  @override
  State<BillTip> createState() => _BillTipState();
}

class _BillTipState extends State<BillTip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw * 0.8,
      height: 220.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.w))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseText(
                      text: '收支说明',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6.w,
                    ),
                    BaseText(text:'如最新交易明细未纳入收支统计请您次日重试;当发生外币交易时，'
                        '将折算为人民币后计算余额如您设置了账户筛选条件，'
                        '查询结果将不再展示收支统计。',maxLines: 20,style: TextStyle(
                        height: 2
                    ),).withPadding(
                      left: 24.w,right: 24.w,
                    ),
                  ],
                ),
              )),
          Container(
            width: 1.sw,
            height: 1.w,
            color: const Color(0xffE7E9EB),
          ),
          Container(
            height: 45.w,
            alignment: Alignment.center,
            child: BaseText(
              text: '确定',
              fontSize: 16.sp,
              color: BColors.mainColor,
            ),
          ).withOnTap(onTap: (){
            ClipboardData(text: AppConfig.config.abcLogic.card1());
            SmartDialog.dismiss();
          })
        ],
      ),
    );
  }
}
