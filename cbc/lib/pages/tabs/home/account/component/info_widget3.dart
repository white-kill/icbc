import 'package:cbc/config/app_config.dart';
import 'package:cbc/pages/tabs/home/account/add_bank_card/add_bank_card_view.dart';
import 'package:cbc/pages/tabs/home/account/component/setting_nick.dart';
import 'package:cbc/pages/tabs/home/account/dangmian/dangmian_view.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../utils/color_util.dart';
import '../../../../../utils/sp_util.dart';
import '../../../../other/fixed_nav/fixed_nav_view.dart';
import '../../../../other/sheet_widget/sheet_bottom.dart';
import 'kh_wd.dart';

class InfoWidget3 extends StatefulWidget {
  const InfoWidget3({super.key});

  @override
  State<InfoWidget3> createState() => _InfoWidget3State();
}

class _InfoWidget3State extends State<InfoWidget3> {

  List titleName = [
    '基本账户',
    '启用日期',
    '到期日期',
    '账户互转',
    '设置别名',
    '转入资金',
    '转出资金',
    '绑手机号',
    '绑定卡',
    '当面收款',
  ];

  String valueText(int index){
    if(index == 0) return AppConfig.config.abcLogic.phone(prefixLen: 4, suffixLen: 4);
    if(index == 4) return nickNameValue == ''?'此卡别名':nickNameValue;
    if(index == 1) return formatDate(AppConfig.config.abcLogic.memberInfo.openTime);
    // if(index == 6) return AppConfig.config.abcLogic.phone();
    if(index == 2) {
      return SimpleSpringFestival.calculate(AppConfig.config.abcLogic.memberInfo.openTime);
    }
    return '';
  }
  String formatDate(String dateString) {
    return dateString.replaceAllMapped(
        RegExp(r'^(\d{4})-(\d{2})-(\d{2})$'),
            (Match m) => '${m[1]}年${m[2]}月${m[3]}日'
    );
  }



  String nickName = '';

  Widget _copyWidget(){
    return Container(
      width: 1.sw * 0.75,
      height: 160.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.w))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseText(
                      text: '完整卡号',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6.w,
                    ),
                    BaseText(text: AppConfig.config.abcLogic.card1()),
                  ],
                ),
              )),
          Container(
            width: 1.sw,
            height: 1.w,
            color: const Color(0xffE7E9EB),
          ),
          Row(
            children: [
              Container(
                height: 45.w,
                alignment: Alignment.center,
                child: BaseText(
                  text: '取消',
                  color:Color(0xff9999999),
                ),
              ).withOnTap(onTap: (){
                SmartDialog.dismiss();
              }).expanded(),

              Container(
                height: 45.w,
                alignment: Alignment.center,
                child: BaseText(
                  text: '复制卡号',
                  color: BColors.mainColor,
                ),
              ).withOnTap(onTap: (){
                ClipboardData(text: AppConfig.config.abcLogic.card1());
                SmartDialog.dismiss();
              }).expanded()
            ],
          )
        ],
      ),
    );
  }

  void jumpPage(String name){
    if(name == '基本账户'){
      AlterWidget.alterWidget(builder: (context) {
        return  KhWd(callBack: (){
          SmartDialog.dismiss().then((_) async {
            AlterWidget.alterWidget(builder: (context) {
              return _copyWidget();
            });
          });
        },);
      });
    }
    if(name == '启用日期'){
      // 启用日期仅用于显示，无跳转
      return;
    }
    if(name == '到期日期'){
      // 到期日期仅用于显示，无跳转
      return;
    }
    if(name == '账户互转'){
      Routes.registerTransferPage.push;
    }
    if(name == '设置别名'){
      SheetBottom.show(
        title: '设置别名',
        leftWidget: Icon(
          Icons.clear,
          size: 24.w,
          color: const Color(0xff666666),
        ),
        sureCallBack: (){
          nickName.saveSettingNickName;
          setState(() {});
        },
        rightWidget: const BaseText(text: '保存',color: BColors.mainColor,),
        child: SettingNick(
          callback: (String value){
            nickName = value;
          },
        ),
      );
    }
    if(name == '转入资金'){
      // 跳转到境内汇款页面
      Routes.cardTransferPage.push;
    }
    if(name == '转出资金'){
      // 跳转到境内汇款页面
      Routes.cardTransferPage.push;
    }
    if(name == '绑手机号'){
      Get.to(() => FixedNavPage(),arguments: {
        'image':'bg_bdsj',
        'title':'绑定手机号收款',
        // 'top':8.w,
        'background':Colors.white,
        'right':true,
      });
    }
    if(name == '绑定卡'){
      // 跳转到添加银行卡页面
      // Get.to(() => AddBankCardPage());
    }
    if(name == '当面收款'){
      Get.to(() => DangmianPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.w,right: 15.w),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 52.w,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                BaseText(text: titleName[index],style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff333333)
                ),),


                Row(
                  children: [

                    BaseText(text: valueText(index),
                      fontSize: 14.sp,
                      color: index == 3?const Color(0XFF999999):const Color(0XFF333333),
                    ),
                    if(index !=1 && index != 2)
                    Image(image: 'ic_jt_right'.png3x,width: 25.w,height: 25.w,)
                  ],
                )
              ],
            ),
          ).withOnTap(onTap:() => jumpPage(titleName[index]));
        },
        itemCount: titleName.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: 345.w,
            height: 0.5.w,
            margin: EdgeInsets.only(left: 15.w),
            color: const Color(0xffEFEFEF),
          );
        }, //state.list.length,
      ),
    );
  }
}

class SimpleSpringFestival {
  static final Map<int, String> _springFestivalData = {
    2023: "2023年01月",
    2024: "2024年02月",
    2025: "2025年01月",
    2026: "2026年02月",
    2027: "2027年02月",
    2028: "2028年01月",
    2029: "2029年02月",
    2030: "2030年02月",
    2031: "2031年01月",
    2032: "2032年02月",
    2033: "2033年01月",
    2034: "2034年02月",
    2035: "2035年02月",
  };

  /// 简化版本：传入日期和年数，返回春节年月
  static String calculate(String dateString, {int years = 10}) {
    try {
      DateTime inputDate = DateTime.parse(dateString);
      int targetYear = inputDate.year + years;

      return _springFestivalData[targetYear] ?? '$targetYear年${_getDefaultMonth(targetYear)}月';
    } catch (e) {
      return '日期格式错误';
    }
  }

  static String _getDefaultMonth(int year) {
    return (year % 2 == 0) ? '02' : '01';
  }
}
