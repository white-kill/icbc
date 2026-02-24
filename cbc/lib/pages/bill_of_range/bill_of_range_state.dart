import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/model/month_bill_entity.dart';

class BillOfRangeState {
  var month = DateTime.now().month.obs;
  PageController pageController = PageController();
  var currentPageIndex = 0.obs;
  var page3Tab0 = false.obs;
  var page2Tab0 = false.obs;

  var monthData = MonthBillData().obs;


  List titleName = [
    '本月收入',
    '本月支出',
    '本月信用卡消费',
    '本月结余',
  ];

  List contentName = [
    '在线求捞!财神带带我~',
    '钱都花在刀刃上~',
    '吃喝玩乐懂生活!',
    '精准挂零，有点水平',
  ];

  List<SalesData> data1 = [];
  List<SalesData> data2 = [];

  BillOfRangeState() {
    ///Initialize variables
  }
}

class SalesData {
  SalesData(this.title, this.sales, this.color, this.rate);

  final String title;
  final double sales;
  final Color color;
  final double rate;
}
