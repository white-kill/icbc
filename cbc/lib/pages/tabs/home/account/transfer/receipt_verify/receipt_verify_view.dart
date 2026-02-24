import 'package:cbc/pages/tabs/home/account/transfer/receipt_verify/query_receipt/query_receip_view.dart';
import 'package:cbc/pages/tabs/home/account/transfer/receipt_verify/verify_receipt/verify_receipt_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../../../../utils/comm_widget_utils.dart';
import 'receipt_verify_logic.dart';
import 'receipt_verify_state.dart';

class ReceiptVerifyPage extends BaseStateless {
  ReceiptVerifyPage({Key? key}) : super(key: key,title: '电子回单');

  final Receipt_verifyLogic logic = Get.put(Receipt_verifyLogic());
  final Receipt_verifyState state = Get.find<Receipt_verifyLogic>().state;



  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'ic_nav_service'.png3x,
      width: 20.w,
      height: 20.w,
      color: const Color(0xFF607483),
    )
        .withPadding(right: 20.w)
        .withOnTap(onTap: () => Routes.mineService.push),
    CommWidgetUtils.getMoreIcon(icColor: const Color(0xFF607483)),
  ];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Image(image: 'bg_dzhd'.png3x),

            Container(
              margin: EdgeInsets.only(top: 8.w),
              width: 1.sw,
              height: 50.w,
            ).withOnTap(onTap: (){
              Get.to(() => QueryReceiptPage());
            }),

            Positioned(left: 0,top: 68.w,child: Container(
              width: 1.sw,
              height: 50.w,
            ).withOnTap(onTap: (){
              Get.to(() => VerifyReceiptPage());
            })),
          ],
        )
      ],
    );
  }
}
