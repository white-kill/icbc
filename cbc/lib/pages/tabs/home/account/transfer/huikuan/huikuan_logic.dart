import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../config/dio/network.dart';
import '../../../../../../config/model/transfer_page_model.dart';
import '../../../../../../config/net_config/apis.dart';
import 'huikuan_state.dart';

class HuikuanLogic extends GetxController {
  final HuikuanState state = HuikuanState();

  var isSelectCard = false.obs;

  int filterCont = 0;

  TransferPageModel pageMode = TransferPageModel();

  @override
  void onInit() {
    super.onInit();
    filterCont = state.transactionChannelList.length +
        state.typeList.length +
        state.priceList.length +
        state.currencyList.length;

    getData();
  }

  Future getData() async{
    print(state.transferData.toJson());
    await Http.get(
        Apis.transferPage,
        queryParameters: state.transferData.toJson(),
        isLoading: state.transferData.pageNum == 1
    ).then((v) {
      print(v);
      if(v == null) return;
      pageMode = TransferPageModel.fromJson(v);
      state.refreshController.loadComplete();
      if (!pageMode.list.isNotEmpty) {
        state.refreshController.loadNoData();
      }
      if(state.transferData.pageNum == 1){
        state.list = pageMode.list;
      }else{
        state.list = state.list + pageMode.list;
      }
      update(['updateUI']);
    });
  }

  void sureFilterButton() {
    state.transactionChannelList.clear();
    state.typeList.clear();
    state.priceList.clear();
    state.currencyList.clear();

    state.transactionChannelList.addAll(state.temTransactionChannelList);
    state.typeList.addAll(state.temTypeList);
    state.priceList.addAll(state.temPriceList);
    state.currencyList.addAll(state.temCurrencyList);

    filterCont = state.transactionChannelList.length +
        state.typeList.length +
        state.priceList.length +
        state.currencyList.length;

    state.transferData.minAmount = state.controller1.text;
    state.transferData.maxAmount = state.controller2.text;
    state.transferData.transactionChannel =
        state.transactionChannelList.join(',');
    state.transferData.type = state.typeList.join(',');
    state.transferData.currency = state.currencyList.join(',');
    state.transferData.pageNum = 1;
    state.transferData.endPageTime = '';
    update(['upDateTopWidget', 'updateTopType']);
    getData().then((_){
      state.controller.jumpTo(0);
    });
  }

  void sureTimeButton(){

    if(state.isMonth){
      state.mTime = state.temMTime;
      String monthString = state.mTime;
      DateTime firstDay = DateFormat("yyyy-MM").parse(monthString);
      DateTime lastDay = DateTime(firstDay.year, firstDay.month + 1, 0);
      state.transferData.beginTime= DateFormat('yyyy-MM-dd').format(firstDay);
      state.transferData.endTime= DateFormat('yyyy-MM-dd').format(lastDay);
    }else {
      if(state.temBeginTime != '' && state.temEndTime != ''){
        state.beginTime = state.temBeginTime;
        state.endTime = state.temEndTime;
        state.transferData.beginTime = state.beginTime;
        state.transferData.endTime = state.endTime;
      }
    }
    state.transferData.pageNum = 1;
    state.transferData.endPageTime = '';
    update(['upDateTopWidget','updateTopType']);
    getData().then((_){
      state.controller.jumpTo(0);
    });
  }
}
