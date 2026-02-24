import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'card_req.dart';
import 'card_transfer_state.dart';

class CardTransferLogic extends GetxController {
  final CardTransferState state = CardTransferState();


  Map<String,dynamic> transferInfo = {};

  bool phoneTransfer = false;

  @override
  void onInit() {
    super.onInit();
    phoneTransfer = Get.arguments?['phoneTransfer']??false;
    if(Get.arguments?['cardInfo'] != null){
      state.cardInfo =  Get.arguments?['cardInfo'];
      state.cardReq.bankId = state.cardInfo['id'];
      state.cardReq.realName = state.cardInfo['name'];
      state.cardReq.bankName = state.cardInfo['bankName'];
      state.cardReq.cardNo = state.cardInfo['bankCard'];
      state.nameTextController.text = state.cardReq.realName;
      state.accountTextController.text = state.cardReq.cardNo;
      update(['updateUI', 'updateBottom','updateCard']);
    }

  }
}
