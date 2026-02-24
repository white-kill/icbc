import 'package:cbc/utils/sp_util.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../config/app_config.dart';
import '../../../config/dio/network.dart';
import '../../../config/net_config/apis.dart';
import '../../../routes/app_pages.dart';
import 'password_state.dart';

class PasswordLogic extends GetxController {
  final PasswordState state = PasswordState();

  String phone = '';

  @override
  void onInit() {
    super.onInit();
    phone = Get.arguments['phone'];
  }

  void goLogin() {
    if (Get.arguments['phone'] == '') {
      '请输入账号'.showToast;
      return;
    }

    if (state.psdTextController.text == '') {
      '请输入密码'.showToast;
      return;
    }
    Http.post(Apis.login, data: {
      "username": Get.arguments?['phone'],
      "password": state.psdTextController.text
    }).then((value) {
      if (value != null && value['access_token'] != '') {
        'Bearer ${value['access_token']}'.saveToken;
        Http.setHeaders({'Authorization': token});
        AppConfig.config.abcLogic
            .memberInfoData()
            .then((v) => Get.offAllNamed(Routes.tabs));
      }
    });
  }
}
