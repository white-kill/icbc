import 'package:cbc/config/abc_config/cbc_logic.dart';
import 'package:cbc/pages/other/fixed_nav/fixed_nav_view.dart';
import 'package:cbc/pages/tabs/home/account/transfer/component/transfer_contacts_widget.dart';
import 'package:cbc/pages/tabs/home/account/transfer/other_transfer/other_transfer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../routes/app_pages.dart';
import '../contacts_list/contants_list_view.dart';
import '../receipt_verify/receipt_verify_view.dart';

class TransferFunctionWidget extends StatefulWidget {
  const TransferFunctionWidget({super.key});

  @override
  State<TransferFunctionWidget> createState() => _TransferFunctionWidgetState();
}

class _TransferFunctionWidgetState extends State<TransferFunctionWidget> {
  List titleName = [
    '语音转账',
    '预约转账',
    '他行转入',
    '资金归集',
    '手机号转账',
    '汇款明细',
    '电子回单',
    '转账限额',
    '安全中心',
    '我的收款人',
  ];

  void jumpPage(String name) {
    if (name == '语音转账') {
      '为了实现使用音频U盾、语音搜索等服务，请您允许中国工商银行获取麦克风权限。\n'.dialog(
          title: '温馨提示',
          cancelText: '下次再说',
          sureText: '允许',
          contentAlign: TextAlign.start,
          contentStyle: const TextStyle(height: 1.5, color: Color(0xff666666)));
    }
    if (name == '预约转账') {
      Get.to(() => FixedNavPage(),arguments: {
        'image':'bg_yyzh',
        'title':'预约转账',
        'background':Colors.white,
        'rightWidget':const BaseText(text: '查询更多',color: Color(0xFF607483),fontSize: 15,),
      });
    }
    if (name == '他行转入') {
      Get.to(() => OtherTransferView());
    }
    if (name == '资金归集') {
      Get.to(() => FixedNavPage(),arguments: {
        'image':'bg_zjgj',
        'title':'我的资金自动归集',
        'background':Color(0xffF3F3F3),
        'right':true,
      });
    }
    if (name == '手机号转账') {
      Get.toNamed(Routes.cardTransferPage,arguments: {
        'phoneTransfer':true,
      });
    }
    if (name == '汇款明细') {
      Routes.huiKuanPage.push;
    }
    if (name == '电子回单') {
      Get.to(() => ReceiptVerifyPage());
      // Get.to(() => FixedNavPage(),arguments: {
      //   'image':'bg_dzhd',
      //   'title':'电子回单',
      //   'background':Color(0xffF3F3F3),
      //   'right':true,
      // });
    }
    if (name == '转账限额') {
      Get.to(() => FixedNavPage(),arguments: {
        'image':'bg_zzxe',
        'title':'转账限额',
        'background':Color(0xffF3F3F3),
        'right':true,
      });
    }
    if (name == '安全中心') {
      Routes.safeCenter.push;
    }
    if (name == '我的收款人') {
      Get.to(() => ContactsListPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.only(top: 20.w, left: 15.w, right: 15.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.w))),
      child: VerticalGridView(
        padding: EdgeInsets.only(left: 5.w, right: 5.w),
        widgetBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: 'ic_t_$index'.png3x,
                width: 30.w,
                height: 30.w,
              ),
              BaseText(
                text: titleName[index],
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff0F0F0F)),
              ),
            ],
          ).withOnTap(onTap: () => jumpPage(titleName[index]));
        },
        itemCount: titleName.length,
        mainHeight: 80.w,
        crossSpacing: 5.w,
        crossCount: 5,
        spacing: 0.w,
      ),
    );
    ;
  }
}
