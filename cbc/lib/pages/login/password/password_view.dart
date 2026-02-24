import 'package:cbc/config/abc_config/cbc_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'password_logic.dart';
import 'password_state.dart';

class PasswordPage extends BaseStateless {
  PasswordPage({Key? key}) : super(key: key);

  final PasswordLogic logic = Get.put(PasswordLogic());
  final PasswordState state = Get.find<PasswordLogic>().state;

  @override
  Color? get background => Colors.white;

  @override
  Widget? get leftItem => Icon(
        Icons.clear,
        size: 24.w,
        color: Color(0xFF607483),
      ).withOnTap(onTap: () {
        Get.back();
      });

  @override
  Widget initBody(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Stack(children: [
            Positioned(
              top: ScreenUtil().statusBarHeight,
              left: 1.sw / 2 - 71.w / 2,
              child: Image(width: 71.w, height: 71.w, image: 'a_login_icon'.png3x),
            ),

            Positioned(
              top: ScreenUtil().statusBarHeight + 85.w,
              left: 0,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseText(text: '晚上好，${logic.phone.desensitize()}',style: TextStyle(
                    fontSize: 18.sp,
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold
                  ),),
                  Image(image: 'ic_jt_bottom'.png3x,width: 18.w,height: 18.w,)
                ],
              ).withContainer(
                width: 1.sw,
                height: 26.w
              ),
            ),
            Positioned(
              top: 110.w + ScreenUtil().statusBarHeight + 30.w, // 调整垂直位置
              left: 20.w, // 调整水平位置
              right: 20.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: 'a_password'.png3x,width: 20.w,height: 20.w,),
                      SizedBox(width: 8.w,),
                      Expanded(
                        child: TextField(
                          controller: state.psdTextController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none, // 隐藏边框
                            hintText: '请输入8-30位的登录密码',
                            hintStyle: TextStyle(
                              color: Color(0xff676767), // 设置提示文字颜色
                              fontSize:16.0, // 可选：调整字体大小
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          '忘记密码？',
                          style: TextStyle(
                            color: Color(0xff3E6AC0),
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    color: Color(0x668C8C8C),
                    height: 1,
                    thickness: 1,
                  ),
                  SizedBox(height: 40.w), // 调整下划线与输入框之间的间距
                  // 添加登录按钮
                  SizedBox(
                    width: double.infinity, // 使按钮宽度和下划线一样长
                    height: 44.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Color(0xffCF0000)),
                        elevation: WidgetStateProperty.all(0),
                      ),
                      onPressed: () {
                        // 处理登录点击事件
                        logic.goLogin();
                      },
                      child: Text('登录',style: TextStyle(
                        fontSize: 18.sp
                      ),),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.w)),
                  SizedBox(
                      width: double.infinity, // 使按钮宽度和下划线一样长
                      height: 20.w,
                      child: Text(
                        textAlign: TextAlign.center,
                        "更多登录方式  ｜  帮助",
                        style: TextStyle(
                            color: Color(0xff3E6AC0), fontSize: 15.sp),
                      )), // 调整按钮与其他内容之间的间距
                ],
              ),
            ),
          ])),
    );
  }
}
