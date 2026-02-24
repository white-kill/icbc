import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/component/count_down_btn.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/app_config.dart';
import '../../../../../utils/abc_button.dart';
import '../../../../../utils/color_util.dart';
import '../../../../../utils/local_notifications.dart';
import 'auth_way.dart';

class AuthSm extends StatefulWidget {
  final bool ck;
  final Function callBack;
  const AuthSm({super.key, required this.ck, required this.callBack});

  @override
  State<AuthSm> createState() => _AuthSmState();
}

class _AuthSmState extends State<AuthSm> {


  CountDownBtnController downBtnController = CountDownBtnController();

  String code = Random().nextVerificationCode(6);
  String name =  AppConfig.config.abcLogic.memberInfo.realName.removeFirstChar1();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds:800),(){
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
      height: 150.w + 70.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(4.w),
        ),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.clear,
                size: 24.w,
                color: Colors.grey,
              )
                  .withOnTap(onTap: () {
                SmartDialog.dismiss();
              })
                  .withContainer(alignment: Alignment.centerLeft)
                  .expanded(),
              BaseText(
                text: '卡密认证',
                fontSize: 16.sp,
                textAlign: TextAlign.center,
              ).expanded(),
              BaseText(
                text: '切换认证方式',
                fontSize: 12.sp,
                color: BColors.blueColor,
              ).withContainer(
                  alignment: Alignment.centerRight,
                  onTap: (){
                    SmartDialog.dismiss().then((v){
                      AlterWidget.alterWidget(builder: (context) {
                        return  AuthWay(ck:widget.ck,fs: false,
                          callBack: widget.callBack,
                        );
                      });
                    });
                  }
              ).expanded(),
            ],
          ).withPadding(
            top: 12.w,
          ),
          SizedBox(
            height: 20.w,
          ),

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
              widget.callBack();
            },
            margin: EdgeInsets.only(left: 24.w, right: 24.w,bottom: 24.w),
          ),
        ],
      ).withPadding(left: 15.w, right: 15.w),
    );
  }
}
