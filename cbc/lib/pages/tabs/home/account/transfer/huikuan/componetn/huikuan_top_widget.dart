import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../config/app_config.dart';
import '../../../../../../other/sheet_widget/sheet_bottom.dart';
import '../../../../bill/bill_search/bill_search_view.dart';
import '../huikuan_logic.dart';
import '../huikuan_state.dart';
import 'filter_time_widget.dart';
import 'filter_widget.dart';

class HuikuanTopWidget extends StatefulWidget {
  const HuikuanTopWidget({super.key});

  @override
  State<HuikuanTopWidget> createState() => _HuikuanTopWidgetState();
}

class _HuikuanTopWidgetState extends State<HuikuanTopWidget> {
  final HuikuanLogic logic = Get.put(HuikuanLogic());
  final HuikuanState state = Get.find<HuikuanLogic>().state;
  String accountTitle = '全部账户';

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 85.w,
      width: 1.sw,
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Column(
        children: [

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
                      state.transferData.pageNum = 1;
                      state.transferData.keyword = v;
                      logic.getData().then((v){
                        state.controller.jumpTo(0);
                      });
                    }
                  });
                })
              ],
            ),
          ),
          SizedBox(
            height: 12.w,
          ),
          GetBuilder(
            builder: (HuikuanLogic c) {
              return Row(
                children: [
                  _tagWidget(
                    accountTitle,
                    color: accountTitle == '全部账户'
                        ? Colors.black
                        : const Color(0xffF35855),
                  ).withOnTap(onTap: () {
                    _selectAccount((v) {
                      accountTitle = v;
                      setState(() {});
                    });
                  }),
                  SizedBox(
                    width: 20.w,
                  ),
                  _tagWidget('筛选',
                          color: const Color(0xffF35855),
                          child: logic.filterCont == 0
                              ? null
                              : Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(top: 1.2.w),
                                  margin: EdgeInsets.only(left: 2.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.w)),
                                      border: Border.all(
                                          color: const Color(0xffF35855),
                                          width: 1.w)),
                                  width: 15.w,
                                  height: 15.w,
                                  child: BaseText(
                                    text: logic.filterCont.toString(),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xffF35855),
                                      height: 1,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ))
                      .withOnTap(onTap: () {
                    SheetBottom.show(
                      title: '筛选',
                      leftWidget: Image(
                        image: 'ic_jt_left'.png3x,
                        width: 25.w,
                        height: 25.w,
                      ),
                      child: const FilterWidget(),
                    );
                  }),
                  SizedBox(
                    width: 15.w,
                  ),
                  _tagWidget(timeTitle(),color: const Color(0xffF35855),).withOnTap(onTap: (){
                    SheetBottom.show(
                      title: '选择时间',
                      leftWidget: Image(
                        image: 'ic_jt_left'.png3x,
                        width: 25.w,
                        height: 25.w,
                      ),
                      child: const FilterTimeWidget(),
                    );
                  }),
                ],
              );
            },
            id: 'upDateTopWidget',
          ),
          SizedBox(
            height: 12.w,
          ),
        ],
      ),
    );
  }

  String timeTitle(){

    if(state.isMonth){
      return '${state.transferData.beginTime}\n${state.transferData.endTime}';
    }else{
      if(state.selTimeTag.isEmpty){
        return '${state.transferData.beginTime}\n${state.transferData.endTime}';
      }else{
        return state.selTimeTag.first;
      }
    }
  }

  Widget _tagWidget(String content, {Color? color, Widget? child}) {
    return Row(
      children: [
        Row(
          children: [
            BaseText(
              text: content,
              color: color ?? Color(0xff333333),
            ),
            child ?? SizedBox.shrink(),
          ],
        ),
        SizedBox(
          width: 4.w,
        ),
        Image(
          image: 'arr_dow'.png3x,
          width: 6.w,
          height: 6.w,
          color: Colors.black,
        ),
      ],
    );
  }

  void _selectAccount(callBack) {
    SheetBottom.show(
      title: '账户选择',
      leftWidget: Image(
        image: 'ic_jt_left'.png3x,
        width: 25.w,
        height: 25.w,
      ),
      rightWidget: const BaseText(
        text: '全部账户',
        color: Color(0xFF2962FF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Obx(() => Icon(
                    !logic.isSelectCard.value
                        ? Icons.check_box_outline_blank
                        : Icons.check_box_outlined,
                    color: const Color(0xffF35855),
                    size: 24.w,
                  )),
              SizedBox(width: 10.w),
              Image(
                image: 'ic_gs_card'.png3x,
                width: 45.w,
                height: 35.w,
              ),
              SizedBox(width: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: '借记卡(I类)',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 6.w,
                  ),
                  BaseText(text: AppConfig.config.abcLogic.card())
                ],
              )
            ],
          ).withOnTap(onTap: () {
            logic.isSelectCard.value = !logic.isSelectCard.value;
            setState(() {});
          }),
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
                    height: 40.w,
                    alignment: Alignment.center,
                    child: BaseText(
                      text: '重置',
                      color: Color(0xffF35855),
                      fontSize: 16.sp,
                    ),
                  ).withOnTap(
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xffF35855),
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: BaseText(
                      text: '确定',
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ).withOnTap(
                    onTap: () {
                      Get.back();
                      String title = logic.isSelectCard.value
                          ? '尾号${AppConfig.config.abcLogic.cardFour()}'
                          : '全部账户';
                      callBack(title);
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
      ).withContainer(
          height: 200.w, padding: EdgeInsets.only(left: 15.w, top: 12.w)),
    );
  }
}
