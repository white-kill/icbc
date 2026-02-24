import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/app_config.dart';
import '../../../../other/verification_box/verification_box.dart';

class KhWd extends StatefulWidget {
 final Function callBack;
  const KhWd({super.key, required this.callBack});

  @override
  State<KhWd> createState() => _KhWdState();
}

class _KhWdState extends State<KhWd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw * 0.88,
      height: 150.w + 70.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(4.w),
        ),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.clear,
                size: 24.w,
                color: Colors.grey,
              ).withOnTap(onTap: () {
                SmartDialog.dismiss();
              }).withContainer(alignment: Alignment.centerLeft).expanded(),
              BaseText(
                text: '卡密认证',
                fontSize: 16.sp,
                textAlign: TextAlign.center,
              ).expanded(),
              Container().expanded(),
            ],
          ).withPadding(
            top: 12.w,
          ),
          SizedBox(
            height: 20.w,
          ),
          BaseText(
            text: '请输入卡（${AppConfig.config.abcLogic.cardFour()}）的取款密码',
            fontSize: 12.sp,
            color: Color(0xff666666),
          ).withContainer(width: 1.sw, padding: EdgeInsets.only(left: 12.w)),
          SizedBox(
            height: 12.w,
          ),
          VerificationBox(
            count: 6,
            borderColor: Colors.grey,
            itemWidth: 45.w,
            itemHeight: 45.w,
            obscureText: true,
            // onSubmitted: (value) {
            //   SmartDialog.dismiss();
            // },
          ),
          Container(
            width: double.infinity,
            height: 45.w,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 12.w, right: 12.w),
            decoration: BoxDecoration(
              color: Color(0xffCF0000),
              borderRadius: BorderRadius.all(Radius.circular(6.w)),
            ),
            child: BaseText(text: "确定", color: Colors.white, fontSize: 14.sp),
          ).withOnTap(onTap: () {
            widget.callBack();
          })
        ],
      ).withPadding(left: 15.w, right: 15.w),
    );
  }
}
