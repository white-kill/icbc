import 'package:cbc/config/app_config.dart';
import 'package:get/get.dart';

import 'info_state.dart';

class InfoLogic extends GetxController {
  final InfoState state = InfoState();


  String valueStr(String name){
    if(name == '手机号码'){
      return AppConfig.config.abcLogic.phone();
    }
    if(name == '人脸识别服务'){
      return '已采集';
    }
    return '';
  }
}
