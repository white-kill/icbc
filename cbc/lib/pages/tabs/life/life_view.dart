import 'package:card_swiper/card_swiper.dart';
import 'package:cbc/pages/component/placeholder_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../routes/app_pages.dart';
import 'life_logic.dart';
import 'life_state.dart';

class LifePage extends BaseStateless {
  LifePage({super.key});

  final LifeLogic logic = Get.put(LifeLogic());
  final LifeState state = Get.find<LifeLogic>().state;

  @override
  double? get lefItemWidth => 0;

  @override
  Widget? get leftItem => Container();

  @override
  Widget? get titleWidget => Obx(() => PlaceholderSearchWidget(
        contentList: const ['账单', '优惠活动', '明细查询'],
        searchBgColor: const Color(0xffEAF2FD).withOpacity(0.4),
        color: logic.navActionColor.value,
      ));

  @override
  bool get isChangeNav => true;

  @override
  Color? get navColor => Colors.white;

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
        logic.navActionColor.value = v ? Colors.black : Colors.white;
      };

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: const Color(0xFFF4F5F7),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: double.infinity,
            height: 378.w,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 375.w,
                    height: 242.w,
                    child: Swiper(
                      itemCount: 2,
                      loop: true,
                      autoplay: true,
                      autoplayDelay: 4000,
                      duration: 400,
                      itemBuilder: (BuildContext context, int index) {
                        return Image(
                          image: 'img_life_banner$index'.png3x,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 15.w,
                  bottom: 8.w,
                  child: Stack(
                    children: [
                      Image(
                        image: 'bg_life_cate'.png3x,
                        width: 345.w,
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 70.w,
                          height: 70.w,
                        ).withOnTap(onTap: ()=>Routes.gyidly.push),
                      ),
                      Positioned(
                        top: 0,
                        left: 70.w,
                        child: Container(
                          width: 70.w,
                          height: 70.w,
                        ).withOnTap(onTap: ()=>Routes.gxag.push),
                      ),
                      Positioned(
                        top: 0,
                        left: (70+70).w,
                        child: Container(
                          width: 70.w,
                          height: 70.w,
                        ).withOnTap(onTap: ()=>Routes.personalLevel.push),
                      ),
                      Positioned(
                        top: 0,
                        left: (70+70+70).w,
                        child: Container(
                          width: 70.w,
                          height: 70.w,
                        ).withOnTap(onTap: ()=>Routes.bcwd.push),
                      ),
                      Positioned(
                        top: 0,
                        left: (70+70+70+70).w,
                        child: Container(
                          width: 70.w,
                          height: 70.w,
                        ).withOnTap(onTap: ()=>Routes.gongYinIDou.push),
                      ),
                      Positioned(
                        top: 85.w,
                        left: 0,
                        child: Container(
                          width: 70.w,
                          height: 70.w,
                        ).withOnTap(onTap: ()=>Routes.lifeFee.push),
                      ),
                      Positioned(
                        top: 85.w,
                        left: 70.w,
                        child: Container(
                          width: 70.w,
                          height: 70.w,
                        ).withOnTap(onTap: ()=>Routes.xmly.push),
                      ),
                      Positioned(
                        top: 85.w,
                        left: (70+70).w,
                        child: Container(
                          width: 70.w,
                          height: 70.w,
                        ).withOnTap(onTap: ()=>Routes.gyesb.push),
                      ),
                      Positioned(
                        top: 85.w,
                        left: (70+70+70).w,
                        child: Container(
                          width: 70.w,
                          height: 70.w,
                        ).withOnTap(onTap: ()=>Routes.mydy.push),
                      ),
                      Positioned(
                        top: 85.w,
                        left: (70+70+70+70).w,
                        child: Container(
                          width: 70.w,
                          height: 70.w,
                        ).withOnTap(onTap: ()=>Routes.sh_qb.push),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Stack(
              children: [
                Image(image: 'bg_life_bottom'.png3x),
                Positioned(
                  top: 5.w,
                  left: 14.w,
                  child: Container(
                    width: 350.w,
                    height: 200.w,
                  ).withOnTap(onTap: ()=>Routes.gyidsc5.push),
                ),
                Positioned(
                  top: 230.w,
                  left: 220.w,
                  child: Container(
                    width: 140.w,
                    height: 40.w,
                  ).withOnTap(onTap: ()=>Routes.gyidly.push),
                ),
                Positioned(
                  top: 280.w,
                  left: 24.w,
                  child: Container(
                    width: 160.w,
                    height: 180.w,
                  ).withOnTap(onTap: ()=>Routes.xxsc.push),
                ),
                Positioned(
                  top: 280.w,
                  left: 192.w,
                  child: Container(
                    width: 160.w,
                    height: 55.w,
                  ).withOnTap(onTap: ()=>Routes.dkesh.push),
                ),
                Positioned(
                  top: 344.w,
                  left: 192.w,
                  child: Container(
                    width: 160.w,
                    height: 55.w,
                  ).withOnTap(onTap: ()=>Routes.sjyl.push),
                ),
                Positioned(
                  top: 408.w,
                  left: 192.w,
                  child: Container(
                    width: 160.w,
                    height: 55.w,
                  ).withOnTap(onTap: ()=>Routes.tsyl.push),
                ),
                Positioned(
                  top: 490.w,
                  left: 16.w,
                  child: Container(
                    width: 344.w,
                    height: 211.w,
                  ).withOnTap(onTap: ()=>Routes.mydy.push),
                ),
                Positioned(
                  top: 720.w,
                  left: 16.w,
                  child: Container(
                    width: 170.w,
                    height: 180.w,
                  ).withOnTap(onTap: ()=>Routes.lifeFee.push),
                ),
                Positioned(
                  top: 760.w,
                  left: 190.w,
                  child: Container(
                    width: 170.w,
                    height: 60.w,
                  ).withOnTap(onTap: ()=>Routes.gyesb.push),
                ),
                Positioned(
                  top: 830.w,
                  left: 190.w,
                  child: Container(
                    width: 170.w,
                    height: 60.w,
                  ).withOnTap(onTap: ()=>Routes.oldAgePension.push),
                ),
                Positioned(
                  top: 958.w,
                  left: 16.w,
                  child: Container(
                    width: 345.w,
                    height: 3760.w,
                  ).withOnTap(onTap: ()=>Routes.gyidsc5.push),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
