import 'package:cbc/config/dio/network.dart';
import 'package:cbc/config/model/month_bill_list_entity.dart';
import 'package:cbc/config/net_config/apis.dart';
import 'package:cbc/utils/sp_util.dart';
import 'package:get/get.dart';

import 'bill_more_state.dart';

class BillMoreLogic extends GetxController {
  final BillMoreState state = BillMoreState();

  @override
  void onInit() {
    super.onInit();
    requestAllBill();
  }

  Future requestAllBill() async {
    if (token == '') return;
    await Http.get(Apis.getMonthBillList).then((value) {
      print(value);
      if(value is List){
        state.monthBillData.value = value.map((e) => MonthBillListEntity.fromJson(e)).toList();
        update(['updateBalance', 'updateUI', 'updateCard']);
      }
    });
  }
}
