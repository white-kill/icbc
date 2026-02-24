import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../../routes/app_pages.dart';
import '../print_progress_detail_view.dart';
import 'print_progress_info_logic.dart';
import 'print_progress_info_state.dart';

class Print_progress_infoPage extends BaseStateless {
  Print_progress_infoPage({Key? key}) : super(key: key, title: '进度详情');

  final Print_progress_infoLogic logic = Get.put(Print_progress_infoLogic());
  final Print_progress_infoState state =
      Get.find<Print_progress_infoLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 8.w),
      children: [
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            String name = state.titleNames[index];
            if (name == '') {
              return Container(
                height: 10.w,
              );
            }
            return Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                  left: 12.w, top: 6.w, bottom: 8.w, right: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    text: name,
                    style:
                        TextStyle(fontSize: 13.5.sp, color: Color(0xff666666)),
                  ),
                  BaseText(
                    text: logic.valueStr(name),
                    style:
                        TextStyle(fontSize: 13.5.sp, color: Color(0xff666666)),
                  )
                ],
              ),
            );
          },
          itemCount: state.titleNames.length,
        ),
        SizedBox(
          height: 10.w,
        ),
        Container(
          width: 1.sw,
          height: 150.w,
          color: Colors.white,
          child: Row(
            children: [
              Column(
                children: [
                  BaseText(
                    text: '2025-08-23\n18:03',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 12.sp, color: Color(0xff666666)),
                  ).withContainer(alignment: Alignment.centerRight,width: 100.w).expanded(),
                  BaseText(
                    text: '2025-08-23\n18:03',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 12.sp, color: Color(0xff666666)),
                  ).withContainer(alignment: Alignment.centerRight,width: 100.w).expanded()
                ],
              ),

              SizedBox(width: 15.w,),
              Column(
                children: [
                  SizedBox(height: 27.5.w,),
                  Icon(Icons.check_circle,size: 20.w,color: Color(0xffF35855),),
                  Container(height: 55.w,width: 1.w,color:Color(0xffF35855),),
                  Icon(Icons.check_circle,size: 20.w,color: Color(0xffF35855),)
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 27.5.w,),
                  BaseText(text: '已发送'),
                  Container(height: 55.w,
                    alignment: Alignment.center,
                    child: Container(
                    width: 200.w,
                    height: 1.w,
                    color: Color(0xffdedede),
                  ),),
                  BaseText(text: '已下单'),
                ],
              ).withPadding(left: 12.w),
            ],
          ),
        ),
        Container(
          height: 62.w,
          width: 1.sw,
          margin: EdgeInsets.only(
            top: 10.w,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: Container(
                  height: 42.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2.w)),
                    border: Border.all(color: Color(0xffF35855), width: 1.w),
                  ),
                  child: BaseText(
                    text: '再办一笔',
                    color: const Color(0xffF35855),
                    fontSize: 16.sp,
                  ),
                ).withOnTap(
                  onTap: () {
                    Routes.printPage.push;
                  },
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Expanded(
                child: Container(
                  height: 42.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xffF35855),
                    borderRadius: BorderRadius.circular(2.w),
                  ),
                  child: BaseText(
                    text: '订单详情',
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ).withOnTap(
                  onTap: () {
                    Get.offAndToNamed(Routes.printProgressDetailPage,arguments: {
                      'model':logic.model
                    });
                  },
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
            ],
          ),
        )
      ],
    );
  }
}
