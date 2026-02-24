import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'more_list_logic.dart';
import 'more_list_state.dart';

class MoreListPage extends BaseStateless {
  MoreListPage({Key? key}) : super(key: key, title: '查询明细');

  final MoreListLogic logic = Get.put(MoreListLogic());
  final MoreListState state = Get.find<MoreListLogic>().state;

  @override
  List<Widget>? get rightAction => [
    BaseText(
      text: '我的账户',
      fontSize: 14.sp,
      color: const Color(0xFF607483),
    ).withContainer(
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 12.w),
    ).withOnTap(onTap: (){
    })
  ];

  @override
  Widget initBody(BuildContext context) {
    return Container();
  }
}
