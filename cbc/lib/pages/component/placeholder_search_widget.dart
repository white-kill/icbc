import 'package:card_swiper/card_swiper.dart';
import 'package:cbc/config/app_config.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:cbc/utils/scale_point_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../config/abc_config/cbc_logic.dart';

class PlaceholderSearchWidget extends StatefulWidget {
  final List<String> contentList;
  final Function? onTap;
  final Color? searchBgColor;
  final Color? color;
  final double? textSize;
  final Widget? leftWidget;
  final BoxBorder? border;

  const PlaceholderSearchWidget(
      {super.key,
      required this.contentList,
      this.onTap,
      this.searchBgColor,
      this.color,
      this.textSize,
      this.leftWidget,
      this.border});

  @override
  State<PlaceholderSearchWidget> createState() =>
      _PlaceholderSearchWidgetState();
}

class _PlaceholderSearchWidgetState extends State<PlaceholderSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 32.w,
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          widget.leftWidget ??
              GetBuilder(builder: (CbcLogic c){
                return Row(
                  children: [
                    Image(
                        image: 'nav_left_loc'.png3x,
                        width: 24.w,
                        height: 24.w,
                        color: widget.color ?? Colors.black),
                    BaseText(
                      text: c.memberInfo.city,
                      color: widget.color ?? Colors.black,
                      fontSize: 13.sp,
                    )
                  ],
                );
              },id: 'updateUI',),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                border: widget.border ??
                    Border.all(color: Colors.white, width: 1.w),
                borderRadius: BorderRadius.all(Radius.circular(20.w)),
                color: widget.searchBgColor ?? const Color(0xffEAF2FD)),
            padding: EdgeInsets.only(left: 10.w, right: 12.w),
            child: Row(
              children: [
                Image(
                  image: 'ic_nav_search'.png3x,
                  width: 24.w,
                  height: 24.w,
                ),
                Expanded(
                    child: Swiper(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 5.w),
                      child: BaseText(
                        text: widget.contentList[index],
                        fontSize: widget.textSize ?? 12.w,
                        color: Colors.black,
                      ),
                    );
                  },
                  itemCount: widget.contentList.length,
                  autoplay: widget.contentList.length > 1 ? true : false,
                ).withOnTap(onTap: () {
                  if (widget.onTap == null) {
                    Get.toNamed('/searchPage');
                  } else {
                    widget.onTap?.call();
                  }
                })),
                Image(
                  image: 'ic_nav_scan'.png3x,
                  width: 24.w,
                  height: 24.w,
                ).withOnTap(onTap: (){
                  Routes.qrScan.push;
                })
              ],
            ),
          )),
          SizedBox(
            width: 16.w,
          ),
          Row(
            children: [
              Image(image: 'right_kf'.png3x,
                      width: 24.w,
                      height: 24.w,
                      color: widget.color ?? Colors.black)
                  .withOnTap(onTap: () {
                Routes.mineService.push;
              }),
              SizedBox(
                width: 16.w,
              ),
              Image(
                  image: 'right_message'.png3x,
                  width: 24.w,
                  height: 24.w,
                  color: widget.color ?? Colors.black).withOnTap(onTap: () {
                Routes.messageCenter.push;
              }),
              SizedBox(
                width: 16.w,
              ),
              ScalePointWidget(
                icColor:widget.color ?? Colors.black,
                left: 100.w,
                dx: 40.w,
                dy: -10.w,
                width: 130.w,
              ).withPadding(right: 10.w,),
            ],
          ),
          SizedBox(
            width: 16.w,
          ),
        ],
      ),
    );
  }
}
