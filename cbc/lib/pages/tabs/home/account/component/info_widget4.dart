import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../other/fixed_nav/fixed_nav_view.dart';

class InfoWidget4 extends StatefulWidget {
  const InfoWidget4({super.key});

  @override
  State<InfoWidget4> createState() => _InfoWidget4State();
}

class _InfoWidget4State extends State<InfoWidget4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.w,
      width: 1.sw,
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.w,right: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseText(text: '其他',style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff333333),
              fontSize: 14.sp
          ),),
          Image(image: 'ic_jt_right'.png3x,width: 25.w,height: 25.w,),
        ],
      ),
    ).withOnTap(onTap: (){
      Get.to(() => FixedNavPage(),arguments: {
        'image':'bg_other',
        'title':'其他操作',
        'top':8.w,
        'background':Color(0xffF3F3F3),
        'right':true,
      });
    });
  }
}
