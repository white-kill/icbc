import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../../../../../config/app_config.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../../../utils/abc_button.dart';
import '../../../../../../utils/comm_widget_utils.dart';
import 'other_transfer_logic.dart';
import 'other_transfer_state.dart';

class OtherTransferView extends BaseStateless {
  OtherTransferView({Key? key}) : super(key: key, title: '他行转入');

  final OtherTransferLogic logic = Get.put(OtherTransferLogic());
  final OtherTransferState state = Get.find<OtherTransferLogic>().state;

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
    return ListView.separated(
        padding: EdgeInsets.only(top: 6.w),
        itemBuilder: (context, index) {
          String title = state.titleNames[index];
          if(title == 'bottom'){
            return Column(
              children: [
                AbcButton(
                  title: '下一步',
                  height: 48.w,
                  radius: 6.w,
                  onTap: () {

                  },
                  margin: EdgeInsets.only(left: 12.w, right: 12.w,top: 25.w),
                ),
                SizedBox(height: 40.w,),

                Row(
                  children: [
                    Container(
                      width: 130.w,
                      height: 0.5.w,
                      color: Color(0xffD3D3D3),
                    ),
                    SizedBox(width: 16.w,),
                    BaseText(text: '温馨提示',style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(width: 16.w,),
                    Container(
                      width: 130.w,
                      height: 0.5.w,
                      color: Color(0xffD3D3D3),
                    ),
                  ],
                ).withPadding(
                    left: 13.w,right: 13.w,bottom: 12.w
                ),
                BaseText(text: '由于他行限制单笔资金转出限额，该笔转账可能会因为资金超限导致失败，具体限额请咨询对方银行。',
                  style: TextStyle(
                      color: Color(0xff393939),
                      height: 1.8,
                      fontSize: 14.sp
                  ),
                  maxLines: 20,
                ).withPadding(left: 14.w,right: 14.w)
              ],
            );
          }
          return _itemWidget(title, index);
        },
        separatorBuilder: (context, index) {
          return Container(
            width: 1.sw,
            height: state.titleNames[index] == '收款银行' ||
                    state.titleNames[index] == '汇款金额'
                ? 10.w
                : 0.8.w,
            color: const Color(0xFFF5F5F5),
          );
        },
        itemCount: state.titleNames.length);
  }

  Widget _itemWidget(String name, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  children: [
                    BaseText(
                      text: name,
                      fontSize: 14.sp,
                      color: Color(0xff333333),
                    ),
                    name == '汇款金额'
                        ? TextFieldWidget(
                            hintText: '请输入汇款金额',
                          ).withContainer(
                            width: 200.w,
                            height: 32.w,
                            padding: EdgeInsets.only(left: 12.w))
                        : SizedBox.shrink()
                  ],
                ).withContainer(width: name == '汇款金额' ? 1.sw - 50.w : 70.w),
                _rightWidget(index),
              ],
            ),
            name == '汇款金额'
                ? Image(
                    image: 'msxf'.png3x,
                    width: 60.w,
                    height: 18.w,
                  )
                : SizedBox.shrink()
          ],
        ),
      ],
    ).withContainer(
        padding: EdgeInsets.only(left: 18.w, right: 12.w),
        color: Colors.white,
        height: name == '汇款金额' ? 60.w : 42.w,
        alignment: Alignment.center);
  }

  Widget _rightWidget(int index) {
    if (index == 0)
      return BaseText(
          text: maskFirstChar(AppConfig.config.abcLogic.memberInfo.realName));
    if (index == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BaseText(
            text: AppConfig.config.abcLogic.card(),
            color: Colors.blueAccent,
          ),
          Image(
            image: 'ic_jt_right'.png3x,
            width: 25.w,
            height: 25.w,
          ),
        ],
      ).withContainer(width: 1.sw - 102.w);
    }
    if (index == 2) return const BaseText(text: '中国工商银行');
    if (index == 4)
      return const BaseText(
        text: '实时汇款',
        color: Color(0xff676767),
      );
    if (index == 5) {
      return const BaseText(
        text: '没有符合条件的卡/账号',
        color: Colors.blueAccent,
      ).withContainer(width: 1.sw - 102.w, alignment: Alignment.centerRight);
    }
    if (index == 6) {
      return Container(
        width: 1.sw - 102.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BaseText(
              text: '（可选）',
              color: Color(0xff879499),
            ),
            Row(
              children: [
                BaseText(
                  text: '短信通知',
                  fontSize: 13.sp,
                  color: Color(0xff333333),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Obx(() =>Icon(
                  logic.check.value
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank,
                  size: 20.sp,
                  color: Color(0xffCE0000),
                ).withOnTap(onTap: (){
                  logic.check.value = !logic.check.value;
                }))
              ],
            )
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  String maskFirstChar(String input) {
    if (input.isEmpty) return input;
    return '*' + input.substring(1);
  }
}
