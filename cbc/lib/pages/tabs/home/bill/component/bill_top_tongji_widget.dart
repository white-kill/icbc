import 'package:cbc/utils/widget_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../bill_logic.dart';
import '../bill_state.dart';
import 'bill_tip.dart';

class BillTopTongjiWidget extends StatefulWidget {
  const BillTopTongjiWidget({super.key});

  @override
  State<BillTopTongjiWidget> createState() => _BillTopTongjiWidgetState();
}

class _BillTopTongjiWidgetState extends State<BillTopTongjiWidget> {
  final BillLogic logic = Get.put(BillLogic());
  final BillState state = Get.find<BillLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (BillLogic c) {
        return logic.listViewType()
            ? GetBuilder(builder: (BillLogic c){
              return Container(
                width: 1.sw,
                height: 35.w,
                decoration: BoxDecoration(
                  color: const Color(0xfffdfaef),
                  borderRadius: BorderRadius.all(Radius.circular(4.w))
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: (state.list.length> 20 &&logic.state.billReq.pageNum == 1 )?BaseText(text: '上滑页面可查看更多收支筛选结果',style: TextStyle(
                  fontSize: 13.sp,
                  height: 1
                ),): Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BaseText(
                      text: '当页汇总笔数: ${logic.mCount}',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 12.sp),
                    ),
                    Row(
                      children: [
                        Image(
                            image: 'ic_tag_w'.png3x,
                            width: 15.w,
                            height: 15.w,
                            color: Color(0xffE02D2D)).withOnTap(onTap: (){
                          AlterWidget.alterWidget(builder: (context) {
                            return const BillTip();
                          });
                        }),
                        SizedBox(
                          width: 4.w,
                        ),
                        Row(
                          children: [
                            BaseText(
                              text: '收',
                              fontSize: 12.sp,
                            ),
                            buildAmountText(
                              amount: '￥${state.list.isEmpty?'0.00':logic.state.incomeTotal.bankBalance}',
                              color: const Color(0xffE02D2D),
                              fontSize: 12.sp,
                              symbolFontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Row(
                          children: [
                            BaseText(
                              text: '支',
                              fontSize: 12.sp,
                            ),
                            buildAmountText(
                              amount: '￥${state.list.isEmpty?'0.00':logic.state.expensesTotal.bankBalance}',
                              color: const Color(0xff1B8561),
                              fontSize: 12.sp,
                                symbolFontWeight: FontWeight.bold

                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ).withContainer(
                color: CupertinoColors.white,
                padding: EdgeInsets.all(10.w)
              );
        },id: 'updateCount',)
            : GetBuilder(
                builder: (BillLogic c) {
                  return c.state.isAtTop || c.state.monthTopString == ''
                      ? const SizedBox.shrink()
                      : Container(
                    width: 1.sw,
                    height: 48.w,
                    color: CupertinoColors.white,
                    padding: EdgeInsets.only(top: 6.w,bottom:6.w,left: 12.w,right: 12.w),
                    child: Container(
                      width: 1.sw,
                      height: 34.w,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFDF4),
                        borderRadius: BorderRadius.all(Radius.circular(4.w))
                      ),
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BaseText(
                            text: c.state.monthTopString,
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          Row(
                            children: [
                              Image(
                                  image: 'ic_tag_w'.png3x,
                                  width: 15.w,
                                  height: 15.w,
                                  color: Color(0xffE02D2D)),
                              SizedBox(
                                width: 4.w,
                              ),
                              Row(
                                children: [
                                  BaseText(
                                    text: '收',
                                    fontSize: 12.sp,
                                  ),
                                  buildAmountText(
                                    amount: '￥${logic.state.incomeTotalMonth.bankBalance}',
                                    color: const Color(0xffE02D2D),
                                    fontSize: 12.sp,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Row(
                                children: [
                                  BaseText(
                                    text: '支',
                                    fontSize: 12.sp,
                                  ),
                                  buildAmountText(
                                    amount: '￥${logic.state.expensesTotalMonth.bankBalance}',
                                    color: const Color(0xff1B8561),
                                    fontSize: 12.sp,
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                id: 'updateNoFilterList',
              );
      },
      id: 'updateTopType',
    );
  }
}
