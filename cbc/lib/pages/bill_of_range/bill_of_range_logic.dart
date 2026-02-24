import 'package:cbc/config/app_config.dart';
import 'package:cbc/utils/sp_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:wb_base_widget/extension/double_extension.dart';

import '../../config/dio/network.dart';
import '../../config/model/month_bill_entity.dart';
import '../../config/net_config/apis.dart';
import '../../utils/color_util.dart';
import 'bill_of_range_state.dart';

class BillOfRangeLogic extends GetxController {
  final BillOfRangeState state = BillOfRangeState();

  var showMoney = false.obs;

  var showPop2 = false.obs;

  var showPop3 = false.obs;

  var showPop4 = false.obs;

  @override
  void onInit() {
    super.onInit();
    requestMonth();
  }

  Future requestMonth() async{
    if (token == '') return;
    var now = DateTime.now();
    // 计算上个月的日期
    DateTime lastMonth;
    // 如果当前是1月，则上个月是去年的12月
    if (now.month == 1) {
      lastMonth = DateTime(now.year - 1, 12);
    } else {
      lastMonth = DateTime(now.year, now.month);
    }
    // 格式化为 yyyy-MM 格式
    String lastMonthFormatted = DateFormat('yyyy-MM').format(lastMonth);
    await Http.get(Apis.getMonthBill,queryParameters: {
      "dateTime":lastMonthFormatted
    }).then((value) {
      print(value);
      if (value is Map<String, dynamic>) {
        state.monthData.value = MonthBillData.fromJson(value);

        state.data1.clear();
        state.data2.clear();
        double p1 = 0;
        state.monthData.value.income?.categoryList.forEach((e){
          p1 = p1+0.2;
          double op = 1-p1 < 0.1?0.1:1-p1;
          state.data1.add(SalesData(e.name, e.totalAmount, BColors.mainColor.withOpacity(op),e.rate));
        });
        double p2 = 0;
        state.monthData.value.expenses?.categoryList.forEach((e){
          p2 = p2+0.2;
          double op = 1-p2 < 0.1?0.1:1-p2;
          state.data2.add(SalesData(e.name, e.totalAmount, BColors.main1Color.withOpacity(op),e.rate));
        });
        update(['updateBalance', 'updateUI', 'updateCard']);
      }
    });
  }

  String moneyStr(int index){
    switch (index) {
      case 0:
        return '¥ ${AppConfig.config.abcLogic.memberInfo.incomeTotal.bankBalance}';
      case 1:
        return '¥ ${AppConfig.config.abcLogic.memberInfo.expensesTotal.bankBalance}';
      case 2:
        return '0';
      case 3:
        return '0';
      default:
        return '0';
    }
  }
  QrImage? qrImage;
  String code = '/billOfRangeTime';


  @override
  void onReady() {
    super.onReady();

    WidgetsBinding.instance.addPostFrameCallback((_){
      final qrCode = QrCode(
        8,
        QrErrorCorrectLevel.L,
      )..addData(code);

      qrImage = QrImage(qrCode);

      update(['code']);
    });
  }


}

Widget createCircleWithHole({
  double size = 100,
  Color color = Colors.blue,
  double borderWidth = 2,
}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: Colors.transparent,
      shape: BoxShape.circle,
      border: Border.all(
        color: color,
        width: borderWidth,
      ),
    ),
  );
}
