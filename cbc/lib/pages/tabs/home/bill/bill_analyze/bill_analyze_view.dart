import 'package:cbc/pages/tabs/home/bill/bill_analyze/component/analyze_monthly.dart';
import 'package:cbc/pages/tabs/home/bill/bill_analyze/component/year_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../utils/comm_widget_utils.dart';
import 'bill_analyze_logic.dart';
import 'bill_analyze_state.dart';

class BillAnalyzePage extends BaseStateless {
  BillAnalyzePage({Key? key}) : super(key: key, title: '收支分析');

  final BillAnalyzeLogic logic = Get.put(BillAnalyzeLogic());
  final BillAnalyzeState state = Get.find<BillAnalyzeLogic>().state;

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
    return Column(
      children: [
        orderTabBarBottom(),
        Obx(() => Expanded(
            child: logic.selectName.value == '月度分析'
                ? const AnalyzeMonthly()
                : const YearWidget()
        ),

        )
      ],
    );
  }

  ///* tabBar样式******/
  Widget orderTabBarBottom() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 12.w, top: 12.w),
      alignment: Alignment.centerLeft,
      width: 1.sw,
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: state.tabNameList.map((String name) {
              return Column(
                children: [
                  BaseText(
                    text: name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: logic.selectName.value == name
                          ? Colors.black
                          : const Color(0xff666666),
                      fontWeight: logic.selectName.value == name
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 4.w,
                  ),
                  Container(
                    width: 24.w,
                    height: 3.w,
                    decoration: BoxDecoration(
                        color: logic.selectName.value == name
                            ? Colors.black
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(2.w))),
                  )
                ],
              ).withOnTap(onTap: () {

                if(name == '月度分析'){
                  logic.getData(time: DateFormat('yyyy-MM').format(DateTime.now()));
                  state.monthStr = DateFormat('yyyy年MM月').format(DateTime.now());
                }
                if(name == '年度分析'){
                  logic.getData(time: DateFormat('yyyy').format(DateTime.now()),type: '1');
                  state.yearStr = DateFormat('yyyy年').format(DateTime.now());
                }
                logic.one = true;
                logic.selectName.value = name;
              });
            }).toList(),
          )),
    );
  }
}
