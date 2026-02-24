import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../config/model/bill_item_model.dart';
import 'Req_data.dart';

class Account_detailState {

  RefreshController refreshController = RefreshController();
  ScrollController controller = ScrollController();

  ReqBillData billData = ReqBillData();

  BillItemModel itemModel = BillItemModel();
  List<BillItemList> list = [];

  double incomeTotal = 0;
  double expensesTotal = 0;
  Account_detailState() {
    ///Initialize variables
    billData.endTime = DateFormat('yyyy-MM-dd').format(DateTime.now());
    billData.beginTime = DateFormat('yyyy-MM-dd').format(getDateAfter30Days());
  }

  DateTime getDateAfter30Days() {
    return DateTime.now().subtract(const Duration(days: 30));
  }
}
