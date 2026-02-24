import 'package:cbc/config/app_config.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class AlterTip extends StatefulWidget {
  const AlterTip({super.key});

  @override
  State<AlterTip> createState() => _AlterTipState();
}

class _AlterTipState extends State<AlterTip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw * 0.8,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.w))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12.w,
          ),
          BaseText(
            text: '收支说明',
            style: TextStyle(
              fontSize: 14.sp,
              color: Color(0xFF2C2C2C),
            ),
          ),
          SizedBox(
            height: 6.w,
          ),
          BaseText(
            text:
                '如最新交易明细未纳入收支统计， 请您次日重试；当发生外币交易时， 将折算为人民币后计算余额；如您 设置了账户筛选条件，查询结果将 不再展示收支统计。当收入大于支 出时，显示为本月结余，结余金额 为收入减去支出；当收入小于支出 时，显示为本月超支，超支金额为 支出减去收入。',
            maxLines: 20,
            style: TextStyle(
                height: 1.2, fontSize: 12.w, color: Color(0xFF474747)),
          ).withPadding(
            left: 12.w,
            right: 12.w,
          ),
          SizedBox(
            height: 12.w,
          ),
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
          ).withOnTap(onTap: () {
            ClipboardData(text: AppConfig.config.abcLogic.card1());
            SmartDialog.dismiss();
          })
        ],
      ),
    );
  }
}

class AlterTip2 extends StatefulWidget {
  const AlterTip2({super.key});

  @override
  State<AlterTip2> createState() => _AlterTip2State();
}

class _AlterTip2State extends State<AlterTip2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 1.sw * 0.8,
          height: 1.sh * 0.8,
          constraints: BoxConstraints(maxHeight: 1.sh * 0.8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.w))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.w, bottom: 6.w),
                child: BaseText(
                  text: '温馨提示',
                  style: TextStyle(
                    color: Color(0xFF2C2C2C),
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: BaseText(
                    text:
                        '1.本页面不展示账户余额为0的产品信息。\n2.资产负债数据更新可能存在延时等情况，数据仅供参考，不作为对账凭证。\n3.基金资产包含购买在途资金和赎回在途基金，实际到账金额=赎回总额-手续费，数据仅供参考，以公司确认净值为准。\n4.您持有的理财产品资产计算规则：理财产品资产=产品份额*产品最新净值，购买期月在途资产=购买金额，赎回期在途资产在未确认前，仅使用该产品最新净值展示产品时的市值，数据仅供参考，最终请以理财公司确认净值为准。\n5.您持有的信托产品资产计算规则：信托产品资产=产品份额*产品最新净值，购买期在途资产=购买金额，赎回期在途资产在未确认前，仅使用该产品最新净值展示产品市值，上述数据仅供参考，最终请以信托公司确认数据为准。\n6.您持有的实物贵金属、实物贵金属递延、积存贵金属、账户贵金属、账户贵金属指数、账户外汇、账户外汇指数、外汇双向、账户能源、账户农产品、账户基本金属等产品，您的持仓数据可能随市场行情变化产生浮动盈亏。\n7.您持有的活期、定期、理财、基金等外币资产将按照当前的外汇银行买入价折算成月人民币计算资产负债数据，数据仅供参考。\n8.如果您是柜面注册电子银行客户，资产、时ì负债数据为您在工行的全部账户的数据合计；如果您是自助注册电子银行客户，资产、我情负债数据仅包含您注册电子银行账户的数据合计。\n9.若您持有"B股银证转账"、"银期转账"产品，本页面无法向您展现该类别产品的相关信息。\n10."其他"栏目资产未纳入总资产数据及饼图资产数据分析，您可以点击对应菜单进行查询。\n11.您持有的养老金资产包括企业年金、团养产品、养老衍生产品、以及个人养老金我（包含您使用个人养老金购买的基金、理财、保险、存款等产品）。\n12.您的信用卡欠款将按照当前的外汇银行卖出价折算成人民币计算资产负债数据，数据仅供参考。信用卡欠款不包含分期未入账本金及其利息。',
                    maxLines: 100,
                    style: TextStyle(
                        height: 1.8, fontSize: 12.w, color: Color(0xFF474747)),
                  ).withPadding(
                    left: 12.w,
                    right: 12.w,
                  ),
                ),
              ),
              Container(
                width: 1.sw,
                height: 1.w,
                color: const Color(0xffE7E9EB),
              ),
              Container(
                height: 45.w,
                alignment: Alignment.center,
                child: BaseText(
                  text: '知道了',
                  fontSize: 16.sp,
                  color: BColors.mainColor,
                ),
              ).withOnTap(onTap: () {
                Get.back();
              })
            ],
          ),
        )
      ],
    );
  }
}

class AlterTip3 extends StatefulWidget {
  const AlterTip3({super.key});

  @override
  State<AlterTip3> createState() => _AlterTip3State();
}

class _AlterTip3State extends State<AlterTip3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
    Container(
    width: 1.sw * 0.8,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.w))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 12.w,
          ),
          BaseText(
            text: '收支说明',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black
            ),
          ),
          SizedBox(
            height: 6.w,
          ),
          BaseText(
            text: '收支统计不包含外币交易',
            maxLines: 20,
            style: TextStyle(
                height: 1.2, fontSize: 12.w,              color: Colors.black
            ),
          ).withPadding(
            left: 12.w,
            right: 12.w,
          ),
          SizedBox(
            height: 12.w,
          ),
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
          ).withOnTap(onTap: () {
            Get.back();
          })
        ],
      ),
    )
      ],
    );
  }
}
