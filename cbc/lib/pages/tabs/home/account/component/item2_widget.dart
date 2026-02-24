import 'package:cbc/pages/tabs/home/account/add_bank_card/add_bank_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class Item2Widget extends StatefulWidget {
  const Item2Widget({super.key});

  @override
  State<Item2Widget> createState() => _Item2WidgetState();
}

class _Item2WidgetState extends State<Item2Widget> {
  bool showAll = true;

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
                    image: 'ic_wd_tj'.png3x,
                    width: 26.w,
                    height: 26.w,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  BaseText(
                    text: "待添加卡",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
                ],
              ),
              Image(
                image: showAll?'ic_jt_top'.png3x:'ic_jt_bottom'.png3x,
                width: 25.w,
                height: 25.w,
              ).withOnTap(onTap: (){
                showAll = !showAll;
                setState(() {});
              }),
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
                      text: '添加本人其他银行卡',
                      style: TextStyle(
                          color: Color(0xffEC1414),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ).withOnTap(onTap: (){
                      Get.to(() => AddBankCardPage());
                    })
                  ],
                ),
              ),

              BaseText(text: '添加家庭账户',fontSize: 15.sp,color: Color(0xff3C76C9),).withPadding(
                  top: 14.w,bottom: 16.w
              ),
            ],
          ),


        ],
      ),
    );
  }
}
