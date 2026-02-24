import 'package:cbc/pages/other/sheet_widget/picker_widget.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../routes/app_pages.dart';
import '../../../../../../../utils/abc_button.dart';
import '../../../../../../../utils/time_tool.dart';
import '../huikuan_logic.dart';
import '../huikuan_state.dart';

class FilterTimeWidget extends StatefulWidget {
  const FilterTimeWidget({super.key});

  @override
  State<FilterTimeWidget> createState() => _FilterTimeWidgetState();
}

class _FilterTimeWidgetState extends State<FilterTimeWidget> {


  List title = [
    '近一月',
    '近三月',
    '近六月',
    '近一年'
  ];


  bool selectName(String name,{required List selList}) {
    return selList.contains(name);
  }
  Color selectColor(String name, {bool bg = false, required List selList}) {
    if (bg) {
      if (selectName(name, selList: selList)) {
        return  BColors.mainColor.withOpacity(0.1);
      }
      return const Color(0xffF2F2F2).withOpacity(0.5);
    } else {
      if (selectName(name, selList: selList)) return const Color(0xffF35855);
      return const Color(0xff666666);
    }
  }


  final HuikuanLogic logic = Get.put(HuikuanLogic());
  final HuikuanState state = Get.find<HuikuanLogic>().state;

  String timeType = '';
  bool isSelectTag = false;

  @override
  void initState() {
    super.initState();

    state.temMTime = state.mTime == ''?DateFormat("yyyy-MM").format(DateTime.now()):state.mTime;

    WidgetsBinding.instance.addPostFrameCallback((_){
      if(state.isMonth){
        changeMonth();
      }else{
        if(state.selTimeTag.contains('近一月')){
          state.temBeginTime = DateRangeCalculator.getRecentMonthRange(1)['start']??'';
          state.temEndTime = DateRangeCalculator.getRecentMonthRange(1)['end']??'';
        }
        if(state.selTimeTag.contains('近三月')){
          state.temBeginTime = DateRangeCalculator.getRecentMonthRange(3)['start']??'';
          state.temEndTime = DateRangeCalculator.getRecentMonthRange(3)['end']??'';
        }
        if(state.selTimeTag.contains('近六月')){
          state.temBeginTime = DateRangeCalculator.getRecentMonthRange(6)['start']??'';
          state.temEndTime = DateRangeCalculator.getRecentMonthRange(6)['end']??'';
        }
        if(state.selTimeTag.contains('近一年')){
          state.temBeginTime = DateRangeCalculator.getRecentMonthRange(12)['start']??'';
          state.temEndTime = DateRangeCalculator.getRecentMonthRange(12)['end']??'';
        }
      }
      setState(() {});
    });
  }

  void changeMonth(){

    // state.temEndTime = state.endTime;
    // state.temBeginTime = state.beginTime;

    List<String> parts = state.temMTime.split('-');
    DateTime dateTime = DateTime(
      int.parse(parts[0]), // 年
      int.parse(parts[1]), // 月
      1,
    );
    print(state.temMTime);
    state.mPickerNotifier.jumpTime(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 410.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          Column(
            children: [
              SizedBox(height: 15.w,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseText(text: '按月',color:state.isMonth?BColors.mainColor:Colors.black,),
                      SizedBox(height: 2.w,),
                      Container(
                        width: 20.w,
                        height: 2.w,
                        color: state.isMonth?BColors.mainColor:Colors.white,
                      )
                    ],
                  ).withOnTap(onTap: (){
                    state.isMonth = true;
                    changeMonth();
                    setState(() {});
                  }),
                  SizedBox(width: 120.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseText(text: '时间段',color:!state.isMonth?BColors.mainColor:Colors.black,),
                      SizedBox(height: 2.w,),
                      Container(
                        width: 25.w,
                        height: 2.w,
                        color:  !state.isMonth?BColors.mainColor:Colors.white,
                      )
                    ],
                  ).withOnTap(onTap: (){
                    state.isMonth = false;
                    setState(() {});
                  }),
                ],
              ).withContainer(
                width: 1.sw,
                alignment: Alignment.center,
              ),

              SizedBox(height: 35.w,),



              state.isMonth?Container(
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
              ) :Column(
                children: [

                  VerticalGridView(
                    padding: EdgeInsets.only(left: 35.w, right: 35.w),
                    widgetBuilder: (_, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: selectColor(title[index],selList: state.selTimeTag,bg: true),
                          borderRadius: BorderRadius.all(Radius.circular(4.w)),
                          border: Border.all(
                            width: 0.5.w,
                            color: selectColor(title[index],
                                selList: state.selTimeTag),
                          ),
                        ),
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
                    mainHeight: 25.w,
                    spacing: 5.w,
                    crossSpacing: 8.w,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 135.w,
                        height: 36.w,
                        padding: EdgeInsets.only(left: 6.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.w)),
                          border: Border.all(
                            color:timeType == '1'?const Color(0xffF35855): const Color(0xff333333),
                            width: 0.5.w,
                          ),
                        ),
                        child: BaseText(text:state.temBeginTime,fontSize: 12.sp,color: BColors.blue1Color,),
                      ).withOnTap(onTap: (){
                        timeType = '1';
                        setState(() {});
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
                        width: 135.w,
                        height: 36.w,
                        padding: EdgeInsets.only(left: 6.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.w)),
                          border: Border.all(
                            color: timeType == '2'?const Color(0xffF35855):const Color(0xff333333),
                            width: 0.5.w,
                          ),
                        ),
                        child: BaseText(text: state.temEndTime,fontSize: 12.sp,color:BColors.blue1Color,),
                      ).withOnTap(onTap: (){
                        timeType = '2';
                        setState(() {});
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
                  ).withPadding(top: 24.w,left: 30.w,right: 30.w),

                  Container(
                    alignment: Alignment.center,
                    height: 140.w,
                    margin: EdgeInsets.only(left: 30.w,right: 30.w),
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
                  )

                ],
              ),
            ],
          ),



          Column(
            children: [

              AbcButton(
                title: '确定',
                height: 48.w,
                radius: 6.w,
                onTap: () {
                  logic.sureTimeButton();
                  Get.back();
                },
                margin: EdgeInsets.only(left: 12.w, right: 12.w,top: 20.w),
              ),
              SizedBox(height: 12.w,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseText(text: '仅支持查询5年内的汇款明细，更多查询请',color: Color(0xff666666),),
                  BaseText(text: '前往收支',color: BColors.blue1Color,).withOnTap(onTap:(){
                    Routes.billPage.push;
                  }),
                ],
              ),
              SizedBox(height: 6.w,),
            ],
          ),
        ],
      ),
    );
  }
}
