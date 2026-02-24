import 'package:card_swiper/card_swiper.dart';
import 'package:cbc/config/app_config.dart';
import 'package:cbc/pages/other/change_nav/change_nav_view.dart';
import 'package:cbc/pages/other/fixed_nav/fixed_nav_view.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/swiper_horizontal.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../component/placeholder_search_widget.dart';
import 'wealth_logic.dart';
import 'wealth_state.dart';

// 自定义点击检测器，不干扰滑动手势
class _TapDetector extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const _TapDetector({required this.child, required this.onTap});

  @override
  State<_TapDetector> createState() => _TapDetectorState();
}

class _TapDetectorState extends State<_TapDetector> {
  Offset? _downPosition;

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerDown: (event) {
        _downPosition = event.position;
      },
      onPointerUp: (event) {
        if (_downPosition != null) {
          final distance = (event.position - _downPosition!).distance;
          // 如果移动距离小于10像素，认为是点击
          if (distance < 10) {
            widget.onTap();
          }
        }
        _downPosition = null;
      },
      onPointerCancel: (event) {
        _downPosition = null;
      },
      child: widget.child,
    );
  }
}

class WealthPage extends BaseStateless {
  WealthPage({super.key});

  final WealthLogic logic = Get.put(WealthLogic());
  final WealthState state = Get.find<WealthLogic>().state;

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
    var safeHeight = MediaQuery.of(context).padding.top;
    return Container(
      color: const Color(0xFFF4F5F7),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Image(image: 'bg_wealth_1'.png3x),
                Positioned(
                  top: 258.w,
                  left: 25.w,
                  child: SizedBox(
                    height: 145.w,
                    width: 375.w - 50.w,
                    child: SwiperHorizontal(
                        itemCount: 2,
                        activeColor: Colors.transparent,
                        color: Colors.transparent,
                        widgetBuilder: (_, index) {
                          return Stack(
                            children: [   
                              Image(
                                image: 'wealth_main_swipe${index + 1}'.png,
                                width: 375.w - 50.w,
                                fit: BoxFit.fitWidth,
                              ),
                              // 第一行按钮
                              Positioned(
                                top: 1.w,
                                left: 0,
                                child: _TapDetector(
                                  onTap: () {
                              if (index == 0) {
                                Get.to(() => FixedNavPage(), arguments: {
                                  'imageList': ['fxpc'],
                                  'title': '风险能力评测',
                                  'right': true
                                });
                              }
                              else if (index == 1) {
                                Get.to(() => FixedNavPage(), arguments: {
                                  'imageList': ['zczd'],
                                  'title': '资产诊断',
                                  'right': true
                                });
                              }
                          },
                                  child: Container(
                                    height: 65.w,
                                    width: 65.w,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 1.w,
                                left: 65.w,
                                child: _TapDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(() => FixedNavPage(), arguments: {
                                        'image': 'ck',
                                        'title': '存款',
                                        'right': true
                                      });
                                    } else if (index == 1) {
                                      Get.to(() => FixedNavPage(), arguments: {
                                        'imageList': ['gtzq_1', 'gtzq_2'],
                                        'title': '柜台记账式债券',
                                        'right': true
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 65.w,
                                    width: 70.w,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 1.w,
                                left: 135.w,
                                child: _TapDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(() => FixedNavPage(), arguments: {
                                        'imageList': ['lc_1','lc_2'],
                                        'title': '理财',
                                        'right': true
                                      });
                                    } else if (index == 1) {
                                      Routes.realMetal.push;
                                    }
                                  },
                                  child: Container(
                                    height: 65.w,
                                    width: 70.w,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 1.w,
                                left: 205.w,
                                child: _TapDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(() => FixedNavPage(), arguments: {
                                        'imageList': ['jj_1','jj_2'],
                                        'title': '基金',
                                        'right': true
                                      });
                                    } else if (index == 1) {
                                      Routes.zhny.push;
                                    }
                                  },
                                  child: Container(
                                    height: 65.w,
                                    width: 70.w,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 1.w,
                                left: 275.w,
                                child: _TapDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(() => ChangeNavPage(), arguments: {
                                        'image': 'gjs',
                                        'title': '贵金属',
                                        'changeTitleColor': Colors.black,
                                        'defTitleColor': Colors.black,
                                        'navColor': Colors.white,
                                        'right': true,
                                      });
                                    } else if (index == 1) {
                                      Routes.zcgh.push;
                                    }
                                  },
                                  child: Container(
                                    height: 65.w,
                                    width: 60.w,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              // 第二行按钮
                              Positioned(
                                top: 66.w,
                                left: 0,
                                child: _TapDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(() => ChangeNavPage(), arguments: {
                                        'image': 'bx',
                                        'title': '保险',
                                        'changeTitleColor': Colors.transparent,
                                        'defTitleColor': Colors.white,
                                        'navColor': Colors.white,
                                        'right': false,
                                      });
                                    } else {
                                      Routes.cpxxcx.push;
                                    }
                                  },
                                  child: Container(
                                    height: 65.w,
                                    width: 65.w,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 66.w,
                                left: 65.w,
                                child: _TapDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(() => FixedNavPage(), arguments: {
                                        'imageList': ['jsh'],
                                        'title': '结售汇',
                                        'right': true
                                      });
                                    } else {
                                      Routes.whmm.push;
                                    }
                                  },
                                  child: Container(
                                    height: 65.w,
                                    width: 70.w,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 66.w,
                                left: 135.w,
                                child: _TapDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(() => FixedNavPage(), arguments: {
                                        'imageList': ['wbdh'],
                                        'title': '外币兑换',
                                        'right': true
                                      });
                                    } else {
                                      Routes.jcgjs.push;
                                    }
                                  },
                                  child: Container(
                                    height: 65.w,
                                    width: 70.w,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 66.w,
                                left: 205.w,
                                child: _TapDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(() => ChangeNavPage(), arguments: {
                                        'image': 'zq',
                                        'title': '证券',
                                        'changeTitleColor': Colors.black,
                                        'defTitleColor': Colors.black,
                                        'navColor': Colors.white,
                                        'right': true,
                                      });
                                    } else {
                                      Routes.zhwh.push;
                                    }
                                  },
                                  child: Container(
                                    height: 65.w,
                                    width: 70.w,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 66.w,
                                left: 275.w,
                                child: _TapDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(() => FixedNavPage(), arguments: {
                                        'image': 'cxgz',
                                        'title': '储蓄国债',
                                        'right': true
                                      });
                                    } else if (index == 1) {
                                      Routes.cf_gd.push;
                                    }
                                  },
                                  child: Container(
                                    height: 65.w,
                                    width: 60.w,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
                Positioned(
                  top: 203.w,
                  left: 14.w,
                  child: Container(
                    height: 35.w,
                    width: 345.w,
                  ).withOnTap(onTap: () => Routes.dayDayEarn.push),
                ),
                Positioned(
                  top: 92.w + safeHeight,
                  left: 43.5.w,
                  child: BaseText(
                    text: '我的投资资产(元)',
                    fontSize: 11.5.w,
                    color: const Color(0xFF666666),
                  ).withOnTap(
                    onTap: () {
                      logic.canSee.value = !logic.canSee.value;
                    },
                  ),
                ),
                Positioned(
                  top: 92.w + safeHeight,
                  left: 276.w,
                  child: BaseText(
                    text: '我的关注',
                    fontSize: 14.w,
                    color: const Color(0xFF8E5F1F),
                  ).withOnTap(onTap: () => Routes.mineFollow.push),
                ),
                Positioned(
                  top: 94.5.w + safeHeight,
                  left: 339.5.w,
                  child: Image(
                    image: 'icon_task_list_next'.png3x,
                    width: 6.w,
                    height: 15.w,
                  ).withOnTap(onTap: () => Routes.mineFollow.push),
                ),
                Positioned(
                  top: 132.5.w + safeHeight,
                  left: 44.5.w,
                  child: Obx(
                    () => BaseText(
                      text: logic.canSee.value ? '0.00' : '****',
                      color: const Color(0xFF373737),
                      fontSize: 28.w,
                    ),
                  ),
                ),
                Positioned(
                  top: 92.w + safeHeight,
                  left: 144.5.w,
                  child: Obx(
                    () => Image(
                      image: logic.canSee.value
                          ? 'ic_eye_open'.png3x
                          : 'ic_eye_close'.png3x,
                      width: 16.w,
                      height: 16.w,
                    ).withOnTap(
                      onTap: () {
                        logic.canSee.value = !logic.canSee.value;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 48.w,
            margin: EdgeInsets.only(top: 12.w, left: 15.w, right: 15.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11.w),
            ),
            child: Swiper(
              itemCount: 3,
              loop: true,
              autoplay: true,
              autoplayDelay: 4000,
              duration: 1500,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                Map<String, String> item = state.dataList[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 155.w,
                      child: Row(
                        children: [
                          BaseText(
                            text: item['col1']!,
                            fontSize: 12.w,
                          ),
                          Container(width: 6.w),
                          BaseText(
                            text: item['col2']!,
                            fontSize: 11.w,
                            color: item['col2']!.contains('+')
                                ? const Color(0xFFE02D2D)
                                : const Color(0xFF2A9765),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 155.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BaseText(
                            text: item['col3']!,
                            fontSize: 12.w,
                          ),
                          Container(width: 6.w),
                          BaseText(
                            text: item['col4']!,
                            fontSize: 11.w,
                            color: item['col4']!.contains('+')
                                ? const Color(0xFFE02D2D)
                                : const Color(0xFF2A9765),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ).withOnTap(onTap: () => Routes.zsxq.push),
          Obx(
            () => Container(
              width: 345.w,
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
                top: 12.w,
                bottom: 15.w,
              ),
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BaseText(
                          text: "财富精选",
                          style: TextStyle(
                            fontSize: 15.w,
                            color: const Color(0xFF373737),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        BaseText(
                          text: "更多精选 快来研选",
                          fontSize: 11.5.w,
                          color: const Color(0xFF757575),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.w),
                    child: Row(
                      children: [
                        _buildTab1("为您挑选", 0),
                        _buildTab1("随心快赎", 1),
                        _buildTab1("基金精选", 2),
                        _buildTab1("黄金投资", 3),
                      ],
                    ),
                  ),
                  Image(
                    image: "cf_1_t${state.t1Index.value}".png3x,
                    width: double.infinity,
                  ).withOnTap(onTap: () {
                    if (state.t1Index.value == 0) Routes.cfxb.push;
                    if (state.t1Index.value == 1) Routes.dayDayEarn.push;
                    if (state.t1Index.value == 2) Routes.jjxq.push;
                    if (state.t1Index.value == 3) Routes.jhj.push;
                  }),
                ],
              ),
            ),
          ),
          Obx(
            () => Container(
              width: 345.w,
              padding: EdgeInsets.only(
                left: 10.w,
                right: 10.w,
                top: 12.w,
                bottom: 15.w,
              ),
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BaseText(
                          text: "四笔钱",
                          style: TextStyle(
                            fontSize: 15.w,
                            color: const Color(0xFF373737),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        BaseText(
                          text: "",
                          fontSize: 11.5.w,
                          color: const Color(0xFF757575),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.w),
                    child: Row(
                      children: [
                        _buildTab2("灵活取用", 0),
                        _buildTab2("稳健回报", 1),
                        _buildTab2("进取投资", 2),
                        _buildTab2("保险保障", 3),
                      ],
                    ),
                  ),
                  Image(
                    image: "cf_2_t${state.t2Index.value}".png3x,
                    width: double.infinity,
                  ).withOnTap(onTap: () {
                    if (state.t2Index.value == 0) Routes.jjxq.push;
                    if (state.t2Index.value == 1) Routes.jjxq.push;
                    if (state.t2Index.value == 2) Routes.jjxq.push;
                    if (state.t2Index.value == 3) Routes.jjxq.push;
                  }),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 8.w),
            child: Stack(
              children: [
                Image(
                  image: 'cf_3'.png3x,
                  width: double.infinity,
                ),
                Positioned(
                  left: 24.w,
                  top: 50.w,
                  child: Container(
                    width: 327.w,
                    height: 74.w,
                  ).withOnTap(onTap: () => Routes.cfxb.push),
                ),
                Positioned(
                  left: 24.w,
                  top: 200.w,
                  child: Container(
                    width: 327.w,
                    height: 190.w,
                  ).withOnTap(onTap: () => Routes.mxjh.push),
                ),
                Positioned(
                  left: 24.w,
                  top: 460.w,
                  child: Container(
                    width: 327.w,
                    height: 230.w,
                  ).withOnTap(onTap: () => Routes.kcxq.push),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Image(
                  image: 'cf_4'.png3x,
                  width: double.infinity,
                ),
                Positioned(
                  left: 24.w,
                  top: 50.w,
                  child: Container(
                    width: 327.w,
                    height: 1340.w,
                  ).withOnTap(onTap: () => Routes.scrb.push),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.w),
        ],
      ),
    );
  }

  Widget _buildTab1(String title, int index) {
    return Container(
      width: 67.w,
      height: 24.w,
      margin: EdgeInsets.only(right: 13.w),
      decoration: BoxDecoration(
        color: state.t1Index.value == index
            ? const Color(0xFFFCF2F2)
            : const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12.w),
      ),
      alignment: Alignment.center,
      child: BaseText(
        text: title,
        fontSize: 11.5.w,
        color: state.t1Index.value == index
            ? const Color(0xFFD52222)
            : const Color(0xFF757575),
      ),
    ).withOnTap(onTap: () => state.t1Index.value = index);
  }

  Widget _buildTab2(String title, int index) {
    return Container(
      width: 67.w,
      height: 24.w,
      margin: EdgeInsets.only(right: 13.w),
      decoration: BoxDecoration(
        color: state.t2Index.value == index
            ? const Color(0xFFFCF2F2)
            : const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12.w),
      ),
      alignment: Alignment.center,
      child: BaseText(
        text: title,
        fontSize: 11.5.w,
        color: state.t2Index.value == index
            ? const Color(0xFFD52222)
            : const Color(0xFF757575),
      ),
    ).withOnTap(onTap: () => state.t2Index.value = index);
  }
}
