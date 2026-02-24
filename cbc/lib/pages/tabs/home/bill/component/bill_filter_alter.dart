import 'package:cbc/config/abc_config/balance_eye_widget.dart';
import 'package:cbc/config/abc_config/cbc_logic.dart';
import 'package:cbc/pages/tabs/home/bill/bill_logic.dart';
import 'package:cbc/pages/tabs/home/bill/bill_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class BillFilterAlter extends StatefulWidget {
  const BillFilterAlter({super.key});

  @override
  State<BillFilterAlter> createState() => _BillFilterAlterState();
}

class _BillFilterAlterState extends State<BillFilterAlter> {
  List title1 = ['收入', '支出'];

  List title2 = [
    '消费',
    '贷款',
    '工资',
    '信用卡',
    '还款',
    '支付宝',
    '财付通',
    '京东',
    '美团',
    '转账',
    '餐饮',
    '交通',
    '缴费',
    'ETC',
    '教育',
    '医疗',
    '代扣',
    '基金',
    '理财',
    '保险',
    '贵金属',
    '公积金',
    '社保',
    '养老金',
    '税',
    '报销',
    '退款',
    '现金',
    '取现',
    '购汇',
    '结汇',
    '销户',
    '冲正',
    '其他',
    'tag'
  ];
  List title2_1 = [
    '消费',
    '贷款',
    '工资',
    '信用卡',
    '还款',
    '支付宝',
    '财付通',
    'tag'
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


  bool selectName(String name,{required List selList}) {
    return selList.contains(name);
  }

  Color selectColor(String name, {bool bg = false,required List selList}) {
    if (bg) {
      if (selectName(name,selList: selList)) return const Color(0xffF35855).withOpacity(0.88);
      return const Color(0xffF2F2F2);
    } else {
      if (selectName(name,selList: selList)) return Colors.white;
      return Colors.black;
    }
  }

  bool showMore = false;

  bool switchValue = true;


  final BillLogic logic = Get.put(BillLogic());
  final BillState state = Get.find<BillLogic>().state;

  @override
  void initState() {
    super.initState();
    state.selTypeList.clear();
    state.selPriceList.clear();
    state.selTransactionTypeList.clear();
    state.selTransactionCurrencyList.clear();

    state.selPriceList.addAll(state.selPriceList1);
    state.selTypeList.addAll(state.selTypeList1);
    state.selTransactionTypeList.addAll(state.selTransactionTypeList1);
    state.selTransactionCurrencyList.addAll(state.selTransactionCurrencyList1);
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
                text: '收支类型',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: selectColor(title1[index],selList: state.selTypeList,bg: true),
                        borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: title1[index],
                      style: TextStyle(
                        fontWeight:  FontWeight.normal,
                        color: selectColor(title1[index],selList: state.selTypeList),
                        fontSize: 12.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    state.selTransactionTypeList.clear();
                    state.selTypeList.clear();
                    state.selTypeList.add(title1[index]);
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
                text: '交易类型',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  String title = showMore?title2[index]:title2_1[index];
                  bool isTag = (showMore?title2[index]:title2_1[index]) == 'tag';
                  if(title == 'tag'){
                    if(showMore) {
                      title = '收起';
                    }else {
                      title = '展开';
                    };
                  }
                  return Container(
                    decoration: BoxDecoration(
                        color: isTag?Colors.white:selectColor(title, bg: true,selList: state.selTransactionTypeList),
                        border: isTag?Border.all(
                          color: const Color(0xffF35855),
                          width: 0.5.w
                        ):null,
                        borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: title,
                      style: TextStyle(
                        fontWeight: selectName(title,selList: state.selTransactionTypeList)
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color:isTag?const Color(0xffF35855): selectColor(title,selList: state.selTransactionTypeList),
                        fontSize: 12.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    String title = showMore?title2[index]:title2_1[index];
                    if(title == 'tag'){
                      showMore = !showMore;
                      setState(() {});
                    }else {
                      state.selTypeList.clear();
                      String title = showMore?title2[index]:title2_1[index];
                      if(state.selTransactionTypeList.length >=3){
                        if(state.selTransactionTypeList.contains(title)){
                          state.selTransactionTypeList.remove(title);
                        }else{
                          '最多同时选择3个条件'.showToast;
                        }
                        setState(() {});
                        return;
                      }else{
                        if(state.selTransactionTypeList.contains(title)){
                          state.selTransactionTypeList.remove(title);
                        }else{
                          state.selTransactionTypeList.add(title);
                        }
                        setState(() {});
                      }

                    }
                  });
                },
                itemCount: showMore?title2.length:title2_1.length,
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
                top: 20.w,
                left: 12.w,
                right: 12.w,
                bottom: 12.w,),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: selectColor(title3[index], bg: true,selList: state.selPriceList),
                        borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: title3[index],
                      style: TextStyle(
                        fontWeight:FontWeight.normal,
                        color: selectColor(title3[index],selList: state.selPriceList),
                        fontSize: 12.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    state.selPriceList.clear();
                    state.selPriceList.add(title3[index]);
                    if(index == 0){
                      state.controller1.text = '0';
                      state.controller2.text = '5000';
                    }
                    if(index == 1){
                      state.controller1.text = '5000';
                      state.controller2.text = '10000';
                    }
                    if(index == 2){
                      state.controller1.text = '10000';
                      state.controller2.text = '50000';
                    }
                    if(index == 3){
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
                      onChanged: (v){
                        if(state.selPriceList.isEmpty) return;
                        state.selPriceList.clear();
                        setState(() {});
                      },
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
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
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.digitsOnly,
                      //   // 限制最大值
                      //   TextInputFormatter.withFunction((oldValue, newValue) {
                      //     if (newValue.text.isEmpty) return newValue;
                      //     final value = int.tryParse(newValue.text);
                      //     print(value);
                      //     if (value != null && value < int.parse(state.controller1.text)) {  // 这里100是你的最大值
                      //       return oldValue;  // 返回旧值，不更新
                      //     }
                      //     return newValue;
                      //   }),
                      // ],
                      onChanged: (v){
                        if(state.selPriceList.isEmpty) return;
                        state.selPriceList.clear();
                        setState(() {});
                      },
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
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
              ).withPadding(top: 20.w, left: 12.w, right: 12.w, bottom: 12.w),
              VerticalGridView(
                padding: EdgeInsets.only(left: 12.w, right: 12.w),
                widgetBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: selectColor(title4[index], bg: true,selList: state.selTransactionCurrencyList),
                        borderRadius: BorderRadius.all(Radius.circular(4.w))),
                    alignment: Alignment.center,
                    child: BaseText(
                      text: title4[index],
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: selectColor(title4[index],selList: state.selTransactionCurrencyList),
                        fontSize: 12.sp,
                      ),
                    ),
                  ).withOnTap(onTap: () {
                    state.selTransactionCurrencyList.clear();
                    state.selTransactionCurrencyList.add(title4[index]);
                    setState(() {});
                  });
                },
                itemCount: title4.length,
                crossCount: 4,
                mainHeight: 28.w,
                spacing: 10.w,
                crossSpacing: 15.w,
              ),

              Container(
                margin: EdgeInsets.only(top: 12.w,bottom: 12.w),
                color: const Color(0xffE5E5E5),
                width: 1.sw,
                height: 0.5.w,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 12.w,),
                      BaseText(text: '显示未注册账户',style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold
                      )),
                      BaseText(text: '(含已注销账户)',style: TextStyle(
                        fontSize: 10.sp,
                        color: Color(0xff999999)
                      ),),
                    ],
                  ),

                  Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: switchValue,
                      // activeTrackColor: Color.fromARGB(255, 3, 134, 91),
                      onChanged: (bool value) {
                        switchValue = !switchValue;
                        setState(() {});
                      },
                      activeColor:  Color.fromARGB(255, 3, 134, 91), // 自定义开启颜色
                    ),
                  )

                ],
              )

            ],
          )),



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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2.w)),
                      border: Border.all(color: Color(0xffF35855), width: 1.w),
                    ),
                    child: BaseText(
                      text: '重置',
                      color: Color(0xffF35855),
                      fontSize: 16.sp,
                    ),
                  ).withOnTap(onTap: () {
                    state.selTypeList.clear();
                    state.selPriceList.clear();
                    state.selTransactionTypeList.clear();
                    state.selTransactionCurrencyList.clear();
                    state.controller1.text = '';
                    state.controller2.text = '';
                    setState(() {});
                  },
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  child: Container(
                    height: 40.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xffF35855),
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: BaseText(
                      text: '确定',
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ).withOnTap(onTap: () {
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
          )
        ],
      ),
    );
  }
}
