import 'package:cbc/pages/tabs/home/bill/bill_logic.dart';
import 'package:cbc/pages/tabs/home/bill/component/bill_filter_alter.dart';
import 'package:cbc/utils/abc_button.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/app_config.dart';
import '../../../../other/sheet_widget/sheet_bottom.dart';
import '../bill_state.dart';
import 'bill_filter_time_alter.dart';

class BillPageTopWidget extends StatefulWidget {
  const BillPageTopWidget({super.key});

  @override
  State<BillPageTopWidget> createState() => _BillPageTopWidgetState();
}

class _BillPageTopWidgetState extends State<BillPageTopWidget> {
  final BillLogic logic = Get.put(BillLogic());
  final BillState state = Get.find<BillLogic>().state;

  int topTjIndex = 0;

  int filterCount() {
    int p = 0;
    if(state.controller2.text != ''){
      p = 1;
    }
    if(state.controller1.text != ''){
      p = 1;
    }
    return state.selTypeList.length +
        state.selTransactionCurrencyList.length +
        state.selTransactionTypeList.length + p;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.w,
      width: 1.sw,
      color: Colors.white,
      padding: EdgeInsets.only(left: 18.w, right: 18.w),
      child: GetBuilder(
        builder: (BillLogic c) {
          return Row(
            children: [
              _tagWidget(AppConfig.config.abcLogic.realName()).withOnTap(
                  onTap: () {
                SheetBottom.show(
                    title: '用户选择',
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image(
                                image: 'ic_gs_s'.png3x,
                                width: 20.w,
                                height: 20.w,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              BaseText(
                                  text: AppConfig.config.abcLogic.realName())
                            ],
                          ).withContainer(
                              height: 60.w,
                              padding: EdgeInsets.only(
                                left: 15.w,
                              )),
                          AbcButton(
                            title: '确定',
                            bgColor: Color(0xffF35855),
                            onTap: () {
                              Get.back();
                            },
                            margin: EdgeInsets.only(left: 12.w, right: 12.w),
                          ),
                        ],
                      ),
                    ),
                    sureCallBack: () {});
              }),
              SizedBox(
                width: 20.w,
              ),
              _tagWidget(c.state.accountTitle,
                      color: c.state.accountTitle == '全部账户'
                          ? const Color(0xff333333)
                          :BColors.mainColor,)
                  .withOnTap(onTap: () {
                SheetBottom.show(
                  title: '选择账户',
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => Icon(
                                c.isAllAccount.value
                                    ? Icons.check_box_outlined
                                    : Icons.check_box_outline_blank,
                                color: Color(0xffF35855),
                                size: 24.w,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Image(
                              image: 'ic_gs_qb'.png3x,
                              width: 35.w,
                              height: 28.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            const BaseText(text: '全部账户')
                          ],
                        )
                            .withContainer(
                                height: 65.w,
                                padding: EdgeInsets.only(
                                  left: 15.w,
                                ))
                            .withOnTap(onTap: () {
                          c.state.accountTitle = '全部账户';
                          c.isAllAccount.value = true;
                        }),
                        Container(
                          color: const Color(0xffE5E5E5),
                          width: 1.sw,
                          height: 0.5.w,
                        ),
                        Row(
                          children: [
                            Obx(
                              () => Icon(
                                c.isAllAccount.value
                                    ? Icons.check_box_outline_blank
                                    : Icons.check_box_outlined,
                                color: const Color(0xffF35855),
                                size: 24.w,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Image(
                              image: 'ic_gs_card'.png3x,
                              width: 45.w,
                              height: 35.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BaseText(
                                  text: '借记卡(I类)',
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                                SizedBox(
                                  height: 6.w,
                                ),
                                BaseText(text: AppConfig.config.abcLogic.card())
                              ],
                            )
                          ],
                        ).withContainer(
                                height: 65.w,
                                padding: EdgeInsets.only(
                                  left: 15.w,
                                ))
                            .withOnTap(onTap: () {
                          c.state.accountTitle =
                              '尾号${AppConfig.config.abcLogic.cardFour()}';
                          c.isAllAccount.value = false;
                        }),
                        SizedBox(
                          height: 10.w,
                        ),
                        AbcButton(
                          title: '确定',
                          bgColor: Color(0xffF35855),
                          onTap: () {
                            Get.back();
                            c.update(['upDateTopWidget']);
                          },
                          margin: EdgeInsets.only(left: 12.w, right: 12.w),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              SizedBox(
                width: 20.w,
              ),
              _tagWidget('筛选',
                  color: filterCount() == 0
                      ?const Color(0xff333333)
                      :BColors.mainColor,
                  child:filterCount() == 0
                      ?null
                  : Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 1.2.w),
                margin: EdgeInsets.only(left: 2.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.w)),
                  border: Border.all( color:BColors.mainColor,width: 1.w)
                ),
                width: 15.w,height: 15.w,
                child: BaseText(text: '${filterCount() == 0?'':filterCount()}',style: TextStyle(
                  fontSize: 12.sp,
                  color: BColors.mainColor,
                  height: 1,
                ),textAlign: TextAlign.center,),
              )).withOnTap(onTap: () {
                SheetBottom.show(
                  title: '筛选',
                  leftWidget: Icon(
                    Icons.clear,
                    size: 24.w,
                    color: const Color(0xff666666),
                  ),
                  child: const BillFilterAlter(),
                );
              }),
              SizedBox(
                width: 20.w,
              ),
              _tagWidget(timeStr(),
                color: state.billReq.beginTime == ''
                  ?const Color(0xff333333)
                  :BColors.mainColor,).withOnTap(onTap: () {
                SheetBottom.show(
                  title: '筛选',
                  topWidget: const SizedBox.shrink(),
                  child: const BillFilterTimeAlter(),
                );
              }),
            ],
          );
        },
        id: 'upDateTopWidget',
      ),
    );
  }

  String timeStr(){
    if(state.billReq.beginTime == '') return '选择时间';
    if(state.isMonth) {
      return state.mTime;
    }else {
      return '${state.beginTime}\n${state.endTime}';
    }
  }

  Widget _tagWidget(String content, {Color? color,Widget? child}) {
    return Row(
      children: [
        Row(
          children: [
            BaseText(
              text: content,
              style: TextStyle(
                  color: color ?? Color(0xff333333),
                  fontWeight: FontWeight.w600
              ),
            ),
            child??SizedBox.shrink(),
          ],
        ),
        SizedBox(
          width: 4.w,
        ),
        Image(
          image: 'arr_dow'.png3x,
          width: 6.w,
          height: 6.w,
          color: Colors.black,
        ),
      ],
    );
  }
}
