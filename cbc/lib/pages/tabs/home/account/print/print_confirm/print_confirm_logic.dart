import 'package:cbc/config/app_config.dart';
import 'package:get/get.dart';

import '../req_print.dart';
import 'print_confirm_state.dart';

class Print_confirmLogic extends GetxController {
  final Print_confirmState state = Print_confirmState();

  ReqPrint reqPrint = ReqPrint();
  @override
  void onInit() {
    super.onInit();

    reqPrint = Get.arguments?['data']??ReqPrint();
  }


  String valueStr(String name){
    if(name == '账户') return AppConfig.config.abcLogic.card();
    if(name == '起始日期') return reqPrint.beginTime;
    if(name == '截止日期') return reqPrint.endTime;
    if(name == '交易币种') return reqPrint.currency;
    if(name == '交易类型') return reqPrint.detailType;
    if(name == '显示对方户名和账号') return reqPrint.showType;
    if(name == '明细文件加密') return reqPrint.method;
    if(name == '接收邮箱') return reqPrint.email;
    return '';
  }

}
