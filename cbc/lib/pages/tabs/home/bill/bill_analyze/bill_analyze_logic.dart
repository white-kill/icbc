import 'package:cbc/config/dio/network.dart';
import 'package:cbc/config/model/analysis_chat_model.dart';
import 'package:cbc/config/net_config/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/color_util.dart';
import 'bill_analyze_state.dart';

class BillAnalyzeLogic extends GetxController {
  final BillAnalyzeState state = BillAnalyzeState();

  var selectName = '月度分析'.obs;
  AnalysisChatModel? model;

  double p = 0;

  int selectIndex = 0;

  bool one = true;
  final ScrollController aScrollController = ScrollController();


  String timeStr = '';

  @override
  void onInit() {
    super.onInit();
    getData(time: DateFormat('yyyy-MM').format(DateTime.now()));
  }

  String temType = '';

  Future getData({
    String time = '',
    String type = '0',
}) async{
    timeStr = time;
  await Http.get(
      Apis.billAnalysis,
      queryParameters: {
        'dateTime': time,
        'type': type,
      },
    ).then((v) {
      List<DailyData> tMonthDailyData = [];
      model = AnalysisChatModel.fromJson(v);
      model?.trendList.forEach((e) {
        if(p < e.income.abs()) {
          p = e.income.abs();
        }
        if(p < e.expenses.abs()) {
          p = e.expenses.abs();
        }
        tMonthDailyData.add(DailyData(
            DateTime.parse(e.dateTime), e.income.abs(), e.expenses.abs()));
      });
      state.data1.clear();
      state.data2.clear();
      double p1 = 0;
      model?.incomeCateogryList.forEach((e){
        p1 = p1+0.2;
        double op = 1-p1 < 0.1?0.1:1-p1;
        state.data1.add(SalesData(e.name, e.totalAmount, BColors.mainColor.withOpacity(op),e.rate,e.categoryIcon));
      });
      double p2 = 0;
      model?.expensesCateogryList.forEach((e){
        p2 = p2+0.2;
        double op = 1-p2 < 0.1?0.1:1-p2;
        state.data2.add(SalesData(e.name, e.totalAmount, BColors.main1Color.withOpacity(op),e.rate,e.categoryIcon));
      });
      state.monthDailyData = tMonthDailyData.reversed.toList();
      if(one){
        selectIndex = state.monthDailyData.length-1;
        one = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToEnd();
        });
      }

      // if(selectName.value == '年度分析'){
      //   aScrollController.jumpTo(0);
      // }
      if( temType != type){
        temType = type;
        update(['updateMonth']);
      }
      update(['updateRank']);
    });
  }

  void _scrollToEnd() {
    if (aScrollController.hasClients) {
      final double maxScrollExtent = aScrollController.position.maxScrollExtent;
      aScrollController.jumpTo(maxScrollExtent);
    }
  }
}
