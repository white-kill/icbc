import 'package:cbc/config/app_config.dart';
import 'package:common_utils/common_utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_manage_state.dart';

class Login_manageLogic extends GetxController {
  final Login_manageState state = Login_manageState();



  String valueStr(String name){
    if(name == '上次登录:'){
      return model;
    }
    if(name == '登录时间:'){
      return  DateUtil.formatDate(DateTime.now(), format:DateFormats.full);
    }
    if(name == '电子银行注册地:'){
      return AppConfig.config.abcLogic.memberInfo.city;
    }
    if(name == '注册方式:'){
      return '柜面注册';
    }

    return '';
  }

  String model= '';

  @override
  void onInit(){
    super.onInit();
    _getDeviceInfo();
  }

  Future<void> _getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    model = androidInfo.model;
    update(['updateUI']);
  }
}
