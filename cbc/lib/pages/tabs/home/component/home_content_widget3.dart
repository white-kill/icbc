import 'package:cbc/pages/other/image/image_view.dart';
import 'package:cbc/pages/tabs/home/home_logic.dart';
import 'package:cbc/utils/stack_position.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import '../../../../routes/app_pages.dart';
import '../../../index/index_logic.dart';
import '../../../other/sheet_widget/sheet_bottom.dart';
import '../account/account_view.dart';
import '../account/transfer/transfer_view.dart';

class HomeContentWidget3 extends StatefulWidget {
  const HomeContentWidget3({super.key});

  @override
  State<HomeContentWidget3> createState() => _HomeContentWidget3State();
}

class _HomeContentWidget3State extends State<HomeContentWidget3> {
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
              image: 'home_content3_1'.png3x,
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
                  })                ],
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
            Image(image:  'home_content3_2'.png3x,),
            StackPositionGridWidget.custom(stackPosition: StackPosition(designWidth: 1125, designHeight: 2497, deviceWidth: 1.sw), x: 43, y: 405, bottomMargin: 1740, crossCount: 5, itemCount: 10,
                onItemTap: (index) {
              switch (index) {
                case 0: {
                  Get.to(() => AccountPage());
                }
                break;
                case 1: {
                  Get.to(() => TransferPage());
                }
                break;
                case 2: {
                  Routes.mineAssets.push;
                }
                break;
                case 3: {
                  // 心愿定投
                  Get.to(ImagePage(
                    title: '心愿定投',
                    image: 'xydt',
                    navChange: false,
                    right: true,
                  ),);
                }
                break;
                case 4: {
                  Get.toNamed(Routes.billPage);
                }
                break;
                case 5: {
                  Get.toNamed(Routes.deposit,);
                }
                break;
                case 6: {
                  Get.put<IndexLogic>(IndexLogic()).selectIndex(1);
                }
                break;
                case 7: {
                  Get.to(ImagePage(
                    title: '工行消费季',
                    image: 'ghxfj',
                    navChange: false,
                    rightStrBtn: "领取记录",
                    right: false,
                  ),);
                }
                break;

                case 8: {
                  Routes.loan.push;
                }
                break;

                case 9: {
                  Get.to(ImagePage(
                    title: '任务中心',
                    image: 'rwzx',
                    navChange: false,
                    right: false,
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
