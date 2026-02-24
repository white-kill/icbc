import 'package:cbc/pages/tabs/home/account/account_view.dart';
import 'package:cbc/pages/tabs/home/child/fxgd/view.dart';
import 'package:cbc/pages/tabs/home/component/ad_banner_widget.dart';
import 'package:cbc/pages/tabs/home/component/child/home_robot_detail/view.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:cbc/utils/common_right_button.dart';
import 'package:cbc/utils/stack_position.dart';
import 'package:cbc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../other/change_nav/change_nav_view.dart';
import '../../../other/fixed_nav/fixed_nav_view.dart';
import '../../../other/sheet_widget/sheet_bottom.dart';
import '../bill/bill_view.dart';
import '../home_logic.dart';
import 'function_banner_widget.dart';

class HomeContentWidget1 extends StatefulWidget {
  const HomeContentWidget1({super.key});

  @override
  State<HomeContentWidget1> createState() => _HomeContentWidget1State();
}

class _HomeContentWidget1State extends State<HomeContentWidget1> {
  final HomeLogic logic = Get.put(HomeLogic());
  int _currentImageIndex = 1; // 当前显示的图片索引：1, 2, 或 3

  void jumpPage(int index) {
    if (index == 0) {
      Get.to(() => AccountPage());
    }
    if (index == 1) {
      //收支
      Get.to(() => BillPage());
    }
    if (index == 2) {
      Routes.dayDayEarn.push;
    }
    if (index == 3) {
      Routes.payment.push;
    }
  }

  final ScrollController _scrollController = ScrollController();
  double _backgroundOffset = 0.0;
  final double _triggerOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    final currentOffset = _scrollController.offset;

    if (currentOffset >= _triggerOffset) {
      // 超过600时，背景开始向上移动（负值表示向上）
      setState(() {
        _backgroundOffset =
            -(currentOffset - _triggerOffset) * 0.5; // 0.5是背景移动速度系数
      });
    } else if (_backgroundOffset != 0) {
      // 回到600以内时，重置背景位置
      setState(() {
        _backgroundOffset = 0;
      });
    }
  }

  List tagNames = [
    '稳健回报',
    '灵活取用',
    '进取投资',
    '保险保障',
  ];

  String imageName = 'ic_home1_tag0';
  String title = '稳健回报';

  // 根据当前选中的 tag 构建内容
  Widget _buildTagContent() {
    int tagIndex = tagNames.indexOf(title);
    return Stack(
      children: [
        Image(
          image: imageName.png,
          fit: BoxFit.fitWidth,
          width: 1.sw,
        ),
        // 这里可以根据不同的 tag 添加不同的点击区域
        // 示例：为每个 tag 添加可点击区域
        if (tagIndex == 0) // 稳健回报
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 80.w,
                width: 1.sw,
              ).withOnTap(onTap: () {
                Get.to(() => FixedNavPage(), arguments: {
                  'title': '基金详情',
                  'image': 'ic_home1_tag0_2_view',
                  'bottomNav': Image(
                    image: 'ic_home1_tag0_2_view_bottom'.png3x,
                    fit: BoxFit.fitWidth,
                    width: 1.sw,
                  ),
                  'rightWidget': Row(
                    children: [
                      CommonRightButton.shareButton(
                        color: const Color(0xFF607483),
                        onTap: () {
                          // 分享按钮点击事件
                        },
                      ),
                      CommonRightButton.moreDotsButton(),
                    ],
                  ),
                });
              })),

        if (tagIndex == 0) // 稳健回报 - 全屏区域
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 80.w,
            child: GestureDetector(
              onTap: () {
                Get.to(() => FixedNavPage(), arguments: {
                  'title': '基金详情',
                  'image': 'ic_home1_tag0_1_view',
                  'bottomNav': Image(
                    image: 'ic_home1_tag0_1_view_bottom'.png3x,
                    fit: BoxFit.fitWidth,
                    width: 1.sw,
                  ),
                  'rightWidget': Row(
                    children: [
                      CommonRightButton.shareButton(
                        color: const Color(0xFF607483),
                        onTap: () {
                          // 分享按钮点击事件
                        },
                      ),
                      CommonRightButton.moreDotsButton(),
                    ],
                  ),
                });
              },
              child: Container(color: Colors.transparent),
            ),
          ),
        if (tagIndex == 1) // 灵活取用
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                // 灵活取用的点击事件
              },
              child: Container(color: Colors.transparent),
            ),
          ),
        if (tagIndex == 2) // 进取投资
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                // 进取投资的点击事件
              },
              child: Container(color: Colors.transparent),
            ),
          ),
        if (tagIndex == 3) // 保险保障
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                // 保险保障的点击事件
              },
              child: Container(color: Colors.transparent),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // // 背景图层
          // Positioned.fill(
          //   top: (MediaQuery.of(context).padding.top + 44.w + 110.w),
          //   child: Transform.translate(
          //     offset: Offset(0, _backgroundOffset),
          //     child: Image(
          //       image: 'bg_home_insert'.png3x,
          //       fit: BoxFit.fitWidth,
          //       width: double.infinity,
          //       height: double.infinity,
          //     ),
          //   ),
          // ),

          // ListView层
          ListView(
            controller: _scrollController,
            padding: EdgeInsets.only(top: _triggerOffset), // 留出背景图显示空间
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Image(
                        image: 'home_content1_1'.png3x,
                      ).withOnTap(onTap: () {
                        Get.toNamed(Routes.homeRobotPage);
                      }),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            width: 1.sw - 30.w,
                            height: 40.w,
                            margin: EdgeInsets.only(left: 15.w, right: 15.w),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                    child: Container().withOnTap(onTap: () {
                                  logic.homeTabIndex.value = 0;
                                  logic.state.appBarController
                                      .changeTagTitle(logic.homeTabIndex.value);
                                })),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                    child: Container().withOnTap(onTap: () {
                                  logic.homeTabIndex.value = 1;
                                  logic.state.appBarController
                                      .changeTagTitle(logic.homeTabIndex.value);
                                })),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                    child: Container().withOnTap(onTap: () {
                                  logic.homeTabIndex.value = 2;
                                  logic.state.appBarController
                                      .changeTagTitle(logic.homeTabIndex.value);
                                })),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                    child: Container().withOnTap(onTap: () {
                                  logic.homeTabIndex.value = 3;
                                  logic.state.appBarController
                                      .changeTagTitle(logic.homeTabIndex.value);
                                })),
                                Container(
                                  width: 45.w,
                                ).withOnTap(onTap: () {
                                  SheetBottom.show(
                                    title: '频道管理',
                                    rightWidget: BaseText(
                                      text: '完成',
                                      color: Colors.blueAccent,
                                    ),
                                    leftWidget: Image(
                                      image: 'ic_jt_left'.png3x,
                                      width: 25.w,
                                      height: 25.w,
                                    ),
                                    child: Image(image: 'bg_pdgl'.png3x),
                                  );
                                })
                              ],
                            ),
                          )),
                      Positioned(
                        top: 98.w,
                        left: 48.w,
                        child: Image(
                          image: '1'.gif,
                          width: 300.w,
                          height: 38.w,
                        ),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, -0.5),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Image(
                          image: 'home_content1_2'.png3x,
                          width: 1.sw,
                          fit: BoxFit.fitWidth,
                        ),
                        Column(
                          children: [
                            VerticalGridView(
                              padding: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                              ),
                              widgetBuilder: (BuildContext context, int index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      // image: 'icon_home_${index + 1}'.png3x,
                                      width: 80.w,
                                      height: 98.w,
                                    ),
                                  ],
                                ).withOnTap(onTap: () => jumpPage(index));
                              },
                              mainHeight: 1.sw / 1080 * 675 * 0.4,
                              itemCount: 4,
                              crossSpacing: 5.w,
                              spacing: 5.w,
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            const FunctionBannerWidget(),
                            // const AdBannerWidget(),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // Container(
              //   width: 1.sw,
              //   height: 4.w,
              //   decoration: const BoxDecoration(
              //     color: Color(0xffF4F5F8),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.white,
              //         offset: Offset(0, 0.5),
              //         blurRadius: 0,
              //       ),
              //     ],
              //   ),
              // ),
              // Image(image: 'home_zzz'.png3x).withOnTap(onTap: () {
              //   Get.to(() => ChangeNavPage(), arguments: {
              //     'title': '赚豆兑好礼',
              //     'isOffset': true,
              //     'navColor': Colors.transparent,
              //     'noBackGround1': false,
              //     'defTitleColor': Colors.white,
              //     'changeTitleColor': Colors.white,
              //     'image': 'home_insert_view',
              //     'rightWidget': CommonRightButton.shareButton(
              //       color: Colors.white,
              //       onTap: () {
              //         // 分享按钮点击事件
              //       },
              //     ),
              //   });
              // }),
              Container(
                child: Stack(
                  children: [
                    Image(
                      image: "home_content1_3new".png3x,
                      width: 1.sw,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                        child: Container(
                      width: 210.w,
                      height: 130.w,
                    ).withOnTap(onTap: () {
                      Routes.dayDayEarn.push;
                    })),
                    Positioned(
                        left: 210.w,
                        child: Container(
                          width: 80.w,
                          height: 130.w,
                        ).withOnTap(onTap: () {
                          Routes.jidikuanghuan.push;
                        })),
                    Positioned(
                        left: 295.w,
                        child: Container(
                          width: 80.w,
                          height: 130.w,
                        ).withOnTap(onTap: () {
                          Routes.zichantisheng.push;
                        }))
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Image(
                      image: "home_content1_5new".png3x,
                      width: 1.sw,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                        child: Container(
                      height: 30.w,
                      width: 1.sw,
                    ).withOnTap(onTap: () {
                      Routes.cfxb.push;
                    })),
                    Positioned(
                        top: 30.w,
                        left: 0,
                        width: 1.sw,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                height: 120.w,
                              ).withOnTap(onTap: () {
                                Routes.nianzhongj.push;
                              }),
                            ),
                            Expanded(
                              child: Container(
                                height: 120.w,
                              ).withOnTap(onTap: () {
                                Routes.a500.push;
                              }),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Image(
                      image: "home_content1_4new_$_currentImageIndex".png3x,
                      width: 1.sw,
                      fit: BoxFit.fitWidth,
                      gaplessPlayback: true,
                    ),
                    Positioned(
                        left: 15.w,
                        child: Container(
                          width: 70.w,
                          height: 30.w,
                        ).withOnTap(onTap: () {
                          setState(() {
                            _currentImageIndex = 1;
                          });
                        })),
                    Positioned(
                        left: 95.w,
                        child: Container(
                          width: 70.w,
                          height: 30.w,
                        ).withOnTap(onTap: () {
                          setState(() {
                            _currentImageIndex = 2;
                          });
                        })),
                    Positioned(
                        left: 95.w + 70.w,
                        child: Container(
                          width: 80.w,
                          height: 30.w,
                        ).withOnTap(onTap: () {
                          setState(() {
                            _currentImageIndex = 3;
                          });
                        })),
                    Positioned(
                        top: 30.w,
                        child: Container(
                          width: 1.sw,
                          height: 180.w,
                        ).withOnTap(onTap: () {
                          if (_currentImageIndex == 1) {
                            Get.to(() => FixedNavPage(), arguments: {
                              'title': '基金详情',
                              'image': 'tianhong',
                              'right': true,
                              'bottomNav': Image(
                                image: 'tianhong_bottom'.png3x,
                                width: 1.sw,
                                fit: BoxFit.fitWidth,
                              ),
                            });
                          }
                        }))
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                     Image(
                       image: "home_content1_6new_1".png3x,
                       width: 1.sw,
                       fit: BoxFit.fitWidth,
                     ),

                     Positioned(child: Container(
                       width: 1.sw,
                       height: 170.w,
                     ).withOnTap(onTap: () {
                       Get.to(() => FixedNavPage(), arguments: {
                         'title': '工迎归乡季 助您归途',
                         'image': 'gygxj',
                         'right': true,
                       });
                     })),

                     // 左下角
                     Positioned(
                       bottom: 190.w,
                       left: 0,
                       child: Container(
                         width: 1.sw/2,
                         height: 70.w,
                       ).withOnTap(onTap: () {
                         Get.to(() => ChangeNavPage(), arguments: {
                           'image': 'xxsc',
                           'title': '星享事成',
                           'right': true
                         });
                       }),
                     ),
                     // 右下角
                     Positioned(
                       bottom: 190.w,
                       left: 1.sw/2,
                       child: Container(
                         width: 1.sw/2,
                         height: 70.w,
                       ).withOnTap(onTap: () {
                         Get.to(() => ChangeNavPage(), arguments: {
                           'image': 'sjyl',
                           'title': '双重好礼，双倍惊喜',
                           'hideRightAction': true
                         });
                       }),
                     ),
                     // 左上角
                     Positioned(
                       bottom: 265.w,
                       left: 0,
                       child: Container(
                         width: 1.sw/2,
                         height: 70.w,
                       ).withOnTap(onTap: () {
                         Routes.gyisc.push;
                       }),
                     ),
                     // 右上角
                     Positioned(
                       bottom: 265.w,
                       left: 1.sw/2,
                       child: Container(
                         width: 1.sw/2,
                         height: 70.w,
                       ).withOnTap(onTap: () {
                         Routes.gyidly.push;
                       }),
                     ),
                     
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Image(
                      image: "home_content1_7new".png3x,
                      width: 1.sw,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 1.sw,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 80.w,
                                height: 20.w,
                              ).withOnTap(onTap: () {
                                Get.to(() => FixedNavPage(), arguments: {
                                  'image': 'qqjrfw_more',
                                  'title': '全球金融服務',
                                  'right': true
                                });
                              })
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80.w,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
                          width: 1.sw - 30.w,
                          height: 80.w,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container().withOnTap(onTap: () {
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'imageList': ['fwjg'],
                                      'title': '中国工商银行服务价目表',
                                      'right': true
                                    });
                                  })),
                              Expanded(
                                  child: Container().withOnTap(onTap: () {
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'image': 'pjyfk',
                                      'title': '评价与反馈',
                                      'right': true
                                    });
                                  })),
                              Expanded(
                                  child: Container().withOnTap(onTap: () {
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'image': 'wyts',
                                      'title': '我要投诉',
                                      'right': true
                                    });
                                  })),
                              Expanded(
                                  child: Container().withOnTap(onTap: () {
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'image': 'lxwh',
                                      'title': '联系我行',
                                      'right': true
                                    });
                                  })),
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Image(
                      image: "home_content1_8new".png3x,
                      width: 1.sw,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 1.sw,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 80.w,
                                height: 50.w,
                              ).withOnTap(onTap: () {
                                Get.to(() => FixedNavPage(), arguments: {
                                  'image': 'qqjrfw_more',
                                  'title': '全球金融服務',
                                  'right': true
                                });
                              })
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80.w,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
                          width: 1.sw - 30.w,
                          height: 80.w,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container().withOnTap(onTap: () {
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'imageList': ['jsh_1', 'jsh_2'],
                                      'title': '结售汇',
                                      'right': true
                                    });
                                  })),
                              Expanded(
                                  child: Container().withOnTap(onTap: () {
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'image': 'kjhk',
                                      'title': '跨境汇款',
                                      'right': true
                                    });
                                  })),
                              Expanded(
                                  child: Container().withOnTap(onTap: () {
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'image': 'zxzm',
                                      'title': '资信证明',
                                      'right': true
                                    });
                                  })),
                              Expanded(
                                  child: Container().withOnTap(onTap: () {
                                    Get.to(() => FixedNavPage(), arguments: {
                                      'image': 'wbyy',
                                      'title': '外币预约',
                                      'right': true
                                    });
                                  })),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.w,
                        ),
                        Container(
                          width: 1.sw,
                          height: 100.w,
                        ).withOnTap(onTap: () {
                          Get.to(FxgdPage());
                        })
                      ],
                    ))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
