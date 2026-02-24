import 'package:cbc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../../../other/fixed_nav/fixed_nav_view.dart';

class TransferTopWidget extends StatefulWidget {
  const TransferTopWidget({super.key});

  @override
  State<TransferTopWidget> createState() => _TransferTopWidgetState();
}

class _TransferTopWidgetState extends State<TransferTopWidget> {

  List titleName = [
  '注册账户转账',
  '境内汇款',
  '跨境汇款',
  ];

  String imgPath(int index){

    if(index == 0) return 'ic_zczz';
    if(index == 1) return 'ic_jrhc';
    if(index == 2) return 'ic_kjhh';
     return '';
  }

  void jumpPage(String name){
    if(name == '境内汇款'){
      Routes.cardTransferPage.push;
    }
    if(name == '注册账户转账'){
      Routes.registerTransferPage.push;
    }
    if(name == '跨境汇款'){
      Get.to(() => FixedNavPage(),arguments: {
        'image':'bg_kjhk',
        'title':'跨境汇款',
        'background':Colors.white,
        'right':true,
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 105.w,
      margin: EdgeInsets.only(top: 20.w,left: 15.w,right: 15.w),
      decoration: decorationImage('bg_transfer_top'),
      child: VerticalGridView(
        widgetBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: imgPath(index).png3x,
                width: 42.w,
                height: 42.w,
              ),
              BaseText(text: titleName[index],style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff0F0F0F)
              ),),
            ],
          ).withOnTap(onTap: () => jumpPage(titleName[index]));
        },
        itemCount: titleName.length,
        mainHeight: 105.w,
        crossSpacing: 5.w,
        crossCount: 3,
        spacing: 0.w,
      ),
    );
  }
}
