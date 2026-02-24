import 'package:cbc/utils/time_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'component/calendar_dialog.dart';
import 'print_state.dart';

class PrintLogic extends GetxController {
  final PrintState state = PrintState();

  var selectName = ''.obs;

  var showAccount = false.obs;

  var showEncryption = true.obs;

  var isAgree = true.obs;

  @override
  void onInit() {
    super.onInit();
    state.reqPrint.showType = showAccount.value?'是':'否';
    state.reqPrint.method = showEncryption.value?'是':'否';
  }

  void showCalendarDialog(String timeType) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: CalendarDialog(
            selectedDate: timeType == '1'
                ? DateTime.parse(state.reqPrint.beginTime)
                : DateTime.parse(state.reqPrint.endTime),
            onDateSelected: (date) {
              if(timeType == '1'){
                state.reqPrint.beginTime = state.printFormatter.format(date);
              }else{
                state.reqPrint.endTime = state.printFormatter.format(date);
              }
              update(['updateRight']);
            },
          ),
        );
      },
    );
  }


  void changeTimeTag(){
    int m = 1;
    if(selectName.value == '近1月') m = 1;
    if(selectName.value == '近3月') m = 3;
    if(selectName.value == '近6月') m = 6;
    if(selectName.value == '近一年') m = 12;
    Map<String, String> dataTimeMap = DateRangeCalculator.getRecentMonthRange(m);
    state.reqPrint.beginTime = dataTimeMap['start']??'';
    state.reqPrint.endTime = dataTimeMap['end']??'';
    update(['updateRight']);
  }


  bool isValidEmail(String email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
