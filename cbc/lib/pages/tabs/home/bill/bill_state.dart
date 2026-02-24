import 'package:cbc/config/model/pay_ment_model.dart';
import 'package:cbc/pages/other/sheet_widget/picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'bill_req.dart';

class BillState {

  TextEditingController searchController = TextEditingController();

  BillReq billReq = BillReq();
  DateTimePickerNotifier mPickerNotifier = DateTimePickerNotifier();
  DateTimePickerNotifier pickerNotifier = DateTimePickerNotifier();

  RefreshController refreshController1 = RefreshController();
  ScrollController scrollController1 = ScrollController();

  RefreshController refreshController = RefreshController();
  ScrollController scrollController = ScrollController();
  bool isAtTop = true;

  List<PayMentList> list = [];
  PayMentModel payMentModel = PayMentModel();
  String accountTitle = '全部账户';

  // string 可选 收支类型（1收入2支出）
 List selTypeList = [];
 List selTypeList1 = [];

  //  string 交易类型
  List selTransactionTypeList = [];
  List selTransactionTypeList1 = [];

//  string 交易币种
  List selTransactionCurrencyList = [];
  List selTransactionCurrencyList1 = [];

  //  string 交易金额
  List selPriceList = [];
  List selPriceList1 = [];




  bool isMonth = true;
  //月份时间
  String mTime = '';
  String temMTime= '';



  List selTimeTag = [];
  //  开始时间
  String beginTime = '';
  String temBeginTime = '';
  //结束时间
  String endTime = '';
  String temEndTime = '';




  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();



  double incomeTotal = 0;
  double expensesTotal = 0;

  double incomeTotalMonth = 0;
  double expensesTotalMonth = 0;
  String monthTopString = '';


  BillState() {
    ///Initialize variables
  }
}
