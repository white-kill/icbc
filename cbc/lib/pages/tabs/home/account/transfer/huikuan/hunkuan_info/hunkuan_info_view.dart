import 'package:cbc/pages/tabs/home/account/transfer/huikuan/receipt/receipt_view.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import '../../../../../../../routes/app_pages.dart';
import '../../../../../../../utils/abc_button.dart';
import '../../../../../../../utils/comm_widget_utils.dart';
import 'hunkuan_info_logic.dart';
import 'hunkuan_info_state.dart';

class Hunkuan_infoPage extends BaseStateless {
  Hunkuan_infoPage({Key? key}) : super(key: key, title: '汇款明细');

  final Hunkuan_infoLogic logic = Get.put(Hunkuan_infoLogic());
  final Hunkuan_infoState state = Get.find<Hunkuan_infoLogic>().state;

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
    return ListView(
      padding: EdgeInsets.only(top: 4.w),
      children: [
        Container(
          color: Colors.white,
          height: 140.w,
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseText(
                    text: '转给${logic.model.oppositeName}',
                    style: TextStyle(
                        fontSize: 16.sp,
                        // color: Color(0xff4D545E),
                        fontWeight: FontWeight.bold),
                  ),
                  BaseText(
                    text: logic.model.amount.bankBalance,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff35827D),
                    ),
                  ),
                ],
              ).expanded(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: const Color(0xff35827D),
                        size: 20.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      BaseText(
                        text: '交易成功',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.sp),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      BaseText(
                        text: '进度详情',
                        color: Color(0xff666666),
                      ),
                      Image(
                        image: 'ic_jt_right'.png3x,
                        width: 25.w,
                        height: 25.w,
                      )
                    ],
                  ),
                ],
              ).withContainer(
                  width: 1.sw,
                  height: 45.w,
                  padding: EdgeInsets.only(left: 10.w, right: 4.w)),
              Container(
                width: 1.sw,
                height: 0.5.w,
                color: const Color(0xffdedede),
              )
            ],
          ),
        ),
        GetBuilder(
          builder: (Hunkuan_infoLogic c) {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String name = state.titleNameList[index];
                if (name == '') {
                  return Column(
                    children: [
                      Container(
                        width: 1.sw,
                        height: 6.w,
                        color: Colors.white,
                      ),
                      Container(
                        width: 1.sw,
                        height: 0.5.w,
                        color: const Color(0xffdedede),
                      ),
                      Container(
                        width: 1.sw,
                        height: 6.w,
                        color: Colors.white,
                      ),
                    ],
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
                        style: TextStyle(
                            fontSize: 13.5.sp, color: Color(0xff777777)),
                      ),
                      BaseText(
                        text: logic.valueStr(name),
                        style: TextStyle(fontSize: 13.5.sp),
                      )
                    ],
                  ),
                );
              },
              itemCount: logic.showAll.value ? state.titleNameList.length : 9,
            );
          },
          id: 'updateList',
        ),
        Container(
          color: Colors.white,
          width: 1.sw,
          height: 50.w,
          child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseText(
                    text: logic.showAll.value ? '收起' : '展开',
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Image(
                    image:
                        logic.showAll.value ? 'arr_up'.png3x : 'arr_dow'.png3x,
                    width: 12.w,
                    height: 12.w,
                  ),
                ],
              ).withOnTap(onTap: () {
                logic.showAll.value = !logic.showAll.value;
                logic.update(['updateList']);
              })),
        ),
        SizedBox(
          height: 20.w,
        ),
        AbcButton(
          title: '再次汇款',
          bgColor: BColors.mainColor,
          radius: 6.w,
          height: 45.w,
          onTap: () {
            Get.toNamed(Routes.cardTransferPage, arguments: {
              'cardInfo': {
                'icon': logic.model.icon,
                'bankName': logic.model.oppositeBankName,
                'id': logic.model.oppositeBankId,
                'name': logic.model.oppositeName,
                'bankCard': logic.model.oppositeAccount,
              },
            });
          },
          margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 10.w),
        ),
        AbcButton(
          title: '电子回单',
          titleColor: BColors.mainColor,
          bgColor: Colors.white,
          border: Border.all(color: BColors.mainColor, width: 1),
          radius: 6.w,
          height: 45.w,
          onTap: () async {
            Get.to(() => ReceiptPage(), arguments: {
              'model': logic.model,
            });

          },
          margin: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 6.w),
        ),
        SizedBox(
          height: 38.w,
        ),
        Row(
          children: [
            Container(
              width: 130.w,
              height: 0.5.w,
              color: Color(0xffD3D3D3),
            ),
            SizedBox(
              width: 16.w,
            ),
            BaseText(
              text: '温馨提示',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Container(
              width: 130.w,
              height: 0.5.w,
              color: Color(0xffD3D3D3),
            ),
          ],
        ).withPadding(left: 13.w, right: 13.w, bottom: 12.w),
        BaseText(
          text: '1.*手续费:个人转账汇款手续费'
              '\n2.支持查询最长五年内的汇款明细、电子回单，如有需要请及时下载回单。',
          style:
              TextStyle(color: Color(0xff333436), height: 1.8, fontSize: 14.sp),
          maxLines: 100,
        ).withPadding(left: 14.w, right: 14.w),
        SizedBox(height: ScreenUtil().bottomBarHeight + 25.w),
      ],
    );
  }
}
