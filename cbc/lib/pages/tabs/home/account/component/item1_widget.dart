import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../other/fixed_nav/fixed_nav_view.dart';

class Item1Widget extends StatefulWidget {
  const Item1Widget({super.key});

  @override
  State<Item1Widget> createState() => _Item1WidgetState();
}

class _Item1WidgetState extends State<Item1Widget> {

  bool showAll = false;
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
                    image: 'ic_wd_jw'.png3x,
                    width: 26.w,
                    height: 26.w,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  BaseText(
                    text: "境外账户",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
                ],
              ),
              Image(
                image: showAll?'ic_jt_top'.png3x:'ic_jt_bottom'.png3x,
                width: 25.w,
                height: 25.w,
              )
            ],
          ).withPadding(bottom: 16.w).withOnTap(onTap: (){
            showAll = !showAll;
            setState(() {});
          }),
          !showAll?const SizedBox.shrink():Column(
            children: [
              Container(
                width: 315.w,
                height: 0.5.w,
                color: Color(0xffE6E6E6),
              ),

              SizedBox(height: 25.w,),
              Container(
                width: 315.w,
                height: 40.w,
                decoration: BoxDecoration(
                    color: Color(0xffFFF2F2),
                    border: Border.all(color: Color(0xffF9BCBC), width: 1.w),
                    borderRadius: BorderRadius.all(Radius.circular(6.w))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Color(0xffEC1414),
                    ),
                    BaseText(
                      text: '添加本人境外工行账户',
                      style: TextStyle(
                          color: Color(0xffEC1414),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ).withOnTap(onTap: (){
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context:context,
                  builder: (context) {
                    return Column(
                      children: [
                        Container(
                          width: 1.sw,
                          height: 45.w,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15.w,right: 15.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(6.w))
                          ),
                          child: BaseText(text: '工亚银行',color: Colors.blueAccent,),
                        ).withOnTap(onTap: (){
                          Get.back();
                          Get.to(() => FixedNavPage(),arguments: {
                            'image':'bg_gyyh',
                            'title':'添加工银亚洲账户',
                            'top':8.w,
                            'background':Color(0xffF3F3F3),
                            'right':true,
                          });
                        }),

                        SizedBox(height: 16.w,),
                        Container(
                          width: 1.sw,
                          height: 45.w,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15.w,right: 15.w),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(6.w))
                          ),
                          child: BaseText(text: '关闭'),
                        ).withOnTap(onTap:(){
                          Get.back();
                        })
                      ],
                    ).withContainer(
                      height: 160.w,
                      color: Colors.transparent
                    );
                  },
                );
              })
            ],
          ).withPadding(bottom: 27.w)
        ],
      ),
    );
  }
}
