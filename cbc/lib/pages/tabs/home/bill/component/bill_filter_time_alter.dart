import 'package:cbc/config/abc_config/cbc_logic.dart';
import 'package:cbc/utils/time_tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../utils/abc_button.dart';
import '../../../../other/sheet_widget/picker_widget.dart';
import '../bill_logic.dart';
import '../bill_state.dart';

class BillFilterTimeAlter extends StatefulWidget {
  const BillFilterTimeAlter({super.key});

  @override
  State<BillFilterTimeAlter> createState() => _BillFilterTimeAlterState();
}

class _BillFilterTimeAlterState extends State<BillFilterTimeAlter> {


  final BillLogic logic = Get.put(BillLogic());
  final BillState state = Get.find<BillLogic>().state;


  List title = [
    '近1月',
    '近3月',
    '近6月',
    '近12月'
  ];

  String timeType = '';


  bool isSelectTag = false;
  @override
  void initState() {
    super.initState();

    state.temMTime = state.mTime == ''?DateFormat("yyyy-MM").format(DateTime.now()):state.mTime;

    state.temEndTime = state.endTime;
    state.temBeginTime = state.beginTime;

    WidgetsBinding.instance.addPostFrameCallback((_){
      if(state.isMonth){

        List<String> parts = state.temMTime.split('-');
        DateTime dateTime = DateTime(
          int.parse(parts[0]), // 年
          int.parse(parts[1]), // 月
          1,
        );
        state.mPickerNotifier.jumpTime(dateTime);
      }else{
        if(state.selTimeTag.contains('近1月')){
          state.temBeginTime = DateRangeCalculator.getRecentMonthRange(1)['start']??'';
          state.temEndTime = DateRangeCalculator.getRecentMonthRange(1)['end']??'';
        }
        if(state.selTimeTag.contains('近3月')){
          state.temBeginTime = DateRangeCalculator.getRecentMonthRange(3)['start']??'';
          state.temEndTime = DateRangeCalculator.getRecentMonthRange(3)['end']??'';
        }
        if(state.selTimeTag.contains('近6月')){
          state.temBeginTime = DateRangeCalculator.getRecentMonthRange(6)['start']??'';
          state.temEndTime = DateRangeCalculator.getRecentMonthRange(6)['end']??'';
        }
        if(state.selTimeTag.contains('近12月')){
          state.temBeginTime = DateRangeCalculator.getRecentMonthRange(12)['start']??'';
          state.temEndTime = DateRangeCalculator.getRecentMonthRange(12)['end']??'';
        }
      }
    });
  }
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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      child: Column(
        children: [
          Container(
            width: 1.sw,
            height: 55.w,
            padding: EdgeInsets.only(left: 12.w,right: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.clear,size: 24.w,).withOnTap(onTap: (){
                  Get.back();
                }),

                Row(
                  children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseText(text: "按月",style: TextStyle(
                          color: state.isMonth?Colors.black:Color(0xff666666)
                      )),
                      SizedBox(height:4.w,),
                      Container(
                        width: 15.w,
                        height: 2.w,
                        color: state.isMonth?Color(0xffF35855):Colors.white,
                      )
                    ],
                  ).withOnTap(onTap: (){
                    state.selTimeTag.clear();
                    state.temBeginTime = '';
                    state.temEndTime = '';
                    state.beginTime = '';
                    state.endTime = '';
                    state.isMonth = true;
                    setState(() {});
                  }),

                  SizedBox(width: 25.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseText(text: "时间段",style: TextStyle(
                        color: !state.isMonth?Colors.black:Color(0xff666666)
                      ),),
                      SizedBox(height: 4.w,),
                      Container(
                        width: 15.w,
                        height: 2.w,
                        color: !state.isMonth?Color(0xffF35855):Colors.white,
                      )
                    ],
                  ).withOnTap(onTap: (){
                    state.isMonth = false;
                    setState(() {});
                  }),
                ],),

                SizedBox(width: 24.w,)
              ],
            ),
          ),

          state.isMonth? const SizedBox.shrink():Container(
            margin: EdgeInsets.only(top: 12.w),
            child:Column(
              children: [
                VerticalGridView(
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  widgetBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: selectColor(title[index],selList: state.selTimeTag,bg: true),
                          borderRadius: BorderRadius.all(Radius.circular(4.w))),
                      alignment: Alignment.center,
                      child: BaseText(
                        text: title[index],
                        style: TextStyle(
                          color: selectColor(title[index],selList: state.selTimeTag),
                          fontSize: 12.sp,
                        ),
                      ),
                    ).withOnTap(onTap: () {
                      state.selTimeTag.clear();
                      state.selTimeTag.add(title[index]);
                      if(index == 0){
                        state.temBeginTime = DateRangeCalculator.getRecentMonthRange(1)['start']??'';
                        state.temEndTime = DateRangeCalculator.getRecentMonthRange(1)['end']??'';
                      }
                      if(index == 1){
                        state.temBeginTime = DateRangeCalculator.getRecentMonthRange(3)['start']??'';
                        state.temEndTime = DateRangeCalculator.getRecentMonthRange(3)['end']??'';
                      }
                      if(index == 2){
                        state.temBeginTime = DateRangeCalculator.getRecentMonthRange(6)['start']??'';
                        state.temEndTime = DateRangeCalculator.getRecentMonthRange(6)['end']??'';
                      }
                      if(index == 3){
                        state.temBeginTime = DateRangeCalculator.getRecentMonthRange(12)['start']??'';
                        state.temEndTime = DateRangeCalculator.getRecentMonthRange(12)['end']??'';
                      }
                      setState(() {});
                      isSelectTag = true;
                      if(timeType == '1'){
                        Future.delayed(const Duration(milliseconds: 100),(){
                          if(state.temBeginTime != ''){
                            DateTime date = DateFormat("yyyy-MM-dd").parse(state.temBeginTime);
                            state.pickerNotifier.jumpTime(date);
                          }
                        }).then((_){
                          Future.delayed(const Duration(milliseconds: 200),(){
                            isSelectTag = false;
                          });
                        });
                      }
                      if(timeType == '2'){
                        Future.delayed(const Duration(milliseconds: 100),(){
                          if(state.temEndTime != ''){
                            DateTime date = DateFormat("yyyy-MM-dd").parse(state.temEndTime);
                            state.pickerNotifier.jumpTime(date);
                          }
                        }).then((_){
                          Future.delayed(const Duration(milliseconds: 200),(){
                            isSelectTag = false;
                          });
                        });
                      }
                    });
                  },
                  itemCount: title.length,
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
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.w)),
                        border: Border.all(
                          color:timeType == '1'?const Color(0xffF35855): const Color(0xffCBCBCB),
                          width: 0.5.w,
                        ),
                      ),
                      child: BaseText(text: state.temBeginTime == ''?'开始时间':state.temBeginTime,fontSize: 12.sp,color: Color(0xff9999999),),
                    ).withOnTap(onTap: (){
                      timeType = '1';
                      setState(() {});
                      isSelectTag = true;
                      Future.delayed(const Duration(milliseconds: 100),(){
                        if(state.temBeginTime != ''){
                          DateTime date = DateFormat("yyyy-MM-dd").parse(state.temBeginTime);
                          state.pickerNotifier.jumpTime(date);
                        }
                      }).then((_){
                        Future.delayed(const Duration(milliseconds: 200),(){
                          isSelectTag = false;
                        });
                      });
                    }),
                    Container(
                      width: 20.w,
                      height: 1.w,
                      color: const Color(0xff999999),
                      margin: EdgeInsets.only(left: 12.w, right: 12.w),
                    ),
                    Container(
                      width: 150.w,
                      height: 36.w,
                      padding: EdgeInsets.only(left: 6.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.w)),
                        border: Border.all(
                          color: timeType == '2'?const Color(0xffF35855):const Color(0xffCBCBCB),
                          width: 0.5.w,
                        ),
                      ),
                      child: BaseText(text:state.temEndTime == ''?'结束时间':state.temEndTime,fontSize: 12.sp,color: Color(0xff9999999),),
                    ).withOnTap(onTap: (){
                      timeType = '2';
                      setState(() {});
                      isSelectTag = true;
                      Future.delayed(const Duration(milliseconds: 100),(){
                        if(state.temEndTime != ''){
                          DateTime date = DateFormat("yyyy-MM-dd").parse(state.temEndTime);
                          state.pickerNotifier.jumpTime(date);
                        }
                      }).then((_){
                        Future.delayed(const Duration(milliseconds: 200),(){
                          isSelectTag = false;
                        });
                      });
                    })
                  ],
                ).withPadding(top: 15.w),

                timeType != ''? Container(
                  alignment: Alignment.center,
                  height: 180.w,
                  child: DateTimePicker(
                    dateTimePickerNotifier: state.pickerNotifier,
                    lastYear: 4,
                    onDateTimeChanged:(DateTime date){
                      if(isSelectTag) return;
                      if(timeType == '1'){
                        state.temBeginTime = DateFormat("yyyy-MM-dd").format(date);
                      }
                      if(timeType == '2'){
                        state.temEndTime = DateFormat("yyyy-MM-dd").format(date);
                      }
                      state.selTimeTag.clear();
                      setState(() {});
                    },
                  ),
                ):const SizedBox.shrink()
              ],
            ),
          ),

          state.isMonth? Container(
            alignment: Alignment.center,
            height: 160.w,
            child: DateTimePicker(
              dateTimePickerNotifier: state.mPickerNotifier,
              lastYear: 4,
              showDay:false,
              onDateTimeChanged:(DateTime date){
                state.temMTime = DateFormat("yyyy-MM").format(date);
              },
            ),
          ):Container(),


          SizedBox(
            height: 30.w,
          ),
          AbcButton(
            title: '完成',
            bgColor: const Color(0xffF35855),
            onTap: () {
              if(!state.isMonth){
                if(state.temBeginTime == ''){
                  '请选择开始时间'.showToast;
                  return;
                }
                if(state.temEndTime == ''){
                  '请选择结束时间'.showToast;
                  return;
                }
                DateTime firstDay = DateFormat("yyyy-MM-dd").parse(state.temBeginTime);
                DateTime lastDay = DateFormat("yyyy-MM-dd").parse(state.temEndTime);
                bool errorTime = TimeRangeValidator.checkTimeRange(startTime: firstDay, endTime: lastDay);
                if(errorTime == false){
                  '结束时间不能小于起始时间'.showBottomToast;
                  return;
                }
              }
              Get.back();
              logic.sureTimeButton();
            },
            margin: EdgeInsets.only(left: 12.w, right: 12.w),
          ),

        ],
      ),
    );
  }

  Map<String, String> calculateDateRange(int months) {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');

    // 开始时间（当前日期的 00:00:00）
    final startDate = DateTime(now.year, now.month, now.day);

    // 结束时间（加上指定月数后的 23:59:59.999）
    final endDate = DateTime(now.year, now.month + months, now.day)
        .subtract(const Duration(milliseconds: 1));

    return {
      'start': formatter.format(startDate),
      'end': formatter.format(endDate),
    };
  }
}
