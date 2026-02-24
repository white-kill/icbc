import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../utils/abc_button.dart';
import 'bill_detail_logic.dart';
import 'bill_detail_state.dart';

class BillDetailIncome extends StatefulWidget {
  const BillDetailIncome({super.key});

  @override
  State<BillDetailIncome> createState() => _BillDetailIncomeState();
}

class _BillDetailIncomeState extends State<BillDetailIncome> {
  List titleName1 = [
    '他人转入',
    '工资福利',
    '现金存入',
    '提现',
    '投资收益',
    '贷款发放',
    '公积金',
    '保险',
    '税',
    '报销补贴',
    '退款',
    '教育培训',
    '其他'
  ];

  List titleName2 = [
    '信用卡还款',
    '转账给自己',
    '理财',
    '基金',
    '贵金属',
    '外汇买卖',
    '银证转账',
    '其他投资'
  ];

  final BillDetailLogic logic = Get.put(BillDetailLogic());
  final BillDetailState state = Get.find<BillDetailLogic>().state;

  String selectName = '';
  String selectImg = '';

  @override
  void initState() {
    super.initState();
    selectName = logic.categoryText.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh * 0.65,
      width: 1.sw,
      color: Colors.white,
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              BaseText(
                  text: "收入",
                  fontSize: 16.sp,
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600))
                  .withPadding(
                top: 12.w,
                left: 12.w,
                bottom: 15.w,
              ),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                spacing: 20.w,
                widgetBuilder: (context, index) {
                  return Column(
                    children: [
                      Image(
                        image: selectName != titleName1[index]
                            ? 'inc_$index'.png
                            : 'inc_s_$index'.png,
                        width: 28.w,
                        height: 28.w,
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      BaseText(
                        text: titleName1[index],
                        style: TextStyle(
                          fontSize: 12.sp,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ).withOnTap(onTap: () {
                    logic.temCategoryText = titleName1[index];
                    selectImg = 'inc_$index';
                    selectName = titleName1[index];
                    setState(() {});
                  });
                },
                itemCount: titleName1.length,
                mainHeight: 55,
              ),
              BaseText(
                  text: "本人资金来往",
                  fontSize: 15.sp,
                  style:
                  TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600))
                  .withPadding(
                top: 30.w,
                left: 12.w,
                bottom: 15.w,
              ),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                spacing: 20.w,
                widgetBuilder: (context, index) {
                  return Column(
                    children: [
                      Image(
                        image: titleName2[index] != selectName
                            ? 'inc_1_$index'.png
                            : 'inc_1_s_${index}'.png,
                        width: 28.w,
                        height: 28.w,
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      BaseText(
                        text: titleName2[index],
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ).withOnTap(onTap: () {
                    logic.temCategoryText = titleName2[index];
                    selectImg = 'inc_1_$index';
                    selectName = titleName2[index];
                    setState(() {});
                  });
                },
                itemCount: titleName2.length,
                mainHeight: 55,
              ),
            ],
          ).expanded(),

          AbcButton(
            title: '确定',
            height: 48.w,
            radius: 6.w,
            bgColor: Color(0xffF35855),
            onTap: () {
              logic.categoryText.value = logic.temCategoryText;
              logic.categoryImg.value = selectImg;
              Get.back();
            },
            margin: EdgeInsets.only(left: 12.w, right: 12.w),
          ).withPadding(
            top: 10.w,
            bottom: 12.w
          ),
        ],
      ),
    );
  }
}
