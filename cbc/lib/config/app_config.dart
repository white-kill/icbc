import 'package:cbc/utils/sp_util.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sp_util/sp_util.dart';
import 'dart:io' show Platform;
import '../utils/local_notifications.dart';
import 'abc_config/cbc_logic.dart';
import 'net_config/net_config.dart';

class AppProxy {

  Config? config;

  static AppProxy? _instance;

  static AppProxy get instance => _instance ??= AppProxy._internal();

  AppProxy._internal() {
    config = Config();
  }

}


/// 全局配置统一在此处处理
class Config {
  ///其他配置


  ///网络配置
  NetConfig netConfig = NetConfig();

  late CbcLogic abcLogic;
  Future initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    await SpUtil.getInstance();
    // netConfig.baseUrl = 'http://47.102.135.129:8001';
    netConfig.baseUrl = 'http://api.jianshewap.cc';
    '仅收入'.saveSearchHistory;
    NotificationHelper.getInstance().initialize();
    abcLogic = Get.put(CbcLogic());
    // 应用启动时申请相机权限
    await Permission.camera.request();
  }
}

///
/// 全局配置
///
class AppConfig {
  AppConfig._();

  static Config config = AppProxy.instance.config!;

}
