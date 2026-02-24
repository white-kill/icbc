import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'logic.dart';
import 'state.dart';

class FxgdPage extends BaseStateless {
  FxgdPage({Key? key}) : super(key: key, title: "发现跟多服务");

  final FxgdLogic logic = Get.put(FxgdLogic());
  final FxgdState state = Get.find<FxgdLogic>().state;


  @override
  // TODO: implement rightAction
  List<Widget>? get rightAction => [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("恢复默认", style: TextStyle(
            color: Color(0xFF5E7584),
            fontSize: 15.sp
        ),)
      ],
    )
  ];


  @override
  // TODO: implement bottomNav
  Widget? get bottomNav => Container(
    child: Image(image: 'sy_fxgdfw_bottom'.png, width: 1.sw, fit: BoxFit.fitWidth,),
  );


  @override
  Widget initBody(BuildContext context) {
    // TODO: implement initBody
    return SingleChildScrollView(
      child: Column(
        children: [
          Image(image: 'sy_fxgdfw_1'.png, width: 1.sw, fit: BoxFit.fitWidth,),
          Image(image: 'sy_fxgdfw_2'.png, width: 1.sw, fit: BoxFit.fitWidth,),
          Image(image: 'sy_fxgdfw_3'.png, width: 1.sw, fit: BoxFit.fitWidth,),
          Image(image: 'sy_fxgdfw_4'.png, width: 1.sw, fit: BoxFit.fitWidth,),
          Image(image: 'sy_fxgdfw_5'.png, width: 1.sw, fit: BoxFit.fitWidth,),
          Image(image: 'sy_fxgdfw_6'.png, width: 1.sw, fit: BoxFit.fitWidth,),
          Image(image: 'sy_fxgdfw_7'.png, width: 1.sw, fit: BoxFit.fitWidth,),
          Image(image: 'sy_fxgdfw_8'.png, width: 1.sw, fit: BoxFit.fitWidth,),
          Image(image: 'sy_fxgdfw_9'.png, width: 1.sw, fit: BoxFit.fitWidth,),
        ],
      )
    );
  }
}
