import 'package:cbc/pages/tabs/home/home_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';
import '../../../../utils/stack_position.dart';
import '../../../other/image/image_view.dart';
import '../../../other/sheet_widget/sheet_bottom.dart';
import '../account/account_view.dart';
import '../account/transfer/transfer_view.dart';

class HomeContentWidget4 extends StatefulWidget {
  const HomeContentWidget4({super.key});

  @override
  State<HomeContentWidget4> createState() => _HomeContentWidget4State();
}

class _HomeContentWidget4State extends State<HomeContentWidget4> {

  final HomeLogic logic = Get.put(HomeLogic());
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image(
              image: 'home_content4_1'.png3x,
            ).withOnTap(onTap: () {
              Get.toNamed(Routes.homeRobotPage);
            }),
            Positioned(bottom:0 ,child: Container(
              width: 1.sw - 30.w,
              height: 40.w,
              margin: EdgeInsets.only(left: 15.w,right: 15.w),
              child: Row(
                children: [
                  SizedBox(width: 10.w,),
                  Expanded(child: Container().withOnTap(onTap: (){
                    logic.homeTabIndex.value = 0;
                    logic.state.appBarController.changeTagTitle(logic.homeTabIndex.value);
                  })),
                  SizedBox(width: 10.w,),
                  Expanded(child: Container().withOnTap(onTap: (){
                    logic.homeTabIndex.value = 1;
                    logic.state.appBarController.changeTagTitle(logic.homeTabIndex.value);
                  })),
                  SizedBox(width: 10.w,),
                  Expanded(child: Container().withOnTap(onTap: (){
                    logic.homeTabIndex.value = 2;
                    logic.state.appBarController.changeTagTitle(logic.homeTabIndex.value);
                  })),
                  SizedBox(width: 10.w,),
                  Expanded(child: Container().withOnTap(onTap: (){
                    logic.homeTabIndex.value = 3;
                    logic.state.appBarController.changeTagTitle(logic.homeTabIndex.value);
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

        Stack(
          children: [
            Image(image:  'home_content4_2'.png3x,),
            StackPositionGridWidget.custom(stackPosition: StackPosition(designWidth: 1125, designHeight: 2497, deviceWidth: 1.sw), x: 43, y: 405, bottomMargin: 1740, crossCount: 5, itemCount: 10,
                onItemTap: (index) {
                  switch (index) {
                    case 0: {
                      Get.to(() => AccountPage());
                    }
                    break;
                    case 1: {
                      Routes.mineAssets.push;
                    }
                    break;
                    case 2: {
                      Get.to(() => TransferPage());
                    }
                    break;
                    case 3: {
                      // 心愿定投
                      Get.to(ImagePage(
                        title: '企业家服务',
                        image: 'qyjfw',
                        navChange: false,
                        right: true,
                      ),);
                    }
                    break;
                    case 4: {
                      Get.to(ImagePage(
                        title: '私享权益',
                        image: 'sxqy',
                        navChange: false,
                        right: false,
                      ),);
                    }
                    break;
                    case 5: {
                      Get.to(ImagePage(
                        title: '市场观点',
                        image: 'scgd',
                        navChange: false,
                        right: false,
                      ),);
                    }
                    break;
                    case 6: {
                      Get.to(ImagePage(
                        title: '家族/标准化信托',
                        image: 'jzxt',
                        navChange: false,
                        right: true,
                      ),);
                    }
                    break;
                    case 7: {
                      Get.to(ImagePage(
                        title: '专属理财',
                        image: 'zslc',
                        navChange: false,
                        right: true,
                      ),);
                    }
                    break;
                    case 8: {
                      Get.to(ImagePage(
                        title: '专属保险',
                        image: 'zsbx',
                        navChange: false,
                        right: true,
                      ),);
                    }
                    break;
                    case 9: {
                      Get.to(ImagePage(
                        title: '私募产品',
                        image: 'smcp',
                        navChange: false,
                        right: true,
                      ),);
                    }
                    break;
                  }

                }
            ).build()
          ],
        )

      ],
    );
  }
}
