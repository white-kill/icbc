import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../../../config/app_config.dart';
import 'detail_state.dart';

class DetailLogic extends GetxController {
  final DetailState state = DetailState();



  String valueStr(String name){
    if(name == '手机号码'){
      return AppConfig.config.abcLogic.phone();
    }
    if(name == '姓名(中文)'){
      return AppConfig.config.abcLogic.memberInfo.realName.removeFirstChar1();
    }
    if(name == '姓名(英文)'){
      return '--';
    }
    if(name == '性别'){
      return AppConfig.config.abcLogic.memberInfo.sex == '1'?'男':'女';
    }
    if(name == '国籍'){
      return '中国';
    }
    if(name == '证件类型'){
      return '身份证';
    }
    if(name == '证件号码'){
      return AppConfig.config.abcLogic.memberInfo.idCard.desensitize(prefixLen: 3,suffixLen: 2);
    }
    if(name == '证件有效期'){
      return '正常';
    }
    return '';
  }

}
