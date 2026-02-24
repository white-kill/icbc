import 'package:cbc/pages/mine_service/mine_service_view.dart';
import 'package:cbc/pages/other/fixed_nav/fixed_nav_view.dart';
import 'package:cbc/pages/tabs/home/account/component/info_widget1.dart';
import 'package:cbc/pages/tabs/home/account/more_account/more_account_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/component/rotate_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../config/app_config.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/comm_widget_utils.dart';
import 'account_logic.dart';
import 'account_state.dart';
import 'component/copy_card.dart';
import 'component/info_widget2.dart';
import 'component/info_widget3.dart';
import 'component/info_widget4.dart';
import 'component/info_widget5.dart';
import 'component/item1_widget.dart';
import 'component/item2_widget.dart';
import 'component/item3_widget.dart';
import 'component/item4_widget.dart';

class AccountPage extends BaseStateless {
  AccountPage({Key? key}) : super(key: key, title: '我的账户');

  final AccountLogic logic = Get.put(AccountLogic());
  final AccountState state = Get
      .find<AccountLogic>()
      .state;

  @override
  Color? get background => const Color(0xFFF8F8F8);


  @override
  List<Widget>? get rightAction =>
      [
        Obx(
              () =>
          logic.showFirst.value
              ? SizedBox.shrink()
              : Image(
            image: 'ic_nav_service'.png3x,
            width: 20.w,
            height: 20.w,
            color: const Color(0xFF607483),
          )
              .withPadding(right: 20.w)
              .withOnTap(onTap: () => Routes.mineService.push),
        ),
        Obx(
              () =>
          logic.showFirst.value
              ? const SizedBox.shrink()
              : CommWidgetUtils.getMoreIcon(icColor: const Color(0xFF607483)),
        ),

        Obx(() =>
        !logic.showFirst.value ? const SizedBox.shrink() : BaseText(
          text: '更多',
          fontSize: 14.sp,
          color: const Color(0xFF607483),
        ).withContainer(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 12.w),
            onTap: () {
              Get.to(() => MoreAccountPage());
            }
        ))

      ];

  @override
  // TODO: implement titleWidget
  Widget? get titleWidget =>
      Obx(() {
        return Text(
          !logic.showFirst.value ? "账户详情" : "我的账户", style: TextStyle(
            fontSize: 18.sp,
            color: titleColor ?? const Color(0xFF607483),
            fontWeight: FontWeight.w400
        ),);
      });

  @override
  Widget initBody(BuildContext context) {
    return Obx(() =>
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            !logic.showFirst.value
                ? Stack(
              children: [
                Container(
                  width: 1.sw,
                  height: 120.w,
                  margin:
                  EdgeInsets.only(left: 18.w, right: 15.w, top: 15.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.w)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff000000).withOpacity(0.016),
                        offset: Offset(0, 1.5),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: 'ic_gs_card'.png3x,
                            width: 55.w,
                            height: 40.w,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BaseText(
                                text:
                                '${AppConfig.config.abcLogic
                                    .openCity()} 借记卡(I 类)',
                                fontSize: 14.sp,
                              ),
                              SizedBox(
                                height: 6.w,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  BaseText(
                                      text: AppConfig.config.abcLogic
                                          .card()),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  Container(
                                    width: 28.w,
                                    height: 17.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(2.w),
                                        ),
                                        color: Color(0xffF1F6FF)),
                                    alignment: Alignment.center,
                                    child: BaseText(
                                      text: '查看',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        height: 1,
                                        color: Color(0xff306DC6),
                                      ),
                                    ),
                                  ).withContainer(
                                      width: 55.w,
                                      height: 20.w,
                                      alignment: Alignment.centerLeft,
                                      onTap: () async {
                                        AlterWidget.alterWidget(
                                            builder: (context) {
                                              return const CopyCard(ck: true,);
                                            });
                                      }
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ).withContainer(
                          padding: EdgeInsets.only(left: 19.w, top: 19.w),
                          onTap: logic.switchWidgets
                      ),
                      Container(
                        height: 20.w,
                      ).withOnTap(onTap: logic.switchWidgets),
                      Container(
                        width: 310.w,
                        height: 0.5.w,
                        color: const Color(0xffEFEFEF),
                      ),
                      Container(
                        height: 12.w,
                      ).withOnTap(onTap: logic.switchWidgets),
                      BaseText(
                        text: '自动注册',
                        color: const Color(0xff676767),
                        fontSize: 11.sp,
                      ).withPadding(left: 20.w)
                    ],
                  ),
                ),
                Positioned(
                  top: 18.w,
                  right: 15.w,
                  child: Image(
                    image: 'ic_ac_if_tag'.png3x,
                    width: 75.w,
                    height: 19.w,
                  ),
                )
              ],
            )
                : Stack(
              children: [
                Image(
                  image: 'ic_account_top'.png3x,
                  width: 1.sw,
                  height: 135.w,
                ),
                Container(
                  width: 1.sw,
                  height: 117.w,
                  margin:
                  EdgeInsets.only(left: 15.w, right: 15.w, top: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: 'ic_gs_card'.png3x,
                            width: 55.w,
                            height: 40.w,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BaseText(
                                text:
                                '${AppConfig.config.abcLogic
                                    .openCity()} 借记卡(I 类)',
                                fontSize: 14.sp,
                              ),
                              SizedBox(
                                height: 6.w,
                              ),
                              BaseText(
                                  text: AppConfig.config.abcLogic.card()),
                            ],
                          ),
                        ],
                      ).withContainer(
                          padding: EdgeInsets.only(left: 19.w, top: 19.w),
                          onTap: () => logic.switchWidgets()
                      ),
                      Container(
                        height: 20.w,
                      ).withOnTap(onTap: () => logic.switchWidgets()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              BaseText(
                                text: '人民币余额',
                                fontSize: 13.sp,
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              RotatingWidget(
                                image: 'ic_home_ref'.png3x,
                                disCallBack: () {},
                              ),
                            ],
                          ),
                          BaseText(
                            text: AppConfig.config.abcLogic.balance(),
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                                color: Color(0xff333333),
                                fontSize: 16.sp),
                          )
                        ],
                      ).withPadding(left: 15.w, right: 15.w)
                    ],
                  ),
                )
              ],
            ),
            Container(
              height: !logic.showFirst.value ? 15.w : 25.w,
            ),
            Stack(
              children: [
                // 第二个Widget - 从底部向上滑动显示
                AnimatedBuilder(
                  animation: logic.secondWidgetAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, MediaQuery
                          .of(context)
                          .size
                          .height * logic.secondWidgetAnimation.value),
                      child: Opacity(
                        opacity: 1.0 - logic.secondWidgetAnimation.value,
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    children: _widget2(),
                  ),
                ),

                // 第一个Widget - 向下滑动隐藏
                AnimatedBuilder(
                  animation: logic.firstWidgetAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, MediaQuery
                          .of(context)
                          .size
                          .height * logic.firstWidgetAnimation.value),
                      child: Opacity(
                        opacity: 1.0 - logic.firstWidgetAnimation.value,
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    children: _widget1(),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  List<Widget> _widget1() {
    return [
      const Item1Widget(),
      SizedBox(
        height: 20.w,
      ),
      const Item2Widget(),
      SizedBox(
        height: 20.w,
      ),
      const Item3Widget(),
      SizedBox(
        height: 20.w,
      ),
      const Item4Widget(),
      SizedBox(
        height: 20.w,
      ),
      Stack(
        children: [
          Image(image: 'ic_acc_bottom1'.png3x),

          Positioned(top: 0, right: 10, child: Container(
            width: 55.w,
            height: 28.w,
          ).withOnTap(onTap: () {
            Get.to(() => MoreAccountPage());
          })),
          Positioned(top: 25.w, left: 15.w, right: 15.w, child: Column(
            children: [
              Row(
                children: [
                  Container().expanded(onTap: () {
                    Get.to(() => FixedNavPage(), arguments: {
                      'image': 'zh_zhjk',
                      'title': '资信证明',
                      'right': true
                    });
                  }),
                  Container().expanded(onTap: () => Routes.printPage.push),
                ],
              ).expanded(),
              Row(
                children: [
                  Container().expanded(onTap: () {
                    Get.to(() => FixedNavPage(), arguments: {
                      'image': 'zh_zxzm',
                      'title': '资信证明',
                      'right': true
                    });
                  }),
                  Container().expanded(onTap: () {
                    Get.to(() => FixedNavPage(), arguments: {
                      'image': 'zh_gyxs',
                      'title': '工银信使',
                      'right': true
                    });
                  }),
                ],
              ).expanded()
            ],
          ).withContainer(
            width: 1.sw,
            height: 129.w,
          ))
        ],
      ),
      Image(image: 'ic_acc_bottom2'.png3x),
    ];
  }

  List<Widget> _widget2() {
    return [
      const InfoWidget1(),
      SizedBox(
        height: 8.w,
      ),
      const InfoWidget2(),
      SizedBox(
        height: 8.w,
      ),
      const InfoWidget3(),
      SizedBox(
        height: 8.w,
      ),
      const InfoWidget4(),
      SizedBox(
        height: 8.w,
      ),
      const InfoWidget5(),
      SizedBox(
        height: 8.w,
      ),
      Image(image: 'ic_acc_bottom2'.png3x),
    ];
  }
}
