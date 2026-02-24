import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/net_image_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../utils/color_util.dart';
import '../../bank_list/bank_list_view.dart';
import '../../contacts_list/contants_list_view.dart';
import '../card_transfer_logic.dart';
import '../card_transfer_state.dart';
import 'account_transfer_widget.dart';

class ZhInfo extends StatefulWidget {
  const ZhInfo({super.key});

  @override
  State<ZhInfo> createState() => _ZhInfoState();
}

class _ZhInfoState extends State<ZhInfo> {
  final CardTransferLogic logic = Get.put(CardTransferLogic());
  final CardTransferState state = Get.find<CardTransferLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 188.w,
      color: Colors.white,
      child: Column(
        children: [
          BaseText(
            text: "收款人",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ).withContainer(
            width: 1.sw,
            padding: EdgeInsets.only(top: 12.w, left: 15.w, bottom: 12.w),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transfer.itemCellWidget(
                          title: "户名",
                          hintText: '支持首字母检索',
                          controller: state.nameTextController,
                          // textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: BColors.blue1Color
                          ),
                          hintColor: Color(0xffC7C7C7),
                          onChanged: (v) {
                            state.cardReq.realName = v;
                          },
                          onSubmitted: (v) {
                            logic.update(['updateBottom']);
                          }),
                      Image(
                        image: 'ic_t_lxr'.png3x,
                        width: 24.w,
                        height: 24.w,
                      ).withPadding(right: 16.w).withOnTap(onTap: () {
                        Get.to(() => ContactsListPage())?.then((v) {
                          if (v != null && v is Map) {
                            state.cardInfo = v as Map<String, dynamic>;
                            state.cardReq.bankId = state.cardInfo['id'];
                            state.cardReq.realName = state.cardInfo['name'];
                            state.cardReq.bankName = state.cardInfo['bankName'];
                            state.cardReq.cardNo = state.cardInfo['bankCard'];
                            state.nameTextController.text = state.cardReq.realName;
                            state.accountTextController.text = state.cardReq.cardNo;
                            logic.update(['updateUI', 'updateBottom','updateCard']);
                          }
                        });
                      }),
                    ],
                  ),
                ),
                Container(
                  width: 1.sw,
                  height: 1.w,
                  margin: EdgeInsets.only(left: 15.w),
                  color: const Color(0xffE7E9EB),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Transfer.itemCellWidget(
                        title: "账户",
                        hintText: '支持手机号汇款',
                        keyboardType: TextInputType.datetime,
                        // textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: BColors.blue1Color
                        ),
                        onChanged: (v) {
                          state.cardReq.cardNo = v;
                        },
                        onSubmitted: (v) {
                          logic.update(['updateBottom']);
                        },
                        hintColor: Color(0xffC7C7C7),
                        controller: state.accountTextController,
                        focusNode: state.accountFocusNode,
                      ),
                      Image(
                        image: 'ic_t_kh'.png3x,
                        width: 24.w,
                        height: 24.w,
                      ).withPadding(right: 16.w),
                    ],
                  ),
                ),
                Container(
                  width: 1.sw,
                  height: 1.w,
                  margin: EdgeInsets.only(left: 15.w),
                  color: const Color(0xffE7E9EB),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BaseText(
                            text: '收款银行',
                            fontSize: 16.sp,
                            color: Color(0xff333333),
                          ).withContainer(
                            width: 108.w,
                            height: 45.w,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 15.w, top: 2.w),
                          ),
                          GetBuilder(
                            builder: (CardTransferLogic c) {
                              return state.cardInfo['bankName'] == ''
                                  ? BaseText(
                                      text: '请选择银行',
                                      fontSize: 14.sp,
                                      color: const Color(0xffC7C7C7),
                                    ).withContainer(
                                      width: 210.w,
                                      // alignment: Alignment.centerRight,
                                    )
                                  : Row(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // NetImageWidget(
                                        //   url: state.cardInfo['icon'],
                                        //   width: 18.w,
                                        //   height: 18.w,
                                        // ),
                                        SizedBox(width: 4.w),
                                        BaseText(
                                          text: state.cardInfo['bankName'],
                                          fontSize: 14.sp,
                                          color: BColors.blue1Color,
                                        ),
                                      ],
                                    ).withContainer(
                                      width: 210.w,
                                      alignment: Alignment.centerRight,
                                    );
                            },
                            id: 'updateCard',
                          )
                        ],
                      ),
                      Image(
                        image: 'ic_jt_right'.png3x,
                        width: 24.w,
                        height: 24.w,
                      ).withPadding(right: 16.w),
                    ],
                  ).withOnTap(onTap: () {
                    FocusScope.of(context).unfocus();
                    Get.to(() => BankListPage())?.then((v) {
                      if (v != null && v is Map) {
                        state.cardInfo['icon'] = v['icon'];
                        state.cardInfo['bankName'] = v['bankName'];
                        // state.cardInfo['id'] =  v['id'];
                        state.cardReq.bankId = v['id'];
                        state.cardReq.bankName = v['bankName'];
                        logic.update(['updateCard', 'updateBottom']);
                      }
                    });
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
