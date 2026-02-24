import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RectSwiperPlugin extends SwiperPlugin {
  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    List<Widget> pos = List.generate(
      config.itemCount,
      (index) {
        if (config.activeIndex == index) {
          return Container(
            width: 10.w,
            height: 3.w,
            margin: EdgeInsets.only(left: 2.5.w),
            decoration: BoxDecoration(
              color: const Color(0xFFCF0000),
              borderRadius: BorderRadius.circular(2.w),
            ),
          );
        }
        return Container(
          width: 4.5.w,
          height: 4.5.w,
          margin: EdgeInsets.only(left: 2.5.w),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(3.w),
          ),
        );
      },
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: pos,
    );
  }
}
