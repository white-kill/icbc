import 'package:cbc/config/dio/network.dart';
import 'package:cbc/config/model/bill_item_model.dart';
import 'package:cbc/config/net_config/apis.dart';
import 'package:get/get.dart';

import 'account_detail_state.dart';

class Account_detailLogic extends GetxController {
  final Account_detailState state = Account_detailState();


  int mCount = 0;

  bool showFilter = false;

  @override
  void onInit() {
    super.onInit();

    if(Get.arguments?['reqData'] != null){
      showFilter = true;
      state.billData = Get.arguments?['reqData'];
    }

    getData();
  }


  void getData(){
    print(state.billData.toJson());
    Http.get(
      Apis.detailsQuery,
      queryParameters: state.billData.toJson(),
      isLoading: state.billData.pageNum == 1
    ).then((v) {
      state.itemModel = BillItemModel.fromJson(v);

      // state.list = state.list + state.itemModel.list;

      state.refreshController.loadComplete();
      if (!state.itemModel.list.isNotEmpty) {
        state.refreshController.loadNoData();
      }else {
        state.billData.endPageTime = state.itemModel.list.last.endPageTime;
      }
      if (state.billData.pageNum == 1) {
        mCount = 0;
        state.list = state.itemModel.list;
      } else {
        state.list = state.list + state.itemModel.list;
      }
      state.incomeTotal = 0;
      state.expensesTotal = 0;
      mCount = 0;
      state.list.forEach((e){
        if(e.day == ''){
          mCount++;
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
      update(['updateUI']);
    });
  }
}
