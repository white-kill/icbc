import 'package:cbc/config/abc_config/cbc_logic.dart';
import 'package:cbc/config/app_config.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../../../config/model/pay_ment_model.dart';
import 'bill_detail_state.dart';

class BillDetailLogic extends GetxController {


  var showMore = false.obs;
  final BillDetailState state = BillDetailState();


  bool show = false;
  PayMentListBillDetail billDetail = PayMentListBillDetail();


  var categoryText = '转给他人'.obs;
  var categoryImg = 'ic_c_0'.obs;
  String temCategoryText = '';


  var showOpen = true.obs;

  @override
  void onInit() {
    super.onInit();
    billDetail = Get.arguments['model'];
    categoryText.value = billDetail.excerpt;
    categoryImg.value = billDetail.icon;


    if(billDetail.excerpt == ''){
      state.titleNameList.remove('业务摘要');
    }

    if(billDetail.merchantBranch == ''){
      state.titleNameList.remove('交易场所');
    }


    if(billDetail.oppositeAccount == ''){
      state.titleNameList.remove('对方账户');
    }
    if(billDetail.oppositeName == ''){
      state.titleNameList.remove('对方户名');
    }
    if(billDetail.oppositeBankName == ''){
      state.titleNameList.remove('对方账户行别');
    }

    if(billDetail.oppositeAccount == '' && billDetail.oppositeName == '' && billDetail.oppositeBankName == ''){
      state.titleNameList.removeAt(state.titleNameList.length -3);
    }
  }



  String valueStr(String name){
    if(name == '交易卡号'){return show?billDetail.bankCard:billDetail.bankCard.maskBankCardNumber();}
    if(name == '交易账户'){return AppConfig.config.abcLogic.phone();}
    if(name == '交易户名'){return AppConfig.config.abcLogic.memberInfo.realName;}
    if(name == '交易时间'){return billDetail.transactionTime;}
    if(name == '业务摘要'){return billDetail.excerpt;}
    if(name == '交易场所'){return billDetail.merchantBranch;}
    if(name == '交易金额'){return billDetail.amount.bankBalance;}
    if(name == '交易国家或地区简称'){return billDetail.transactionCountry;}
    if(name == '记账金额'){return billDetail.amount.bankBalance;}
    if(name == '记账币种'){return billDetail.transactionCurrency;}
    if(name == '对方账户'){return show?billDetail.oppositeAccount:billDetail.oppositeAccount.maskBankCardNumber();}
    if(name == '对方户名'){return billDetail.oppositeName;}
    if(name == '对方账户行别'){return billDetail.oppositeBankName;}
    return '';
  }

  String amount(){
    String p = billDetail.amount.bankBalance.replaceAll('-', '');
    String fh = billDetail.type == '2'?'-':'+';
    return fh + p;
  }
}
