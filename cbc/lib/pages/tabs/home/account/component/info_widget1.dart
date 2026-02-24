import 'package:cbc/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class InfoWidget1 extends StatefulWidget {
  const InfoWidget1({super.key});

  @override
  State<InfoWidget1> createState() => _InfoWidget1State();
}

class _InfoWidget1State extends State<InfoWidget1> {
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
          BaseText(text: '人民币余额',style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff333333),
            fontSize: 14.sp
          ),),
          BaseText(text: AppConfig.config.abcLogic.balance(),style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff333333),
              fontSize: 16.sp
          )),
        ],
      ),
    );
  }
}
