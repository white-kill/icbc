import 'package:cbc/pages/component/placeholder_search_widget.dart';
import 'package:cbc/pages/other/fixed_nav/fixed_nav_view.dart';
import 'package:cbc/pages/tabs/card/apply/apply_view.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'card_logic.dart';
import 'card_state.dart';

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

class CardPage extends BaseStateless {
  CardPage({super.key});

  final CardLogic logic = Get.put(CardLogic());
  final CardState state = Get.find<CardLogic>().state;

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
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  Image(image: 'xyk_main_1'.png),
                  Image(image: 'xyk_main_3'.png),
                  Image(image: 'xyk_main_4'.png),
                ],
              ),
              // Image(image: 'bg_xinyong_card'.png3x),

              Positioned(top: 310.w,left: 1.sw/2 - 80.w,child: Container(
                width: 160.w,
                height: 50.w,
              ).withOnTap(onTap: (){
                Get.to(() => ApplyPage());
              })),
              Positioned(
                top: 420.w,
                left: 25.w,
                child: SizedBox(
                  height: 160.w,
                  width: 375.w - 50.w,
                  child: SwiperHorizontal(
                      itemCount: 2,
                      activeColor: Colors.transparent,
                      color: Colors.transparent,
                      widgetBuilder: (_, index) {
                        return Stack(
                          children: [
                            Image(
                              image: 'card_main_swipe$index'.png,
                              width: 375.w - 50.w,
                              fit: BoxFit.fitWidth,
                            ),
                            // 第一行按钮（相对于轮播图内部）
                            Positioned(
                              top: 0.w, // 440-420=20
                              left: -25.w, // 0-25=-25 (补偿轮播图left偏移)
                              child: _TapDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Routes.sqxyk.push;
                                  } else if (index == 1) {
                                    // TODO: 添加第1页的跳转逻辑
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'imageList': ['zdhk'],
                                      'title': '我的自动还款',
                                      'right': true
                                    });
                                  }
                                },
                                child: Container(
                                  height: 75.w,
                                  width: 75.w,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0.w,
                              left: 50.w, // 75-25=50
                              child: _TapDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Routes.progressStatus.push;
                                  } else if (index == 1) {
                                    // TODO: 添加第1页的跳转逻辑
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'imageList': ['szk'],
                                      'title': '数字卡',
                                      'right': true
                                    });
                                  }
                                },
                                child: Container(
                                  height: 75.w,
                                  width: 75.w,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0.w,
                              left: 125.w, // 150-25=125
                              child: _TapDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Routes.xykqy.push;
                                  } else if (index == 1) {
                                    // TODO: 添加第1页的跳转逻辑
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'imageList': ['zhaqs'],
                                      'title': '账户安全锁',
                                      'right': true
                                    });
                                  }
                                },
                                child: Container(
                                  height: 75.w,
                                  width: 75.w,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0.w,
                              left: 200.w, // 225-25=200
                              child: _TapDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Routes.sjxszffw.push;
                                  } else if (index == 1) {
                                    // TODO: 添加第1页的跳转逻辑
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'imageList': ['ced'],
                                      'title': '信用卡调额',
                                      'right': true
                                    });
                                  }
                                },
                                child: Container(
                                  height: 75.w,
                                  width: 75.w,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0.w,
                              left: 275.w, // 300-25=275
                              child: _TapDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Routes.jzfq.push;
                                  } else if (index == 1) {
                                    // TODO: 添加第1页的跳转逻辑
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'imageList': ['nfcx'],
                                      'title': '年费查询',
                                      'right': true
                                    });
                                  }
                                },
                                child: Container(
                                  height: 75.w,
                                  width: 75.w,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            // 第二行按钮
                            Positioned(
                              top: 75.w, // 462-420=42
                              left: -25.w,
                              child: _TapDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Routes.hirePurchase.push;
                                  } else if (index == 1) {
                                    // TODO: 添加第1页的跳转逻辑
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'imageList': ['jyq'],
                                      'title': '急用钱',
                                      'right': true
                                    });
                                  }
                                },
                                child: Container(
                                  height: 75.w,
                                  width: 75.w,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 75.w, // 462-420=42
                              left: 50.w,
                              child: _TapDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Routes.xjfq.push;
                                  } else if (index == 1) {
                                    // TODO: 添加第1页的跳转逻辑
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'imageList': ['card_xjfq'],
                                      'title': '现金分期',
                                      'right': true
                                    });
                                  }
                                },
                                child: Container(
                                  height: 75.w,
                                  width: 75.w,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 75.w, // 462-420=42
                              left: 125.w,
                              child: _TapDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Routes.gyxykqy.push;
                                  } else if (index == 1) {
                                    // TODO: 添加第1页的跳转逻辑
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'imageList': ['xybg'],
                                      'title': '查询信用报告',
                                      'right': true
                                    });
                                  }
                                },
                                child: Container(
                                  height: 75.w,
                                  width: 75.w,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 75.w, // 462-420=42
                              left: 200.w,
                              child: _TapDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Routes.yjbk.push;
                                  } else if (index == 1) {
                                    // TODO: 添加第1页的跳转逻辑
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'imageList': ['fqzx'],
                                      'title': '中国工商银行',
                                      'right': true
                                    });
                                  }
                                },
                                child: Container(
                                  height: 75.w,
                                  width: 75.w,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 75.w, // 462-420=42
                              left: 275.w,
                              child: _TapDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Routes.gongYinIDou.push;
                                  } else if (index == 1) {
                                    // TODO: 添加第1页的跳转逻辑
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'imageList': ['card_gd'],
                                      'title': '更多',
                                      'right': true
                                    });
                                  }
                                },
                                child: Container(
                                  height: 75.w,
                                  width: 75.w,
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
                top: 630.w,
                left: 30.w,
                child: Container(
                  height: 75.w,
                  width: 315.w,
                ).withOnTap(onTap: () => Routes.hirePurchase.push),
              ),
              Positioned(
                top: 710.w,
                left: 30.w,
                child: Container(
                  height: 60.w,
                  width: 155.w,
                ).withOnTap(onTap: () => Routes.xjfq.push),
              ),
              Positioned(
                top: 710.w,
                left: 185.w,
                child: Container(
                  height: 60.w,
                  width: 155.w,
                ).withOnTap(onTap: () => Routes.zhxffq.push),
              ),
              Positioned(
                top: 770.w,
                left: 30.w,
                child: Container(
                  height: 60.w,
                  width: 155.w,
                ).withOnTap(onTap: () => Routes.jzfq.push),
              ),
              Positioned(
                top: 770.w,
                left: 185.w,
                child: Container(
                  height: 60.w,
                  width: 155.w,
                ).withOnTap(onTap: () => Routes.zggsyhsjwz.push),
              ),
              Positioned(
                top: 940.w,
                left: 18.w,
                child: Container(
                  height: 250.w,
                  width: 345.w,
                ).withOnTap(onTap: () => Routes.sqxyk.push),
              ),
              Positioned(
                top: 1260.w,
                left: 25.w,
                child: Container(
                  height: 216.w,
                  width: 320.w,
                ).withOnTap(onTap: () => Routes.qxwsdkqy.push),
              ),
            ],
          ),
        )
      ],
    );
  }
}
