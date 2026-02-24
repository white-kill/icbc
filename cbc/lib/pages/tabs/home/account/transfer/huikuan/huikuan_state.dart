import 'package:cbc/pages/tabs/home/account/transfer/huikuan/req_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../../config/model/transfer_page_model.dart';
import '../../../../../../utils/time_tool.dart';
import '../../../../../other/sheet_widget/picker_widget.dart';

class HuikuanState {

  TextEditingController searchController = TextEditingController();

  RefreshController refreshController = RefreshController();
  ScrollController controller = ScrollController();

  DateTimePickerNotifier mPickerNotifier = DateTimePickerNotifier();
  DateTimePickerNotifier pickerNotifier = DateTimePickerNotifier();

  List transactionChannelList = [];
  List temTransactionChannelList = [];

  List typeList = ['汇款'];
  List temTypeList = [];

  List priceList = [];
  List temPriceList = [];

  List currencyList = [];
  List temCurrencyList = [];

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();


  bool isMonth = false;
  //月份时间
  String mTime = '';
  String temMTime= '';

  List selTimeTag = ['近一年'];
  //  开始时间
  String beginTime = '';
  String temBeginTime = '';
  //结束时间
  String endTime = '';
  String temEndTime = '';


  ReqTransferData transferData = ReqTransferData();
  List<TransferPageList> list = [];
  HuikuanState() {
    ///Initialize variables

    beginTime = DateRangeCalculator.getRecentMonthRange(12)['start']??'';
    endTime = DateRangeCalculator.getRecentMonthRange(12)['end']??'';
    transferData.beginTime = beginTime;
    transferData.endTime =endTime;
    // transferData.type = typeList.join(',');
  }
}
