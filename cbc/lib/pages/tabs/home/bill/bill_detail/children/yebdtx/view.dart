import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class YebdtxPage extends BaseStateless {
  YebdtxPage({Key? key, this.cardNo}) : super(key: key, title: "余额变动定制");

  final YebdtxLogic logic = Get.put(YebdtxLogic());
  final YebdtxState state = Get.find<YebdtxLogic>().state;

  String? cardNo = "";
  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image(image: 'yebdtx'.png),
            Positioned(
              left: 15.w,
              top: 87.w,
              child:
            Text(cardNo ?? "", style: TextStyle(
                fontSize: 13.w,
                color: Colors.black
            ),),)
          ],
        )

      ],
    );
  }
}
