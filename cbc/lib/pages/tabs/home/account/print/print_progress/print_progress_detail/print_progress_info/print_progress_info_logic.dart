import 'package:get/get.dart';

import '../../../../../../../../config/app_config.dart';
import '../../../../../../../../config/model/progress_detail_model.dart';
import 'print_progress_info_state.dart';

class Print_progress_infoLogic extends GetxController {
  final Print_progress_infoState state = Print_progress_infoState();

  ProgressDetailModel model = ProgressDetailModel();



  @override
  void onInit() {
    super.onInit();
    model = Get.arguments?['model']??ProgressDetailModel();
  }


  String valueStr(String name){
    if(name == '订单名称') return '历史明细打印';
    if(name == '订单状态') return '已发送';
    if(name == '申清单号') return model.orderId;
    if(name == '下单时间') return model.createTime;
    if(name == '账户') return AppConfig.config.abcLogic.card();
    if(name == '起始日期') return model.beginTime;
    if(name == '截止日期') return model.endTime;
    if(name == '交易币种') return model.currency;
    if(name == '交易类型') return model.detailType;
    if(name == '显示对方户名和账号') return model.showType == ''?'否':model.showType;
    if(name == '接收邮箱') return model.email;
    if(name == '文件密码') return model.code;
    return '';
  }
}
