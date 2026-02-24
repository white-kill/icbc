import 'package:cbc/config/abc_config/balance_eye_widget.dart';
import 'package:cbc/config/abc_config/cbc_logic.dart';
import 'package:cbc/pages/index/index_logic.dart';
import 'package:cbc/pages/tabs/home/account/account_detail/account_detail_view.dart';
import 'package:cbc/pages/tabs/home/account/component/wd_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../other/fixed_nav/fixed_nav_view.dart';
import '../transfer/transfer_view.dart';
import 'copy_card.dart';
import 'kh_wd.dart';

class InfoWidget2 extends StatefulWidget {
  const InfoWidget2({super.key});

  @override
  State<InfoWidget2> createState() => _InfoWidget2State();
}

class _InfoWidget2State extends State<InfoWidget2> {
  List titleName = [
    // '查询明细',
    // '复制卡号',
    // '账户挂失',
    // '开户网点',
    // '密码管理',
    // '工银信使',
    // '投资理财',
    // '转账汇款',

    '查询明细',
    '转账汇款',
    '复制卡号',
    '账户挂失',
    '开户网点',
    '密码管理',
    '工银信使',
    '投资理财',

  ];


  void jumpPage(String name) async{
    if(name == '查询明细'){
      Get.to(() => AccountDetailPage());
    }
    if(name == '转账汇款'){
      Get.to(() => TransferPage());
    }
    if(name == '复制卡号'){
      ''.showLoading1;
      await Future.delayed(const Duration(seconds: 1));
      await SmartDialog.dismiss(status: SmartStatus.loading);
      AlterWidget.alterWidget(builder: (context) {
        return const CopyCard();
      });
    }
    if(name == '开户网点'){
      ''.showLoading1;
      await Future.delayed(const Duration(seconds: 1));
      await SmartDialog.dismiss(status: SmartStatus.loading);
      AlterWidget.alterWidget(builder: (context) {
        return  KhWd(callBack: (){
          SmartDialog.dismiss().then((_) async {
            AlterWidget.alterWidget(builder: (context) {
              return const WdInfo();
            });
          });
        },);
      });
    }
    if(name == '投资理财'){
      Get.offAllNamed(Routes.tabs);
      Get.put(IndexLogic()).selectIndex(2);
    }

    if(name == '工银信使'){
      ''.showLoading1;
      await Future.delayed(const Duration(seconds: 1));
      await SmartDialog.dismiss(status: SmartStatus.loading);
      Get.to(() => FixedNavPage(),arguments: {
        'image':'zh_gyxs',
        'title':'工银信使',
        'right':true
      });
    }

    if(name == '账户挂失') {
      Get.to(() => FixedNavPage(), arguments: {
        'image': 'bg_zhgs',
        'title': '账户挂失',
        'right': true
      });
    }
      if(name == '密码管理') {
        Get.to(() => FixedNavPage(), arguments: {
          'image': 'bg_jjkmm',
          'title': '密码管理',
          'right': true
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: VerticalGridView(
        widgetBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: 'ic_ac_if$index'.png3x,
                width: 40.w,
                height: 40.w,
              ),
              BaseText(text: titleName[index]),
            ],
          ).withOnTap(onTap: () => jumpPage(titleName[index]));
        },
        itemCount: titleName.length,
        mainHeight: 90.w,
        crossSpacing: 5.w,
        spacing: 0.w,
      ),
    );
  }
}
