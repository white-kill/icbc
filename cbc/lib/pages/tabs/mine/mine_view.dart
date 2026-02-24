import 'package:cbc/config/abc_config/cbc_logic.dart';
import 'package:cbc/config/app_config.dart';
import 'package:cbc/pages/tabs/home/account/account_view.dart';
import 'package:cbc/pages/tabs/mine/component/mine_account1_widget.dart';
import 'package:cbc/pages/tabs/mine/component/mine_account_widget.dart';
import 'package:cbc/pages/tabs/mine/info/info_view.dart';
import 'package:cbc/pages/tabs/mine/login_manage/login_manage_view.dart';
import 'package:cbc/pages/tabs/mine/safety_manage/safety_manage_view.dart';
import 'package:cbc/pages/tabs/mine/zfxe/zzxe_view.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:cbc/utils/scale_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'mine_logic.dart';
import 'mine_state.dart';

class MinePage extends BaseStateless {
  MinePage({super.key});

  final MineLogic logic = Get.put(MineLogic());
  final MineState state = Get.find<MineLogic>().state;

  @override
  double? get lefItemWidth => 0;

  @override
  Widget? get leftItem => Container();

  @override
  Widget? get titleWidget => Container(
        width: 1.sw,
        height: 32.w,
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            GetBuilder(builder: (CbcLogic c){
              return Row(
                children: [
                  Image(
                    image: 'nav_left_loc'.png3x,
                    width: 24.w,
                    height: 24.w,
                    color: Colors.black,
                  ),
                  BaseText(
                    text: c.memberInfo.city,
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ],
              );
            },id: 'updateUI',),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Container(),
            ),
            SizedBox(
              width: 16.w,
            ),
            Row(
              children: [
                Image(
                  image: 'right_kf'.png3x,
                  width: 24.w,
                  height: 24.w,
                  color: Colors.black,
                ).withOnTap(onTap: () {
                  Routes.mineService.push;
                }),
                SizedBox(
                  width: 16.w,
                ),
                Image(
                  image: 'right_message'.png3x,
                  width: 24.w,
                  height: 24.w,
                  color: Colors.black,
                ).withOnTap(onTap: () {
                  Routes.messageCenter.push;
                }),
                SizedBox(
                  width: 6.w,
                ),
                ScalePointWidget(
                  icColor: Colors.black,
                  left: 100.w,
                  dx: 40.w,
                  dy: -10.w,
                  width: 130.w,
                ).withPadding(right: 10.w, left: 10.w),
              ],
            ),
            SizedBox(
              width: 16.w,
            ),
          ],
        ),
      );

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
          GetBuilder<CbcLogic>(
            builder: (c) => SizedBox(
              width: double.infinity,
              height: 244.w,
              child: Stack(
                children: [
                  Image(
                    image: 'bg_mine_header'.png3x,
                    width: 1.sw,
                  ),
                  Positioned(
                    left: 24.w,
                    top: 82.w,
                    child: Image(
                      image: 'ic_avator'.png3x,
                      width: 72.w,
                    ).withOnTap(onTap: () => Get.to(() => InfoPage())),
                  ),
                  Positioned(
                    left: 101.w,
                    top: 108.w,
                    child: Row(
                      children: [
                        BaseText(
                          text: AppConfig.config.abcLogic.memberInfo.realName
                              .removeFirstChar1(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.w,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 7.w),
                        Image(
                          image: 'ic_lv4'.png3x,
                          width: 64.w,
                        ).withOnTap(onTap: () => Routes.personalLevel.push),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 101.w,
                    top: 146.w,
                    child: BaseText(
                      text:
                          '上次登录 ${AppConfig.config.abcLogic.memberInfo.loginTime}',
                      style: TextStyle(
                        color: const Color(0xFF888888),
                        fontSize: 11.w,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16.w,
                    top: 172.w,
                    child: Row(
                      children: [
                        _buildTopInfoItem('银行卡', '1').withOnTap(
                            onTap: () => Get.to(() => AccountPage())),
                        _buildTopInfoItem('工银i豆', AppConfig.config.abcLogic.memberInfo.peas.toString())
                            .withOnTap(onTap: () => Routes.personalPoints.push),
                        _buildTopInfoItem('数字藏品', '0').withOnTap(
                            onTap: () => Routes.virtualCollection.push),
                        _buildTopInfoItem('立减金', '0')
                            .withOnTap(onTap: () => ''),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            id: 'updateUI',
          ),
          Container(
            width: double.infinity,
            height: 78.w,
            margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMineTopFun('ic_mine_ydzd', '月度账单')
                    .withOnTap(onTap: () => Routes.billLoading.push),
                _buildMineTopFun('ic_mine_wddd', '商城订单')
                    .withOnTap(onTap: () => Routes.gongYinIDou.push),
                _buildMineTopFun('ic_mine_xybg', '信用报告')
                    .withOnTap(onTap: () => Routes.creditReport.push),
                _buildMineTopFun('ic_mine_tszx', '我的客服')
                    .withOnTap(onTap: () => Routes.mineService.push),
                _buildMineTopFun('ic_fhome_2_10', '更多')
                    .withOnTap(onTap: () => Routes.mineNormalMore.push),
              ],
            ),
          ),

          const MineAccountWidget(),
          const MineAccount1Widget(),
          Container(
            width: double.infinity,
            child: Stack(
              children: [
                Image(
                  image: 'img_mine_security_center'.png3x,
                ),
                
                Positioned(bottom: 15,left: 20,child: Container(
                  width: 1.sw - 40.w,
                  height: 90.w,
                  child: Row(
                    children: [
                      Container().expanded(onTap: () => Get.to(() => LoginManagePage())),
                      Container().expanded(onTap: () => Get.to(() => SafetyManagePage())),
                      Container().expanded(onTap: ()=> Get.to(() => ZzxePage())),
                      Container().expanded(onTap:()=>  Routes.safeCenter.push),
                    ],
                  ),
                ),),
              ],
            ),
          ).withOnTap(onTap: () => Routes.safeCenter.push),
        ],
      ),
    );
  }

  Widget _buildTopInfoItem(String title, String value) {
    return Container(
      width: 85.75.w,
      child: Column(
        children: [
          BaseText(
            text: title,
            style: TextStyle(
              color: const Color(0xFF666666),
              fontSize: 11.5.w,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 3.w),
          BaseText(
            text: value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.w,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMineTopFun(String image, String name) {
    return Container(
      width: 64.w,
      height: double.infinity,
      padding: EdgeInsets.only(top: 14.w),
      child: Column(
        children: [
          Image(
            image: image.png3x,
            width: 28.w,
          ),
          SizedBox(height: 8.w),
          BaseText(
            text: name,
            fontSize: 11.w,
          ),
        ],
      ),
    );
  }
}
