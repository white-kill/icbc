import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../other/fixed_nav/fixed_nav_view.dart';

class Item4Widget extends StatefulWidget {
  const Item4Widget({super.key});

  @override
  State<Item4Widget> createState() => _Item4WidgetState();
}

class _Item4WidgetState extends State<Item4Widget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.w, right: 10.w, top: 15.w),
      margin: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                    image: 'ic_wd_tz'.png3x,
                    width: 26.w,
                    height: 26.w,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  BaseText(
                    text: "投资理财账户",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
                ],
              ),
              Image(
                image: 'ic_jt_right'.png3x,
                width: 25.w,
                height: 25.w,
              ),
            ],
          ).withPadding(bottom: 16.w).withOnTap(onTap: (){
            Get.to(() => FixedNavPage(),arguments: {
              'image':'bg_tzlczh',
              'top':8.w,
              'title':'投资理财账户',
              'background':Color(0xffF3F3F3),
              'right':true,
            });
          }),
        ],
      ),
    );
  }
}

