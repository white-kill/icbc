import 'package:cbc/pages/index/index_logic.dart';
import 'package:cbc/pages/tabs/home/account/transfer/transfer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../routes/app_pages.dart';
import '../tabs/home/account/account_view.dart';
import 'mine_service_logic.dart';
import 'mine_service_state.dart';

class MineServicePage extends BaseStateless {
  MineServicePage({super.key});

  final MineServiceLogic logic = Get.put(MineServiceLogic());
  final MineServiceState state = Get.find<MineServiceLogic>().state;

  @override
  Widget? get titleWidget => BaseText(
        text: '我的客服',
        fontSize: 17.w,
        color: const Color(0xFF607483),
      );

  @override
  Widget? get leftItem => Container(
        padding: EdgeInsets.symmetric(vertical: 12.w),
        child: Image(
          image: 'ic_left_back'.png3x,
          color: const Color(0xFF5B6A80),
        ),
      ).withOnTap(onTap: () => Get.back());

  @override
  List<Widget>? get rightAction => [
        Container(
          padding: EdgeInsets.only(right: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: 'ic_service_mute'.png3x,
                width: 20.w,
                height: 20.w,
                color: const Color(0xFF495768),
              ),
              SizedBox(width: 8.w),
              BaseText(
                text: '更多',
                fontSize: 15.w,
                color: const Color(0xFF181C22),
              ),
              SizedBox(width: 4.w),
            ],
          ),
        ),
      ];

  @override
  Widget initBody(BuildContext context) {
    return Container(
      width: 1.sw,
      color: const Color(0xFFF4F5F7),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 1.sw,
              height: double.infinity,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Stack(
                    children: [
                      Image(
                        image: 'bg_service_top'.png3x,
                        width: 1.sw,
                      ),
                      Positioned(
                        top: 224.w,
                        left: 0,
                        child: SizedBox(
                          width: 1.sw,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: 'ic_service_icon1'.png3x,
                                width: 78.w,
                              ).withOnTap(onTap: () {
                                Get.to(() => AccountPage());
                              }),
                              Image(
                                image: 'ic_service_icon2'.png3x,
                                width: 78.w,
                              ).withOnTap(onTap: () {
                                Get.offAllNamed(Routes.tabs);
                                Get.put(IndexLogic()).selectIndex(1);
                              }),
                              Image(
                                image: 'ic_service_icon3'.png3x,
                                width: 78.w,
                              ).withOnTap(onTap: () {
                                Get.to(() => TransferPage());
                              }),
                              Image(
                                image: 'ic_service_icon4'.png3x,
                                width: 78.w,
                              ).withOnTap(onTap: () {
                                // TODO 跳转收支
                                Routes.billPage.push;
                              }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  _buildAfterShow(),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 1.sw,
            child: Image(
              image: 'bg_service_bottom'.png3x,
              width: 1.sw,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAfterShow() {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 1000)),
      builder: (ctx, snapshot) => Visibility(
        visible: snapshot.connectionState == ConnectionState.done,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 9.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: BaseText(
            text: '您好，很高兴为您服务。您可以直接输入问题，如：查余额、储蓄卡无法使用等。',
            style: TextStyle(
              fontSize: 14.w,
              color: Colors.black,
              height: 23 / 14,
            ),
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
