import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../config/abc_config/cbc_logic.dart';
import 'logic.dart';
import 'state.dart';

class KjzfglPage extends BaseStateless {
  KjzfglPage({Key? key, this.cardNo}) : super(key: key, title: "快捷支付管理");

  final KjzfglLogic logic = Get.put(KjzfglLogic());
  final KjzfglState state = Get.find<KjzfglLogic>().state;

  String? cardNo = "";
  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image(image: 'kjzfgl'.png),
            Positioned(
                left: 80.w,
                top: 27.w,
                child: GetBuilder(builder: (CbcLogic c){
              return Row(
                children: [
                  BaseText(
                    text: c.memberInfo.city,
                    color: Colors.black,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      height: 1.0
                    ),
                  )
                ],
              );
            },id: 'updateUI',)),
            Positioned(
              left: 80.w,
              top: 42.w,
              child:
              Text(cardNo ?? "", style: TextStyle(
                  fontSize: 13.w,
                  color: Colors.black,
                fontWeight: FontWeight.bold
              ),),)
          ],
        )

      ],
    );
  }
}
