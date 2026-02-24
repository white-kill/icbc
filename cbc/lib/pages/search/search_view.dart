import 'package:cbc/pages/search/search_content/search_content_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'search_logic.dart';
import 'search_state.dart';

class SearchPage extends BaseStateless {
  SearchPage({Key? key}) : super(key: key);

  final SearchLogic logic = Get.put(SearchLogic());
  final SearchState state = Get.find<SearchLogic>().state;

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
            const TextFieldWidget(
              hintText: '输入搜索关键词',
            ).expanded(),
            Image(
              image: 'search_delect'.png3x,
              width: 15.w,
              height: 15.w,
            ),
            SizedBox(width: 8.w,)
          ],
        ),
      );
  @override
  List<Widget>? get rightAction => [
    Container(width: 10.w,)
  ];

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '历史记录',
            ).withPadding(top: 12.w, left: 8.w, bottom: 12.w),
            Wrap(
              direction: Axis.horizontal,
              spacing: 12.w,
              runSpacing: 12.w,
              children: state.nameList.map((e) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ).withOnTap(onTap: () {
                    Get.to(() => Search_contentPage(),arguments: {
                      'name':e,
                    });
                  }),
                );
              }).toList(),
            ).withPadding(left: 8.w),
          ],
        ).withContainer(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.w))),
            margin: EdgeInsets.only(
                left: 12.w, right: 12.w, top: 12.w, bottom: 4.w),
            padding: EdgeInsets.only(
              bottom: 15.w,
            )),
        Image(
          image: 'search1'.png,
          fit: BoxFit.fitWidth,
        ),
        Image(
          image: 'search2'.png,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(
          height: ScreenUtil().statusBarHeight,
        )
      ],
    );
  }
}
