import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/component/count_down_btn.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../config/app_config.dart';
import '../../../../../../utils/abc_button.dart';
import '../../../../../../utils/local_notifications.dart';


class CodeAlterWidget extends StatefulWidget {
  final Function sureCallBack;
  const CodeAlterWidget({super.key, required this.sureCallBack});

  @override
  State<CodeAlterWidget> createState() => _CodeAlterWidgetState();
}

class _CodeAlterWidgetState extends State<CodeAlterWidget> {

  CountDownBtnController downBtnController = CountDownBtnController();

  String formattedDate = '';
  String code = '';
  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();

    formattedDate = DateFormat('yy年MM月dd日HH:mm').format(now);
    code = Random().nextVerificationCode(6);
    String name =  AppConfig.config.abcLogic.memberInfo.realName.removeFirstChar1();
    Future.delayed(Duration(milliseconds: 800),(){
      downBtnController.click();

      NotificationHelper.getInstance().showNotification(
          title: "工商银行",
          body: "验证码:$code。尊敬的$name，"
              "您正在通过手机银行查看账户信息。"
              "为保护信息安全，"
              "请不要将验证码告诉他人(短信编号:${Random().nextVerificationCode(4)})【工商银行】",
          payload: "payload");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw * 0.88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.w),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Icon(Icons.clear,size: 22.w,color: Color(0xff666666),).withOnTap(onTap: (){
                SmartDialog.dismiss();
              }),
              BaseText(
                text: '短信认证',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),

              SizedBox(width:24.w),
            ],
          ).withPadding(left: 12.w,right: 12.w,top: 15.w,bottom: 15.w),

          Container(
            height: 45.w,
            margin: EdgeInsets.only(left: 12.w,right: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFieldWidget(
                  hintText: '请输入验证码',
                  hintStyle: TextStyle(
                    color: Color(0xff999999)
                  ),
                  textAlign: TextAlign.start,
                ).withContainer(
                  padding: EdgeInsets.only(left: 12.w),
                  width: 140.w,
                ),
                WzhCountDownBtn(
                  controller: downBtnController,
                  showBord: false,
                  textColor: Colors.black,
                  getVCode: () async {
                    Future.delayed(const Duration(milliseconds: 1500),(){
                      // NotificationHelper.getInstance().showNotification(
                      //     title: "95599",
                      //     body: "【中国农业银行】验证码$code，请不要告诉他人。"
                      //         "您于$formattedDate申请查看银行卡号，"
                      //         "如有疑问，请致电95599。", payload: "payload");
                    });

                    return true;
                  },
                ).withPadding(right: 12.w)
              ],
            ),
          ),
          
          Container(
            width: 1.sw,
            height: 0.8.w,
            padding: EdgeInsets.only(left: 8.w,right: 8.w),
            color: Color(0xffdedede),
          ),

          BaseText(
              text: '请输入${AppConfig.config.abcLogic.phone()}接收到的验证码(编号1411)',
            fontSize: 12.sp,
            color: Color(0xff666666),
          ).withContainer(
            width: 1.sw,
              padding: EdgeInsets.only(left: 12.w),
            alignment: Alignment.centerLeft
          ).withPadding(
              left: 12.w,right: 12.w,
            bottom: 15.w,top: 15.w,
          ),


          AbcButton(
            title: '确定',
            bgColor: Color(0xffF35855),
            fontSize: 17.sp,
            onTap: () {
              widget.sureCallBack.call();
            },
            margin: EdgeInsets.only(left: 24.w, right: 24.w,bottom: 24.w),
          ),
        ],
      ),
    );
  }
}
