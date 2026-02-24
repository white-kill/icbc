import 'package:cbc/pages/tabs/home/account/print/req_print.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/time_tool.dart';

class PrintState {

  List titleName = [
    '选择账户',
    'time',
    '起始日期',
    '截止日期',
    'title'
    '',
    '交易币种',
    '交易类型',
    '显示对方户名和账户',
    '明细文件加密',
    '',
    '接收邮箱',
    '营销代码',
  ];


  List timeTag = [
    '近1月',
    '近3月',
    '近6月',
    '近一年',
  ];

  List detailTypeList = [
    '全部',
    '工资',
    '汇款',
  ];

  List currencyList = [
    '全部',
    '人民币',
    '美元',
    '港币',
    '欧元',
    '英镑',
    '瑞士法郎',
    '新加坡元',
    '日元',
    '加拿大元',
    '澳大利亚元',
    '新西兰元',
  ];

  DateFormat printFormatter = DateFormat('yyyy-MM-dd');
  ReqPrint reqPrint = ReqPrint();

  TextEditingController emailTextController = TextEditingController();

  PrintState() {
    ///Initialize variables

    String time = printFormatter.format(DateTime.now());

    Map<String, String> dataTimeMap = DateRangeCalculator.getRecentMonthRange(6);
    reqPrint.beginTime = dataTimeMap['start']??'';
    reqPrint.endTime = dataTimeMap['end']??'';

    reqPrint.detailType = '全部';
    reqPrint.currency = '全部';
    // reqPrint.beginTime = time;
    // reqPrint.endTime = time;
  }
}
