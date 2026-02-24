import 'package:flutter/material.dart';

import 'card_req.dart';

class CardTransferState {


  TextEditingController nameTextController = TextEditingController();

  TextEditingController accountTextController = TextEditingController();
  FocusNode accountFocusNode = FocusNode();
  bool showAccountTextField = false;

  TextEditingController moneyTextController = TextEditingController();
  FocusNode moneyFocusNode = FocusNode();
  String moneyStr = '';

  TextEditingController remarksTextController = TextEditingController();
  TextEditingController dxTextController = TextEditingController();

  Map<String, dynamic> cardInfo = {
    'icon':'',
    'bankName':'',
    'id':'',
    'name':'',
    'bankCard':'',
  };

  CardReq  cardReq = CardReq();


  CardTransferState() {
    ///Initialize variables
  }

}
