import 'package:cbc/config/abc_config/cbc_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class Item3Widget extends StatefulWidget {
  const Item3Widget({super.key});

  @override
  State<Item3Widget> createState() => _Item3WidgetState();
}

class _Item3WidgetState extends State<Item3Widget> {
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
                    image: 'ic_wd_sz'.png3x,
                    width: 26.w,
                    height: 26.w,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  BaseText(
                    text: "数字人民币",
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
                      text: '添加本人数字人民币钱包',
                      style: TextStyle(
                          color: Color(0xffEC1414),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ).withOnTap(onTap: (){
                '\n您还来开通数字人民币钱包，请前往数字人民币APP进行开通\n'.dialog(
                  cancelText: '回头再说',
                  sureText: '去开通',
                  contentStyle: TextStyle(
                    color: Color(0xff666666),
                    height: 1.5,
                  ),
                  contentAlign: TextAlign.start
                );
              })
            ],
          ).withPadding(bottom: 27.w)
        ],
      ),
    );
  }
}
