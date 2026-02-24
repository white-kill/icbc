import 'package:cbc/pages/tabs/home/bill/bill_search/bill_search_view.dart';
import 'package:cbc/pages/tabs/home/bill/component/bill_top_tongji_widget.dart';
import 'package:cbc/utils/visibility_duration.dart';
import 'package:easy_sticky_header/easy_sticky_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../config/model/pay_ment_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/comm_widget_utils.dart';
import 'bill_detail/bill_detail_view.dart';
import 'bill_logic.dart';
import 'bill_state.dart';
import 'component/bill_item_month.dart';
import 'component/bill_item_widget.dart';
import 'component/bill_page_top_widget.dart';

class BillPage extends BaseStateless {
  BillPage({Key? key}) : super(key: key);

  final BillLogic logic = Get.put(BillLogic());
  final BillState state = Get.find<BillLogic>().state;

  @override
  List<Widget>? get rightAction => [
        Image(
          image: 'ic_nav_service'.png3x,
          width: 20.w,
          height: 20.w,
          color: const Color(0xFF607483),
        ).withPadding(right: 20.w)
            .withOnTap(onTap: () => Routes.mineService.push),
        CommWidgetUtils.getMoreIcon(icColor: const Color(0xFF607483)),
      ];

  @override
  void onLoading() {
    super.onLoading();
    state.billReq.pageNum++;
    logic.getData();
  }

  @override
  bool get enablePullDown => false;

  @override
  Widget? get titleWidget => Container(
        width: 1.sw,
        height: 30.w,
        margin: EdgeInsets.only(right: 15.w),
        decoration: BoxDecoration(
            color: Color(0xffF5F5F5),
            borderRadius: BorderRadius.all(Radius.circular(15.w))),
        child: Row(
          children: [
            Image(
              image: 'ic_search_left'.png3x,
              width: 15.w,
              height: 15.w,
            ).withPadding(left: 12.w,right: 12.w),
            TextFieldWidget(
              hintText:'搜索关键词',
              enabled: false,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
              ),
              controller: state.searchController,
            ).expanded(onTap: (){
              Get.to(() => BillSearchPage())?.then((v){
                if(v != null){
                  state.searchController.text = v;
                  state.billReq.pageNum = 1;
                  state.billReq.keyword = v;
                  state.billReq.endPageTime = '';
                  logic.getData().then((v){
                    try {
                      state.scrollController.jumpTo(0);
                      state.scrollController1.jumpTo(0);
                    }catch(e){
                      print(e);
                    }
                  });
                }
              });
            })
          ],
        ),
      );

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        const BillPageTopWidget(),
        const BillTopTongjiWidget(),
        GetBuilder(
          builder: (BillLogic c) {
            return logic.listViewType()
                ? Expanded(
                    child: StickyHeader(
                    child: refreshWidget(
                      controller: state.refreshController1,
                      child: ListView.builder(
                        itemCount: state.list.length,
                        controller: state.scrollController1,
                        itemBuilder: (context, index) {
                          PayMentList model = state.list[index];
                          if (model.day != '') {
                            return StickyContainerWidget(
                              index: index,
                              child: Container(
                                color: const Color(0xffF4F4F4),
                                padding: const EdgeInsets.only(left: 16.0),
                                alignment: Alignment.centerLeft,
                                width: 1.sw,
                                height: 35.w,
                                child: BaseText(text: model.day),
                              ),
                            );
                          }
                          return BillItemWidget(
                            model: model,
                          ).withOnTap(onTap: () {
                            Get.to(() => BillDetailPage(),
                                arguments: {'model': model.billDetail});
                          });
                        },
                      ),
                    ),
                  ))
                : Expanded(
                    child: refreshWidget(
                        controller: state.refreshController,
                        child: (state.list.isEmpty && state.mTime != '')
                            ? Container(
                                height: 1.sh,
                                color: Colors.white,
                                alignment: Alignment.topCenter,
                                padding: EdgeInsets.only(top: 100.w),
                                child: Image(image: 'm_no_data'.png),
                              )
                            : ListView.builder(
                                controller: state.scrollController,
                                itemBuilder: (context, index) {
                                  PayMentList model = state.list[index];
                                  if (model.day != '') {
                                    return VisibilityDuration(
                                      keyId: model.day,
                                      onVisibleForDuration: (String text) {
                                        state.monthTopString = text;
                                        state.incomeTotalMonth =
                                            model.incomeTotal;
                                        state.expensesTotalMonth =
                                            model.expensesTotal;
                                        logic.update(['updateNoFilterList']);
                                      },
                                      child: BillItemMonth(
                                        model: model,
                                      ),
                                    );
                                  }
                                  return BillItemWidget(
                                    model: model,
                                  ).withOnTap(onTap: () {
                                    Get.to(() => BillDetailPage(),
                                        arguments: {'model': model.billDetail});
                                  });
                                },
                                itemCount: state.list.length,
                              )));
          },
          id: 'updateUI',
        )
      ],
    );
  }
}
