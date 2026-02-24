import 'package:cbc/pages/tabs/home/account/account_detail/more_query/more_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../../../../utils/comm_widget_utils.dart';
import 'more_query_logic.dart';
import 'more_query_state.dart';

class MoreQueryPage extends BaseStateless {
  MoreQueryPage({Key? key}) : super(key: key,title: '查询明细');

  final More_queryLogic logic = Get.put(More_queryLogic());
  final More_queryState state = Get.find<More_queryLogic>().state;


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

    return const MoreWidget();
  }
}
