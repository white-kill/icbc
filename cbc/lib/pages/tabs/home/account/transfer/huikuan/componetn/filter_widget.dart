import 'package:cbc/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../huikuan_logic.dart';
import '../huikuan_state.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List title1 = [
    '境内汇款',
    '跨境汇款',
  ];

  List title2 = [
    '汇款',
    '收款',
  ];

  List title3 = ['小于5千', '5千-1万', '1万-5万', '大于5万'];

  List title4 = [
    "人民币",
    "美元",
    "港币",
    "欧元",
    "英镑",
    "瑞士法郎",
    "新加坡元",
    "日元",
    "澳大利亚元",
    "加拉大元"
  ];

  bool selectName(String name, {required List selList}) {
    return selList.contains(name);
  }

  Color selectColor(String name, {bool bg = false, required List selList}) {
    if (bg) {
      if (selectName(name, selList: selList)) {
        return const Color(0xffF35855).withOpacity(0.1);
      }
      return const Color(0xffF2F2F2);
    } else {
      if (selectName(name, selList: selList)) return const Color(0xffF35855);
      return const Color(0xff666666);
    }
  }

  final HuikuanLogic logic = Get.put(HuikuanLogic());
  final HuikuanState state = Get.find<HuikuanLogic>().state;


  @override
  void initState() {
    super.initState();
    state.temTransactionChannelList.clear();
    state.temTypeList.clear();
    state.temPriceList.clear();
    state.temCurrencyList.clear();
    state.temTransactionChannelList.addAll(state.transactionChannelList);
    state.temTypeList.addAll(state.typeList);
    state.temPriceList.addAll(state.priceList);
    state.temCurrencyList.addAll(state.currencyList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh * 0.62,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                BaseText(
                  text: '汇款类型',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ).withPadding(
                  top: 20.w,
                  left: 12.w,
                  right: 12.w,
                  bottom: 12.w,
                ),
                VerticalGridView(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  widgetBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: selectColor(title1[index],
                              selList: state.temTransactionChannelList,
                              bg: true),
                          borderRadius: BorderRadius.all(Radius.circular(4.w)),
                          border: Border.all(
                            width: 0.5.w,
                            color: selectColor(title1[index],
                                selList: state.temTransactionChannelList),
                          ),),
                      alignment: Alignment.center,
                      child: BaseText(
                        text: title1[index],
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: selectColor(title1[index],
                              selList: state.temTransactionChannelList),
                          fontSize: 12.sp,
                        ),
                      ),
                    ).withOnTap(onTap: () {
                      state.temTransactionChannelList.clear();
                      state.temTransactionChannelList.add(title1[index]);
                      setState(() {});
                    });
                  },
                  itemCount: title1.length,
                  crossCount: 4,
                  mainHeight: 28.w,
                  spacing: 10.w,
                  crossSpacing: 15.w,
                ),
                BaseText(
                  text: '交易种类',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ).withPadding(
                  top: 25.w,
                  left: 12.w,
                  right: 12.w,
                  bottom: 12.w,
                ),
                VerticalGridView(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  widgetBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: selectColor(title2[index],
                              selList: state.temTypeList, bg: true),
                          borderRadius: BorderRadius.all(Radius.circular(4.w)),
                          border: Border.all(
                            width: 0.5.w,
                            color: selectColor(title2[index],
                                selList: state.temTypeList),
                          )
                      ),
                      alignment: Alignment.center,
                      child: BaseText(
                        text: title2[index],
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: selectColor(title2[index],
                              selList: state.temTypeList),
                          fontSize: 12.sp,
                        ),
                      ),
                    ).withOnTap(onTap: () {
                      state.temTypeList.clear();
                      state.temTypeList.add(title2[index]);
                      setState(() {});
                    });
                  },
                  itemCount: title2.length,
                  crossCount: 4,
                  mainHeight: 28.w,
                  spacing: 10.w,
                  crossSpacing: 15.w,
                ),
                BaseText(
                  text: '交易金额',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ).withPadding(
                  top: 25.w,
                  left: 12.w,
                  right: 12.w,
                  bottom: 12.w,
                ),
                VerticalGridView(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  widgetBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: selectColor(title3[index],
                              bg: true, selList: state.temPriceList),
                          borderRadius: BorderRadius.all(Radius.circular(4.w)),
                          border: Border.all(
                            width: 0.5.w,
                            color: selectColor(title3[index],
                                selList: state.temPriceList),
                          )
                      ),
                      alignment: Alignment.center,
                      child: BaseText(
                        text: title3[index],
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: selectColor(title3[index],
                              selList: state.temPriceList),
                          fontSize: 12.sp,
                        ),
                      ),
                    ).withOnTap(onTap: () {
                      state.temPriceList.clear();
                      state.temPriceList.add(title3[index]);
                      if (index == 0) {
                        state.controller1.text = '0';
                        state.controller2.text = '5000';
                      }
                      if (index == 1) {
                        state.controller1.text = '5000';
                        state.controller2.text = '10000';
                      }
                      if (index == 2) {
                        state.controller1.text = '10000';
                        state.controller2.text = '50000';
                      }
                      if (index == 3) {
                        state.controller1.text = '50000';
                        state.controller2.text = '';
                      }
                      setState(() {});
                    });
                  },
                  itemCount: title3.length,
                  crossCount: 4,
                  mainHeight: 28.w,
                  spacing: 10.w,
                  crossSpacing: 15.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150.w,
                      height: 36.w,
                      padding: EdgeInsets.only(left: 6.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.w)),
                        border: Border.all(
                          color: const Color(0xffCBCBCB),
                          width: 1.w,
                        ),
                      ),
                      child: TextFieldWidget(
                        hintText: '最低金额',
                        controller: state.controller1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: BColors.blue1Color
                        ),
                        onChanged: (v) {
                          if (state.temPriceList.isEmpty) return;
                          state.temPriceList.clear();
                          setState(() {});
                        },
                        hintStyle: TextStyle(
                          fontSize:  13.sp,
                          color: const Color(0xffCBCBCB),
                        ),
                      ),
                    ),
                    Container(
                      width: 8.w,
                      height: 1.w,
                      color: Colors.black,
                      margin: EdgeInsets.only(left: 21.w, right: 21.w),
                    ),
                    Container(
                      width: 150.w,
                      height: 36.w,
                      padding: EdgeInsets.only(left: 6.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.w)),
                        border: Border.all(
                          color: const Color(0xffCBCBCB),
                          width: 1.w,
                        ),
                      ),
                      child: TextFieldWidget(
                        hintText: '最高金额',
                        controller: state.controller2,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: BColors.blue1Color
                        ),
                        onChanged: (v) {
                          if (state.temPriceList.isEmpty) return;
                          state.temPriceList.clear();
                          setState(() {});
                        },
                        hintStyle: TextStyle(
                          fontSize: 13.sp,
                          color: const Color(0xffCBCBCB),
                        ),
                      ),
                    )
                  ],
                ).withPadding(top: 15.w),
                BaseText(
                  text: '交易币种',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ).withPadding(
                  top: 25.w,
                  left: 12.w,
                  right: 12.w,
                  bottom: 12.w,
                ),
                VerticalGridView(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  widgetBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: selectColor(title4[index],
                              bg: true, selList: state.temCurrencyList),
                          borderRadius: BorderRadius.all(Radius.circular(4.w)),
                          border: Border.all(
                            width: 0.5.w,
                            color: selectColor(title4[index],
                                selList: state.temCurrencyList),
                          )
                      ),
                      alignment: Alignment.center,
                      child: BaseText(
                        text: title4[index],
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: selectColor(title4[index],
                              selList: state.temCurrencyList),
                          fontSize: 12.sp,
                        ),
                      ),
                    ).withOnTap(onTap: () {
                      state.temCurrencyList.clear();
                      state.temCurrencyList.add(title4[index]);
                      setState(() {});
                    });
                  },
                  itemCount: title4.length,
                  crossCount: 4,
                  mainHeight: 28.w,
                  spacing: 10.w,
                  crossSpacing: 15.w,
                ),
              ],
            ),
          ),

          Container(
            height: 62.w,
            width: 1.sw,
            margin: EdgeInsets.only(
              top: 10.w,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  child: Container(
                    height: 40.w,
                    alignment: Alignment.center,
                    child: BaseText(
                      text: '重置',
                      color: Color(0xffF35855),
                      fontSize: 16.sp,
                    ),
                  ).withOnTap(
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xffF35855),
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: BaseText(
                      text: '确定',
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ).withOnTap(
                    onTap: () {
                      Get.back();
                      logic.sureFilterButton();
                    },
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
