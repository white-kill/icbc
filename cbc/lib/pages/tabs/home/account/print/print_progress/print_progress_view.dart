import 'package:cbc/pages/tabs/home/account/print/print_progress/component/progress_item_widget.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../../../../utils/comm_widget_utils.dart';
import 'print_progress_logic.dart';
import 'print_progress_state.dart';

class PrintProgressPage extends BaseStateless {
  PrintProgressPage({Key? key}) : super(key: key, title: '办理进度');

  final PrintProgressLogic logic = Get.put(PrintProgressLogic());
  final PrintProgressState state = Get.find<PrintProgressLogic>().state;

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
  get refreshController => state.refreshController;

  @override
  void onLoading() {
    super.onLoading();
    state.pageNum++;
    logic.getData();
  }

  @override
  bool get enablePullDown => false;


  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          height: 0.5.w,
          color: const Color(0xffCBCBCB),
        ),

        GetBuilder(builder: (PrintProgressLogic c){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: state.titleName.map((e) {
              if (e == '') {
                return Container(
                  height: 20.w,
                  width: 0.5.w,
                  color: const Color(0xffCBCBCB),
                );
              }

              return Column(
                children: [
                  Container(
                    height: 36.w,
                    alignment: Alignment.center,
                    child: BaseText(
                      text: e + logic.countStr(e),
                      color: logic.selectTypeName == e
                          ? BColors.mainColor
                          : const Color(0xff333333),
                    ),
                  ),
                  Container(
                    height: 2.w,
                    width: 85.w,
                    color: logic.selectTypeName == e
                        ? BColors.mainColor
                        : Colors.white,
                  ),
                ],
              ).withSizedBox(
                  height: 38.w,
                  onTap: () {
                    logic.selectTypeName = e;
                    logic.update(['updateTop','updateUI']);
                  });
            }).toList(),
          ).withContainer(
            color: Colors.white,
            height: 38.w,);
        },id: 'updateTop',),
        GetBuilder(builder: (PrintProgressLogic c){
          return logic.selectTypeName != '已完成'?Container(
            padding: EdgeInsets.only(top: 20.w),
            child: const BaseText(text: '您还没有相关订单',fontSize: 15,),
          ):Expanded(child: refreshWidget(
              child: ListView.builder(
                controller: state.controller,
                itemBuilder: (context, index) {
                  return ProgressItemWidget(model: state.list[index],);
                },
                itemCount: state.list.length,
              )));
        },id: 'updateUI',)
      ],
    );
  }
}
