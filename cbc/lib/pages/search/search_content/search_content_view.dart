import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'search_content_logic.dart';
import 'search_content_state.dart';

class Search_contentPage extends BaseStateless {
  Search_contentPage({Key? key}) : super(key: key);

  final Search_contentLogic logic = Get.put(Search_contentLogic());
  final Search_contentState state = Get
      .find<Search_contentLogic>()
      .state;

  @override
  Widget? get titleWidget =>
      Container(
        width: 1.sw,
        height: 30.w,
        margin: EdgeInsets.only(right: 15.w),
        decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
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
              style: TextStyle(
                  color: Color(0xff3266DE),
                  fontSize: 14.sp
              ),
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
  List<Widget>? get rightAction =>
      [
        Container(width: 10.w,)
      ];


  @override
  Widget initBody(BuildContext context) {
    return GetBuilder<Search_contentLogic>(builder: (logic) {
      return Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: buildFunction(),
          ),
          Positioned(
              top: 0.w,
              left: 0.w,
              child: Container(
                height: 50.w,
                width: 1.sw,
                child: Row(
                  children: [
                    Expanded(child: Container().withOnTap(onTap: () {
                      logic.index = 0;
                      logic.update();
                    })),
                    Expanded(child: Container().withOnTap(onTap: () {
                      logic.index = 1;
                      logic.update();
                    })),
                    Expanded(child: Container().withOnTap(onTap: () {
                      logic.index = 2;
                      logic.update();
                    })),
                    Expanded(child: Container().withOnTap(onTap: () {
                      logic.index = 3;
                      logic.update();
                    })),
                    Expanded(child: Container().withOnTap(onTap: () {
                      logic.index = 4;
                      logic.update();
                    })),
                  ],
                ),
              ))
        ],
      );
    });
  }

  buildFunction() {
    if (logic.index == 0) {
      return widget0();
    }
    else if (logic.index == 1) {
      return widget1();

    }
    else if (logic.index == 2) {
      return widget2();

    }
    else if (logic.index == 3) {
      return widget3();

    }
    else if (logic.index == 4) {
      return widget4();
    }
  }

  List<Widget> widget0() {
    return [
      Stack(
        children: [
          Image(image: logic
              .image1()
              .png3x),
          Container(
            margin: EdgeInsets.only(top: 95.w, left: 15.w, right: 15.w),
            height: 186.w,
            child: Column(
              children: [
                Container().expanded(onTap: () => logic.jumpPage(1)),
                Container().expanded(onTap: () => logic.jumpPage(2)),
                Container().expanded(onTap: () => logic.jumpPage(3)),
              ],
            ),
          )
        ],
      ),
      Image(image: logic
          .image2()
          .png3x)
    ];
  }

  List<Widget> widget1() {
    return [
      Image(image: "search_1".png)
    ];
  }

  List<Widget> widget2() {
    return [
      Image(image: "search_2".png)
    ];
  }

  List<Widget> widget3() {
    return [
      Image(image: "search_3".png)
    ];
  }

  List<Widget> widget4() {
    return [
      Image(image: "search_4".png)
    ];
  }

}
