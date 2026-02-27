import 'package:cbc/config/dio/network.dart';
import 'package:cbc/config/model/pay_ment_model.dart';
import 'package:cbc/config/net_config/apis.dart';
import 'package:cbc/utils/time_tool.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import 'bill_state.dart';

class BillLogic extends GetxController {
  final BillState state = BillState();
  var isAllAccount = true.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
    state.scrollController.addListener(_scrollListener); // 添加滚动监听

  }
  int mCount = 0;
  @override
  void onClose() {
    state.scrollController.removeListener(_scrollListener); // 移除监听
    state.scrollController.dispose();
    super.onClose();
  }
  void _scrollListener() {
    final bool isAtTop = state.scrollController.position.pixels == 0;
    if(isAtTop){
      state.incomeTotalMonth = 0;
      state.expensesTotalMonth = 0;
      state.monthTopString = '';
    }
    if (isAtTop != state.isAtTop) {
      state.isAtTop = isAtTop;
      update(['updateNoFilterList']);
    }
  }

  Future getData() async{
    print(state.billReq.toJson());
   await Http.get(
      Apis.billPagePayment,
      queryParameters: state.billReq.toJson(),
     isLoading: state.billReq.pageNum == 1
    ).then((v) {
      state.payMentModel = PayMentModel.fromJson(v);

      state.refreshController.loadComplete();
      state.refreshController1.loadComplete();
      if (!state.payMentModel.list.isNotEmpty) {
        state.refreshController.loadNoData();
        state.refreshController1.loadNoData();

      }
      if(state.payMentModel.list.isNotEmpty){
        state.billReq.endPageTime = state.payMentModel.list.last.endPageTime;
      }
      if (state.billReq.pageNum == 1) {
        state.list = state.payMentModel.list;
      } else {
        state.list = state.list + state.payMentModel.list;
      }
      state.incomeTotal = 0;
      state.expensesTotal = 0;
      mCount = 0;
      state.list.forEach((e){
        if(e.day == ''){
          mCount++;
        }
        if(e.day.isNotEmpty) {
          e.day = e.day.replaceAll('年0', '年');
        }
        if(e.type == '1'){
          state.incomeTotal = state.incomeTotal + double.parse(e.amount);
        }else{
          String a = e.amount.replaceAll('-', '');
          if(a != ''){
            state.expensesTotal = state.expensesTotal + double.parse(a);
          }
        }
      });

      update(['updateUI','updateCount']);
    });
  }

  void sureFilterButton(){
    state.selTypeList1.clear();
    state.selPriceList1.clear();
    state.selTransactionTypeList1.clear();
    state.selTransactionCurrencyList1.clear();

    state.selPriceList1.addAll(state.selPriceList);
    state.selTypeList1.addAll(state.selTypeList);
    state.selTransactionTypeList1.addAll(state.selTransactionTypeList);
    state.selTransactionCurrencyList1.addAll(state.selTransactionCurrencyList);
    state.billReq.type = '';
    if(state.selTypeList1.contains('收入')){
      state.billReq.type = '1';
    }
    if(state.selTypeList1.contains('支出')){
      state.billReq.type = '2';
    }
    state.billReq.minAmount = state.controller1.text;
    state.billReq.maxAmount = state.controller2.text;
    state.billReq.transactionType = state.selTransactionTypeList1.join(',');
    state.billReq.transactionCurrency = state.selTransactionCurrencyList1.join(',');
    state.billReq.pageNum = 1;
    state.billReq.endPageTime = '';
    update(['upDateTopWidget','updateTopType']);
    getData().then((_){
      try{
        state.scrollController.jumpTo(0);
        state.scrollController1.jumpTo(0);
      }catch(e){
        if (kDebugMode) {
          print(e);
        }
      }
    });
  }

  void sureTimeButton(){

    if(state.isMonth){
     state.mTime = state.temMTime;
     String monthString = state.mTime;
      DateTime firstDay = DateFormat("yyyy-MM").parse(monthString);
      DateTime lastDay = DateTime(firstDay.year, firstDay.month + 1, 0);
      state.billReq.beginTime= DateFormat('yyyy-MM-dd').format(firstDay);
      state.billReq.endTime= DateFormat('yyyy-MM-dd').format(lastDay);
    }else {
      if(state.temBeginTime != '' && state.temEndTime != ''){
        state.beginTime = state.temBeginTime;
        state.endTime = state.temEndTime;
        state.billReq.beginTime = state.beginTime;
        state.billReq.endTime = state.endTime;
      }
    }
    state.billReq.pageNum = 1;
    state.billReq.endPageTime = '';
    update(['upDateTopWidget','updateTopType']);
    getData().then((_){
      state.scrollController.jumpTo(0);
    });
  }

  bool listViewType() {
    int p = state.controller1.text != '' || state.controller2.text != ''?1:0;
    int count = state.selTypeList.length +
        state.selTransactionCurrencyList.length +
        state.selTransactionTypeList.length + p;
    return count >0 || state.isMonth == false;
  }
}
