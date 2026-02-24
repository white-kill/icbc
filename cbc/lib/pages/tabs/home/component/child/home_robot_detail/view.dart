import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class RobotPage extends BaseStateless {
  RobotPage({Key? key}) : super(key: key);

  final RobotLogic logic = Get.put(RobotLogic());
  final RobotState state = Get
      .find<RobotLogic>()
      .state;

  @override
  // TODO: implement isShowAppBar
  bool get isShowAppBar => false;


  @override
  Widget initBody(BuildContext context) {
    return GetBuilder<RobotLogic>(builder: (logic) {
      if (logic.loading) {
        return
          Image.asset("assets/images/robot_loading.gif");
      }
      else {
        return Column(
          children: [
            Stack(
              children: [
                Image(image: "robot_detail_top".png),
                Positioned(
                  top: 30.w,
                  left: 15.w,
                  child: Icon(Icons.arrow_back_ios_new, color: Colors.white,).withOnTap(onTap: () {
                    Get.back();
                  }), )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Image(image: "robot_detail_content".png),
              ),
            ),
            Image(image: "robot_detail_bottom".png),
          ],
        );
      }

    });



  }
}
