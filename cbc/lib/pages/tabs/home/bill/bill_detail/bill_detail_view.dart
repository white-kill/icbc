
import 'package:cbc/pages/tabs/home/bill/bill_detail/children/yebdtx/view.dart';
import 'package:cbc/utils/widget_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../utils/color_util.dart';
import '../../../../other/sheet_widget/sheet_bottom.dart';
import '../../account/component/copy_card.dart';
import 'bill_detail_cat.dart';
import 'bill_detail_cat1.dart';
import 'bill_detail_logic.dart';
import 'bill_detail_state.dart';
import 'children/kjzfgl/view.dart';

class BillDetailPage extends BaseStateless {
  BillDetailPage({Key? key}) : super(key: key, title: '收支详情');

  final BillDetailLogic logic = Get.put(BillDetailLogic());
  final BillDetailState state = Get.find<BillDetailLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10.w),
      children: [
        Container(
          color: Colors.white,
          height: 100.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildAmountText(
                amount: logic.amount(),
                color: logic.billDetail.type == '1'
                    ? const Color(0xffC34236)
                    : const Color(0xff35827D),
                fontSize: 30.sp,
                numFontWeight: FontWeight.w500,
                symbolFontWeight: FontWeight.w400,
              ),
              SizedBox(height: 0.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseText(
                    text: '余额: ',
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xff6E6E6E),
                        fontWeight: FontWeight.w400),
                  ),
                  buildAmountText(
                    amount: logic.billDetail.accountBalance.bankBalance,
                    color: const Color(0xff6E6E6E),
                    fontSize: 14.sp,
                    numFontWeight: FontWeight.w500,
                    symbolFontWeight: FontWeight.w500,
                  ),
                ],
              )
            ],
          ),
        ),
        Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                String name = state.titleNameList[index];
                if (name == '') {
                  return Column(
                    children: [
                      Container(
                        width: 1.sw,
                        height: 2.w,
                        color: Colors.white,
                      ),
                      Container(
                        width: 1.sw,
                        height: 0.5.w,
                        color: Color(0xffdedede),
                      )
                    ],
                  );
                }


                return GetBuilder(
                  builder: (BillDetailLogic c) {
                    // 构建右侧 Widget
                    Widget rightWidget;
                    if (name == '查询完整交易卡号或账户') {
                      rightWidget = Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          value: logic.show,
                          onChanged: (bool value) async {
                            if (logic.show == false) {
                              await AlterWidget.alterWidget(builder: (context) {
                                return CopyCard(
                                  ck: true,
                                  show: () {
                                    logic.show = !logic.show;
                                    c.update(['updateListItem']);
                                  },
                                );
                              });
                            } else {
                              logic.show = !logic.show;
                              c.update(['updateListItem']);
                            }
                          },
                        ),
                      );
                    } else if (name == '交易金额' || name == '记账金额') {
                      rightWidget = buildAmountText(
                        amount: logic.valueStr(name),
                        color: Colors.black,
                        fontSize: 16.sp,
                      );
                    } else {
                      rightWidget = BaseText(
                        text: logic.valueStr(name),
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: name == '业务摘要' ? BColors.blue1Color : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
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
                                fontSize: 13.5.sp, color: Color(0xff555555)),
                          ),
                          rightWidget,
                        ],
                      ),
                    );
                  },
                  id: 'updateListItem',
                );
              },
              itemCount: logic.showMore.value ? state.titleNameList.length : 7,
            )),
        Container(
          width: 1.sw,
          height: 45.w,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => BaseText(
                    text: logic.showMore.value ? '收起' : '查看全部',
                    style: TextStyle(fontSize: 13.sp, color: Color(0xff777777)),
                  )),
              SizedBox(
                width: 4.w,
              ),
              Obx(() => Image(
                    image:
                        logic.showMore.value ? 'arr_up'.png3x : 'arr_dow'.png3x,
                    width: 9.w,
                    height: 6.w,
                  ))
            ],
          ).withOnTap(onTap: () {
            logic.showMore.value = !logic.showMore.value;
          }),
        ),
        SizedBox(
          height: 10.w,
        ),
        Container(
          width: 1.sw,
          height: 26.w,
          color: Colors.white,
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 14.w),
          child: Row(
            children: [
              BaseText(
                text: '详情设置',
                style: TextStyle(fontSize: 13.sp, color: Color(0xff333333)),
              ),
              SizedBox(
                width: 5.5.w,
              ),
              Image(
                image: 'ic_bill_info'.png3x,
                width: 13.w,
                height: 13.w,
              ),
            ],
          ).withOnTap(onTap: () {
            showDialog(
              context: Get.context!,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: 280.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 15.w),
                        // 标题
                        Text(
                          '详情设置',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xff333333),
                          ),
                        ),
                        SizedBox(height: 5.w),
                        // 内容
                        Container(
                          child: Text(
                            '您可对最近三个自然月的交易明细，进行\n“分类”及“是否纳入收支”设置。',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              // height: 1.4,
                            ),
                            textAlign: TextAlign.start,
                            // maxLines: 5,
                          ),
                          padding: EdgeInsets.only(left: 15.w, right: 12.w),
                        ),
                        SizedBox(height: 20.w),
                        Container(
                          width: double.maxFinite,
                          height: 1,
                          color: Color(0xFF7B7B7B).withAlpha(30),
                        ),
                        // 只有确定按钮
                        Container(
                          width: double.infinity,
                          height: 40.w,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            child: Text(
                              '我知道了',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xffB90B12),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).withOnTap(onTap: () {
                    Navigator.of(context).pop();
                  }),
                );
              },
            );

          }),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _itemWidget(index);
          },
          itemCount: state.nameLis1.length,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              width: 1.sw,
              height: 0.5.w,
              margin: EdgeInsets.only(left: 15.w),
              color: Color(0xffE9E9E9),
            );
          }, //state.list.length,
        ),
        SizedBox(
          height: 10.w,
        ),
        Stack(
          children: [
            Image(image: 'ic_szxq_bottom'.png3x),
            VerticalGridView(
              widgetBuilder: (context, index) {
                return Container().withOnTap(onTap: () {
                  if (index == 0) {
                    Map param = {"card":logic.billDetail.bankCard.maskBankCardNumber()};
                    Get.to(YebdtxPage(cardNo: param["card"],));
                  }
                  if (index == 1) {
                    Routes.printPage.push;
                  }
                  if (index == 2) {
                    Map param = {"card":logic.billDetail.bankCard.maskBankCardNumber()};
                    Get.to(KjzfglPage(cardNo: param["card"],));
                  }
                  if (index == 3) {
                    Get.back();
                  }
                });
              },
              itemCount: 4,
              mainHeight: 60.w,
              crossSpacing: 2,
              spacing: 2,
            ).withPadding(
              top: 40.w,
            )
          ],
        )
      ],
    );
  }

  Widget _itemWidget(int index) {
    String name = state.nameLis1[index];
    if (index == 0) {
      return _contentWidget(
          name,
          Row(
            children: [
              Obx(() => netImage(
                    url: logic.categoryImg.value,
                    width: 22.w,
                    height: 22.w,
                  )),
              SizedBox(
                width: 6.w,
              ),
              Obx(() => BaseText(
                    text: logic.categoryText.value,
                    fontSize: 13.5.sp,
                    color: Color(0xff333333),
                  )),
              Image(
                image: 'ic_jt_right'.png3x,
                width: 18.w,
                height: 18.w,
              ),
            ],
          ).withOnTap(onTap: () {
            SheetBottom.show(
              showTopText: true,
              title: '选择分类',
              child: logic.billDetail.type == '1'?const BillDetailIncome():const BillDetailCat(),
            );
          }));
    }
    if (index == 1) {
      return _contentWidget(
          name,
          Obx(
            () => Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                value: logic.showOpen.value,
                // activeTrackColor: Color.fromARGB(255, 3, 134, 91),
                activeColor:  Color.fromARGB(255, 3, 134, 91),
                onChanged: (bool value) {
                  logic.showOpen.value = value;
                },
              ),
            ),
          ));
    }
    if (index == 2) {
      return Container(
        width: 1.sw,
        color: Colors.white,
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.w,
            ),
            BaseText(
              text: '备注',
              style: TextStyle(fontSize: 13.5.sp, color: Color(0xff999999)),
            ),
            SizedBox(
              height: 10.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFieldWidget(
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14.sp),
                  hintStyle: TextStyle(
                    color: Color(0xff999999),
                    fontSize: 14.sp,
                  ),
                  hintText: '写点击写备注',
                ).withContainer(width: 1.sw - 100.w, height: 40.w),
                Image(
                  image: 'ic_szxq_xj'.png3x,
                  width: 40.w,
                  height: 40.w,
                ).withOnTap(onTap: () {
                  showModalBottomSheet(context: Get.context!, builder: (context) {
                    return Image(image: "bill_detail_camera".png).withOnTap(onTap: () {
                      Get.back();
                    });
                  });
                })
              ],
            ).withContainer(width: 1.sw, height: 40.w),
            Container(
              height: 45.w,
              width: 345.w,
            )
          ],
        ),
      );
    }

    return Container();
  }

  Widget _contentWidget(String name, Widget child) {
    return Container(
      height: 54.w,
      width: 1.sw,
      color: Colors.white,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseText(
            text: name,
            style: TextStyle(fontSize: 13.5.sp, color: Color(0xff999999)),
          ),
          child
        ],
      ),
    );
  }
}
