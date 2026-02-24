import 'dart:convert';

import 'package:cbc/config/abc_config/balance_eye_widget.dart';
import 'package:cbc/config/app_config.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../utils/long_press_five_seconds.dart';
import '../../../../../utils/sp_util.dart';

class WdInfo extends StatefulWidget {
  const WdInfo({super.key});

  @override
  State<WdInfo> createState() => _WdInfoState();
}

class _WdInfoState extends State<WdInfo> {
  List titleNames = [
    '账户',
    '开户行',
    '开户姓名',
    '网点号',
    '银行机构代码',
    '网点名称',
    '网点地址',
    '联系电话',
  ];

  String valueStr(String name) {
    if (name == '账户') return AppConfig.config.abcLogic.card1();
    if (name == '开户行') return '中国工商银行';
    if (name == '开户姓名') return AppConfig.config.abcLogic.memberInfo.realName;
    if (name == '网点号') return controller1.text;
    if (name == '银行机构代码') return controller2.text;
    if (name == '网点名称') return AppConfig.config.abcLogic.openOutlets();
    if (name == '网点地址') return controller3.text;
    if (name == '联系电话') return controller4.text;
    return '';
  }

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  void longWidget(){
    AlterWidget.alterWidget(clickMaskDismiss: false,builder: (context) {
      return Container(
        width: 1.sw,
        height: 1.sh,
        padding: EdgeInsets.only(bottom: 60.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 1.sw * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6.w))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 12.w,),
                  BaseText(text: '编辑信息',style: TextStyle(
                      fontSize: 15.w
                  ),),
                  SizedBox(height: 8.w,),
                  TextFieldWidget(
                    hintText: '请输入网点号',
                    controller: controller1,
                  ).withContainer(
                      margin: EdgeInsets.only(left: 12.w,right: 12.w),
                      padding: EdgeInsets.only(left: 12.w),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffdedede),
                              width: 0.5.w
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4.w))
                      )
                  ),
                  SizedBox(height: 10.w,),
                  TextFieldWidget(
                    hintText: '请输入银行机构代码',
                    controller: controller2,
                  ).withContainer(
                      margin: EdgeInsets.only(left: 12.w,right: 12.w),
                      padding: EdgeInsets.only(left: 12.w),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffdedede),
                              width: 0.5.w
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4.w))
                      )
                  ),
                  SizedBox(height: 10.w,),
                  TextFieldWidget(
                    hintText: '请输入网点地址',
                    controller: controller3,
                  ).withContainer(
                      margin: EdgeInsets.only(left: 12.w,right: 12.w),
                      padding: EdgeInsets.only(left: 12.w),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffdedede),
                              width: 0.5.w
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4.w))
                      )
                  ),
                  SizedBox(height: 10.w,),
                  TextFieldWidget(
                    hintText: '请输入联系电话',
                    controller: controller4,
                  ).withContainer(
                      margin: EdgeInsets.only(left: 12.w,right: 12.w),
                      padding: EdgeInsets.only(left: 12.w),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffdedede),
                              width: 0.5.w
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4.w))
                      )
                  ),
                  SizedBox(height: 10.w,),
                  Container(
                    width: 1.sw * 0.88,
                    height: 0.5.w,
                    color: const Color(0xffbbbbab),
                  ),
                  SizedBox(
                    height: 46.w,
                    width: 1.sw * 0.8,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: BaseText(
                                text: '取消',
                                fontSize: 16.sp,
                                color: Color(0xFF666666),
                              ),
                            ).withOnTap(onTap: () {
                              SmartDialog.dismiss();
                            })),
                        Container(
                          width: 0.5.w,
                          height: 42.w,
                          color: const Color(0xffbbbbab),
                        ),
                        Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: BaseText(
                                text: '确定',
                                fontSize: 16.sp,
                                color: BColors.mainColor,
                              ),
                            ).withOnTap(onTap: () {
                              Map<String,dynamic> data = {
                                'c1':controller1.text,
                                'c2':controller2.text,
                                'c3':controller3.text,
                                'c4':controller4.text,
                              };
                              String d = json.encode(data);
                              d.saveEditKhwd;
                              setState(() {});
                              SmartDialog.dismiss();
                            })),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    String content = editKhwdContent;
    if(content != ''){
      Map<String, dynamic> map = json.decode(content);
      controller1.text = map['c1']??'';
      controller2.text = map['c2']??'';
      controller3.text = map['c3']??'';
      controller4.text = map['c4']??'';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 1.sw * 0.88,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.w))),
            child: Column(
              children: [

                LongPressFiveSeconds(
                    child: Container(
                      height: 45.w,
                      alignment: Alignment.center,
                      child: BaseText(
                        text: '开户网点',
                        fontSize: 15.sp,
                      ),
                    ),
                    onLongPressCompleted: () {
                      longWidget();
                    }),
                Container(
                  width: 345.w,
                  height: 0.8.w,
                  color: const Color(0xffE9E9E9),
                ),
                SizedBox(
                  height: 20.w,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: 6.w,bottom: 6.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(
                              text: titleNames[index],
                              textAlign: TextAlign.end,
                              color: Color(0xff999999),
                            ).withContainer(width: 100.w),
                            SizedBox(
                              width: 10.w,
                            ),
                            titleNames[index] == '联系电话'
                                ? Row(
                              children: [
                                BaseText(
                                  text: valueStr(titleNames[index]),
                                  color: Color(0xff333333),
                                  maxLines: 10,),
                                Image(
                                  image: 'wd_phone'.png,
                                  width: 18.w,
                                  height: 18.w,
                                ).withPadding(
                                    top: 2.w
                                )
                              ],
                            ): BaseText(
                              text: valueStr(titleNames[index]),
                              color: Color(0xff333333),
                              maxLines: 10,).withContainer(
                                width: 200.w
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: titleNames.length),

                SizedBox(height: 15.w,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image(image: 'wd_shear'.png,width: 42.w,height: 42.w,),
                        SizedBox(height: 4.w,),
                        BaseText(text: '分享',color: Color(0xff999999),)
                      ],
                    ),

                    Column(
                      children: [
                        Image(image: 'wd_coyp'.png,width: 42.w,height: 42.w,),
                        SizedBox(height: 4.w,),
                        BaseText(text: '复制',color: Color(0xff999999),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15.w,),

                Container(
                  height: 32.w,
                  margin: EdgeInsets.only(left: 8.w,right: 8.w),
                  padding: EdgeInsets.only(left: 6.w),
                  decoration: BoxDecoration(
                      color: Color(0xffdedede).withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(4.w))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(text: '可以查询您的收汇信息融、需要查询点这里',fontSize: 12.sp,color: Colors.blueAccent,),
                      Image(image: 'ic_jt_right'.png3x,width: 20.w,height: 20.w,),
                    ],
                  ),
                ),
                SizedBox(height: 6.w,),
                Container(
                  width: 345.w,
                  height: 0.8.w,
                  color: const Color(0xffE9E9E9),
                ),
                Container(
                  height: 45.w,
                  alignment: Alignment.center,
                  child: BaseText(
                    text: '取消',
                    fontSize: 15.sp,
                    color: BColors.mainColor,
                  ),
                ).withOnTap(onTap: (){
                  SmartDialog.dismiss();
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
