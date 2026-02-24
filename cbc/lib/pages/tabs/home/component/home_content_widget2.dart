import 'package:cbc/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../../other/sheet_widget/sheet_bottom.dart';
import '../home_logic.dart';

class HomeContentWidget2 extends StatefulWidget {
  const HomeContentWidget2({super.key});

  @override
  State<HomeContentWidget2> createState() => _HomeContentWidget2State();
}

class _HomeContentWidget2State extends State<HomeContentWidget2> {
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
              image: 'home_content2_1'.png3x,
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

        Image(image:  'home_content2_2'.png3x,),

      ],
    );
  }

}
