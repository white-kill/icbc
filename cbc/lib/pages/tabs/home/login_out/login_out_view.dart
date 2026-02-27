import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:cbc/utils/stack_position.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'package:cbc/config/app_config.dart';
import '../../../../routes/app_pages.dart';


import 'login_out_logic.dart';
import 'login_out_state.dart';

class LoginOutPage extends BaseStateless {
  LoginOutPage({Key? key}) : super(key: key, title: '欢送页');

  final LoginOutLogic logic = Get.put(LoginOutLogic());
  final LoginOutState state = Get.find<LoginOutLogic>().state;

  @override
  List<Widget>? get rightAction => [];

  /// 将 loginTime 格式化为：年月日 时分秒
  static String _formatLoginTime(String loginTime) {
    if (loginTime.isEmpty) return loginTime;
    try {
      final dateTime = DateTime.parse(loginTime);
      return DateFormat('yyyy年M月d日 H时mm分ss秒').format(dateTime);
    } catch (_) {
      return loginTime;
    }
  }

  @override
  Widget initBody(BuildContext context) {
    StackPosition stackPosition =
        StackPosition(designWidth: 1080, designHeight: 2151, deviceWidth: 1.sw);
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Stack(
          children: [
            Image(image: 'login_out'.png3x, fit: BoxFit.fitWidth),
            Positioned(
              left: stackPosition.getX(0),
              top: stackPosition.getY(340),
              child: Container(
                width: 1.sw,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseText(
                          text: "尊敬的${AppConfig.config.abcLogic.memberInfo.realName
                              .removeFirstChar1()}，您已安全退出手机银行，",
                          color: const Color(0xFF443333),
                          fontSize: 12.5.w,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseText(
                          text: '感谢您使用工商银行手机银行',
                          color: const Color(0xFF443333),
                          fontSize: 12.5.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: stackPosition.getX(100),
              top: stackPosition.getY(565),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BaseText(
                    text: _formatLoginTime(AppConfig.config.abcLogic.memberInfo.loginTime),
                    color: const Color(0xFF443333),
                    fontSize: 12.5.w,
                  ),
                ],
              ),
            ),
            Positioned(
              right: stackPosition.getX(100),
              top: stackPosition.getY(650),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BaseText(
                    text: DateFormat('yyyy年M月d日 H时mm分ss秒').format(DateTime.now()),
                    color: const Color(0xFF443333),
                    fontSize: 12.5.w,
                  ),
                ],
              ),
            ),
            Positioned(
              left: stackPosition.getX(0),
              top: stackPosition.getY(780),
              child: Container(
                width: 1.sw,
                height: stackPosition.getHeight(470),
              ).withOnTap(onTap: () {
                Get.offAllNamed(Routes.login);
              }),
            ),
          ],
        ),
      ],
    );
  }
}
