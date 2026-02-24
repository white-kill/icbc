import 'package:flutter/cupertino.dart';

import 'fast_req.dart';

class FastTransferState {

  TextEditingController moneyTextController = TextEditingController();
  FocusNode moneyFocusNode = FocusNode();
  String moneyStr = '';

  FastReq fastReq = FastReq();

  List transferTime = [

    {
      'title':'实时汇款',
      'content':'实时汇出，不可微销'
    },

    {
      'title':'普通汇款',
      'content':'2小时后汇出，期间可撤销'
    },

    {
      'title':'次日汇款',
      'content':'次日凌晨汇出，当日可撤销'
    },
  ];

  FastTransferState() {
    ///Initialize variables
  }
}
