import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../../../utils/sp_util.dart';
import 'bill_search_logic.dart';
import 'bill_search_state.dart';

class BillSearchPage extends BaseStateless {
  BillSearchPage({Key? key}) : super(key: key);

  final Bill_searchLogic logic = Get.put(Bill_searchLogic());
  final Bill_searchState state = Get.find<Bill_searchLogic>().state;

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
            ).withPadding(left: 12.w, right: 12.w),
            TextFieldWidget(
              controller: state.controller,
              hintText: '搜索关键词',
              onSubmitted: (e) {
                List<String> searchList = searchHistoryValue.split(',');
                if (!searchList.contains(e)) {
                  searchList.add(e);
                }
                searchList.join(',').saveSearchHistory;
                Get.back(result: e);
              },
            ).expanded()
          ],
        ),
      );


  @override
  Color? get background => Colors.white;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '历史记录',
                  style: TextStyle(
                      color: Color(0xff666666)
                  ),
                ),

                Image(image: 'a_delete'.png3x,width: 16.w,height: 16.w,),
              ],
            ).withPadding(top: 20.w, left: 15.w, right: 15.w,bottom: 15.w),
            Wrap(
              direction: Axis.horizontal,
              spacing: 12.w,
              runSpacing: 12.w,
              children: logic.tagList.map((e) {
                return Container(
                  padding:
                  EdgeInsets.symmetric(vertical: 6.w, horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ).withOnTap(onTap: () {
                    Get.back(result: e);
                  }),
                );
              }).toList(),
            ).withPadding(left: 15.w,right: 15.w),
          ],
        )
      ],
    );
  }
}
