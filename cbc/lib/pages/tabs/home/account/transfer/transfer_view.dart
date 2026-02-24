import 'package:cbc/pages/tabs/home/account/transfer/component/transfer_contacts_widget.dart';
import 'package:cbc/pages/tabs/home/account/transfer/component/transfer_function_widget.dart';
import 'package:cbc/pages/tabs/home/account/transfer/component/transfer_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../utils/comm_widget_utils.dart';
import 'transfer_logic.dart';
import 'transfer_state.dart';

class TransferPage extends BaseStateless {
  TransferPage({Key? key}) : super(key: key,title: '转账汇款');

  final TransferLogic logic = Get.put(TransferLogic());
  final TransferState state = Get.find<TransferLogic>().state;

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
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children:  [
        TransferTopWidget(),
        TransferFunctionWidget(),
        TransferContactsWidget(),
      ],
    );
  }
}
