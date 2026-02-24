import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../../../../../config/model/transfer_page_model.dart';
import 'hunkuan_info_state.dart';


class Hunkuan_infoLogic extends GetxController {
  final Hunkuan_infoState state = Hunkuan_infoState();

  TransferPageListBillDetail model = TransferPageListBillDetail();

  var showAll = false.obs;

  // ui.Image? watermarkImage;
  @override
  void onInit() {
    super.onInit();
    model = Get.arguments['model'];
  }

  String valueStr(String name){
    if(name == '收款账号'){return model.oppositeAccount.maskBankCardNumber();}
    if(name == '收款银行'){return model.oppositeBankName == ''?'--':model.oppositeBankName;}
    if(name == '交易时间'){return model.transactionTime;}
    if(name == '付款账号'){return model.bankCard.maskBankCardNumber();}
    if(name == '付款银行'){return model.bankName == ''?'--':model.bankName;}
    if(name == '交易渠道'){return model.transactionChannel;}
    if(name == '汇款附言'){return model.merchantBranch;}
    if(name == '汇款方式'){return '实时汇款';}
    if(name == '币种'){return '人民币';}
    if(name == '钞汇标志'){return '现钞';}
    if(name == '手续费*'){return '0.00';}
    if(name == '是否抵扣套餐'){return '否';}

    return '';
  }

}