import 'package:cbc/pages/bill_loading/bill_loading_view.dart';
import 'package:cbc/pages/login/password/password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'login_logic.dart';
import 'login_state.dart';

class LoginPage extends BaseStateless {
  LoginPage({Key? key}) : super(key: key, title: '');

  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;

  @override
  Color? get background => Colors.white;

  @override
  Widget? get leftItem => Container();

  @override
  Widget initBody(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Stack(children: [
            Positioned(
              top: ScreenUtil().statusBarHeight + 45.w,
              left: 15.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: '您好,',
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500),
                  ),
                  BaseText(
                    text: '欢迎来到中国工商银行',
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 110.w + ScreenUtil().statusBarHeight + 45.w, // 调整垂直位置
              left: 20.w, // 调整水平位置
              right: 20.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BaseText(
                        text: '+86',
                        fontSize: 16.sp,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Image(
                        image: 'arr_dow'.png3x,
                        width: 12.w,
                        height: 12.w,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      TextField(
                        controller: state.phoneTextController,
                        decoration: InputDecoration(
                          border: InputBorder.none, // 隐藏边框
                          hintText: '请输入手机号',
                          hintStyle: TextStyle(
                            color: Color(0xff999999), // 设置提示文字颜色
                            fontSize: 16.0, // 可选：调整字体大小
                          ),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ).expanded(),
                      Image(
                        image: 'ic_jt_bottom'.png3x,
                        width: 25.w,
                        height: 25.w,
                      )
                    ],
                  ),
                  Divider(
                    color: Color(0x668C8C8C),
                    height: 1,
                    thickness: 1,
                  ),

                  SizedBox(
                    height: 40.w,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      children: [
                        WidgetSpan(
                            child: Obx(() => Image(
                              image:logic.tag1.value?'a_check'.png3x:'a_un_check'.png3x,
                              width: 16.w,
                              height: 16.w,
                            ).withContainer(
                              padding: EdgeInsets.only(right: 12.w),
                              onTap: (){
                                logic.tag1.value = !logic.tag1.value;
                              }
                            )),
                            alignment: PlaceholderAlignment.middle),
                        TextSpan(
                            text: '我已阅读并同意',
                            style: TextStyle(
                              color: const Color(0xff6A6A6A),
                              fontSize: 13.sp,
                            )),
                        TextSpan(
                          text: '《电子银行个人客户服务协议》\n',
                          style: TextStyle(
                            color: Color(0xff4C75C4),
                            fontSize: 13.sp,
                          ),
                        ),
                        TextSpan(
                          text: '《工银融e行个人信息保护政策》',
                          style: TextStyle(
                            color: Color(0xff4C75C4),
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12.w,),

                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      children: [
                        WidgetSpan(
                            child: Obx(() => Image(
                                  image: logic.tag2.value?'a_check'.png3x:'a_un_check'.png3x,
                                  width: 16.w,
                                  height: 16.w,
                                ).withContainer(
                                padding: EdgeInsets.only(right: 12.w),
                                onTap: (){
                                  logic.tag2.value = !logic.tag2.value;
                                }
                            )),
                            alignment: PlaceholderAlignment.middle),
                        TextSpan(
                            text: '我已阅读',
                            style: TextStyle(
                              color: const Color(0xff6A6A6A),
                              fontSize: 13.sp,
                            )),
                        TextSpan(
                          text: '《信息接收授权书》',
                          style: TextStyle(
                            color: Color(0xff4C75C4),
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.w,),
                  SizedBox(
                    width: double.infinity, // 使按钮宽度和下划线一样长
                    height: 44.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            const Color(0xffCF0000)),
                        elevation: WidgetStateProperty.all(0),
                      ),
                      onPressed: () {
                        // 处理登录点击事件
                        if(state.phoneTextController.text == ''){
                          '请输入手机号'.showToast;
                          return;
                        }
                        if(!logic.tag1.value || !logic.tag2.value){
                          '请阅读并同意协议'.showToast;
                          return;
                        }
                        Get.to(() => PasswordPage(), arguments: {
                          'phone': state.phoneTextController.text
                        });
                      },
                      child: Text('注册/登录',style: TextStyle(
                        fontSize: 18.sp
                      ),),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.w)),
                  // SizedBox(
                  //     width: double.infinity, // 使按钮宽度和下划线一样长
                  //     height: 20.w,
                  //     child: Text(
                  //       textAlign: TextAlign.center,
                  //       "切换登录方式  ｜  登录帮助",
                  //       style: TextStyle(color: Color(0xff6B6B6B), fontSize: 15.sp),
                  //     )), // 调整按钮与其他内容之间的间距
                ],
              ),
            ),
          ])),
    );
  }
}
