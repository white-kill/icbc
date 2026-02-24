
import 'dart:ui';

import 'package:intl/intl.dart';

class BillAnalyzeState {


  List<DailyData> monthDailyData = [];

  List<String> tabNameList = [
    '月度分析',
    '年度分析',
  ];

  List<SalesData> data1 = [];
  List<SalesData> data2 = [];

  String monthStr = '';
  String yearStr = '';

  BillAnalyzeState() {
    ///Initialize variables

    monthStr = DateFormat('yyyy年MM月').format(DateTime.now());
    yearStr = DateFormat('yyyy年').format(DateTime.now());
  }
}

class DailyData {
  final DateTime date;
  final double income;
  final double expense;
  final double profit;

  DailyData(this.date, this.income, this.expense) : profit = income - expense;
}


class SalesData {
  SalesData(this.title, this.sales, this.color, this.rate,this.icon);

  final String title;
  final double sales;
  final Color color;
  final String rate;
  final String icon;
}
