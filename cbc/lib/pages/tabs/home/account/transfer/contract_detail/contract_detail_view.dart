import 'package:cbc/generated/assets.dart';
import 'package:cbc/utils/clean_text_field.dart';
import 'package:cbc/utils/stack_position.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/net_image_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import '../../../../../../config/model/contacts_model.dart';
import '../../../../../../config/model/transfer_page_model.dart';
import '../fast_transfer/fast_transfer_view.dart';
import '../huikuan/hunkuan_info/hunkuan_info_view.dart';
import 'contract_detail_logic.dart';

class ContractDetailPage extends BaseStateless {
  ContractDetailPage({Key? key}) : super(key: key, title: '收款人详情');

  final ContractDetailLogic logic = Get.put(ContractDetailLogic());

  @override
  Widget initBody(BuildContext context) {
    StackPosition position = StackPosition(designWidth: 1080, designHeight: 2154, deviceWidth: 1.sw);

    
    return SingleChildScrollView(
      child: Stack(
        children: [
          // 背景图片
          Column(
            children: [
             Image.asset(
               Assets.imagesContractorDetail,
               fit: BoxFit.fitWidth,
             ),
             Transform.translate(
               offset: Offset(0, -position.getX(1130)), // 向上移动，负值表示向上
               child: GetBuilder<ContractDetailLogic>(
                 id: 'updateList',
                 builder: (c) {
                   if (logic.state.list.isEmpty) {
                     return Center(
                       child: Text(
                         '暂无交易记录',
                         style: TextStyle(
                           fontSize: 14.sp,
                           color: Color(0xFF999999),
                         ),
                       ),
                     );
                   }
                   return ListView.builder(
                     controller: logic.state.controller,
                     shrinkWrap: true,
                     physics: NeverScrollableScrollPhysics(),
                     itemBuilder: (context, index) {
                       TransferPageList model = logic.state.list[index];
                       if (model.day != '') {
                         return Column(
                           children: [
                             if (index != 0)
                             Container(
                               width: 1.sw,
                               height: 0.8.w,
                               color: const Color(0xffE9E9E9),
                             ),
                             Container(
                               width: 1.sw,
                               height: 25.w,
                               alignment: Alignment.centerLeft,
                               padding: EdgeInsets.only(left: 15.w),
                               color: Colors.white,
                               child: BaseText(
                                 text: model.day,
                                 style: TextStyle(
                                   fontWeight: FontWeight.normal,
                                   color: Color(0xFF727E8D),
                                   fontSize: 12.sp,
                                 ),
                               ),
                             ),
                           ],
                         );
                       }
                      return _buildTransactionItem(model);
                     },
                     itemCount: logic.state.list.length,
                   );
                 },
               ),
             ),
            ],
          ),


          Positioned(
              top: position.getX(142),
              left: position.getX(60),
              child: NetImageWidget(
                url: logic.state.icon,
                width: 32.w,
                height: 32.w,
              )),
          // 内容层
          Positioned(
            top: position.getX(100),
            left: position.getX(178),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(logic.state.name , style: TextStyle(fontSize: 15.w, height: 1.0, color: Colors.black),),
                    SizedBox(width: 5.w,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.w),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.05)
                      ),
                      child: Text("借记卡", style: TextStyle(
                        fontSize: 9.w,
                        color: Colors.red,
                        fontFamily: "PingFangSC",
                        fontWeight: FontWeight.bold,
                        height: 1.0
                      ),),
                    )
                  ],
                ),
              SizedBox(height: 6.w,),
              Text(_formatBankCard(logic.state.bankCard) , style: TextStyle(fontSize: 13.w, height: 1.0, color: Color(0xFF818081)),),
              SizedBox(height: 6.w,),
              Text(logic.state.bankName , style: TextStyle(fontSize: 12.w, height: 1.0, color: Color(0xFFB0AFB1)),),
              SizedBox(height: 6.w,),
              GetBuilder<ContractDetailLogic>(
                id: 'updateList',
                builder: (_) {
                  return Text(_getSourceInfo(), style: TextStyle(fontSize: 12.w, height: 1.0, color: Color(0xFFB0AFB1)),);
                },
              ),

                // // 姓名输入框
                // _buildInputItem(
                //   label: '姓名',
                //   controller: logic.state.nameController,
                //   hintText: '请输入姓名',
                // ),
                // SizedBox(height: 30.w),
                // // 银行卡号输入框
                // _buildInputItem(
                //   label: '银行卡号',
                //   controller: logic.state.bankCardController,
                //   hintText: '请输入银行卡号',
                //   keyboardType: TextInputType.number,
                // ),
                // SizedBox(height: 30.w),
                // // 银行全称输入框
                // _buildInputItem(
                //   label: '银行全称',
                //   controller: logic.state.bankNameController,
                //   hintText: '请输入银行全称',
                // ),
                // SizedBox(height: 50.w),
                // // 确认按钮
                // _buildConfirmButton(),
              ],
            ),
          ),
          // 给他转账
          Positioned(
              top: position.getX(768),
              left: 1.sw/2.0,
              child: Container(
                height: 50.w,
                width: 1.sw/2,
              ).withOnTap(onTap: () {
                // 构建联系人模型
                ContactsModel model = ContactsModel();
                model.icon = logic.state.icon;
                model.name = logic.state.name;
                model.bankCard = logic.state.bankCard;
                model.bankName = logic.state.bankName;
                model.bankId = logic.state.bankId;
                
                // 跳转到快速转账页面
                Get.to(() => FastTransferPage(), arguments: {
                  'model': model
                });
              })),

          Positioned(
              top: position.getX(426),
              left: position.getX(384),
              child: Column(
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 30.w,
                    child: _buildInputItem(
                              label: '银行全称',
                              controller: logic.state.bankNameController,
                              hintText: '请输入',
                            ),
                  ),
                  SizedBox(height: 10.w,),
                  SizedBox(
                    width: 200.w,
                    height: 30.w,
                    child: _buildInputItem(
                      label: '银行全称',
                      controller: logic.state.bankNameController,
                      hintText: '请输入',
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildInputItem({
    required String label,
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
  }) {
    return CleanTextField(
      controller: controller,
      hintText: hintText,
      keyboardType: keyboardType,
      hintStyle: TextStyle(
        fontSize: 14.sp,
        color: Color(0xFF6E6D6E),
        fontFamily: "PingFangSC",
        height: 1.0,
        fontWeight: FontWeight.w500,
      ),
      textStyle: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
        height: 1.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// 格式化银行卡号：前4位 + 4个星号 + 后4位
  String _formatBankCard(String bankCard) {
    if (bankCard.isEmpty) return '';
    if (bankCard.length <= 8) return bankCard;
    
    String first4 = bankCard.substring(0, 4);
    String last4 = bankCard.substring(bankCard.length - 4);
    return '$first4****$last4';
  }

  /// 获取来源信息：固定文本 + 时间
  String _getSourceInfo() {
    if (logic.state.list.isEmpty) return '来源:手机银行';
    
    // 获取列表最后一条数据
    TransferPageList lastItem = logic.state.list.last;
    
    // 获取并格式化时间（从 transactionTime 获取日期部分）
    String time = '';
    if (lastItem.billDetail?.transactionTime != null && lastItem.billDetail!.transactionTime.isNotEmpty) {
      // 假设 transactionTime 格式类似 "2025-12-15 10:30:00" 或 "2025-12-15"
      time = lastItem.billDetail!.transactionTime.split(' ').first;
    }
    
    return time.isNotEmpty ? '来源：手机银行  $time' : '来源：手机银行';
  }

  /// 构建交易记录项
  Widget _buildTransactionItem(TransferPageList model) {
    String amount() {
      String p = model.amount.bankBalance.replaceAll('-', '');
      String fh = model.type == '2' ? '-' : '+';
      return fh + p;
    }

    return Container(
      width: 1.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          model.daily != ''
              ? Container(
                  width: 1.sw,
                  height: 0.8.w,
                  color: const Color(0xffE9E9E9),
                )
              : Container(
                  width: 1.sw - 38.w,
                  height: 0.8.w,
                  margin: EdgeInsets.only(left: 38.w),
                  color: const Color(0xffE9E9E9),
                ),
          Row(
            children: [
              Container(
                width: 38.w,
                height: 50.w,
                color: Colors.white,
                padding: EdgeInsets.only(left: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseText(
                      text: model.daily,
                      style: TextStyle(
                        fontSize: 16.sp,
                        height: 1.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    BaseText(
                      text: model.week,
                      style: TextStyle(
                        fontSize: 9.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1.sw - 38.w,
                height: 50.w,
                color: Colors.white,
                padding: EdgeInsets.only(left: 10.w, right: 12.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // netImage(url: model.icon, width: 30.w, height: 30.w)
                    //     .withPadding(right: 10.w, top: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            BaseText(
                              text: model.billDetail?.transactionChannel ?? "",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: const Color(0xff303030),
                                fontWeight: FontWeight.w500,
                                height: 1,
                              ),
                            ),
                            BaseText(
                              text: " (${model.oppositeAccount})",
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: const Color(0xff848385),
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.w),
                        BaseText(
                          text: model.oppositeName,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xff848385),
                            height: 1,
                          ),
                        ),
                      ],
                    ).expanded(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BaseText(
                          text: amount(),
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: model.type == '1'
                                ? const Color(0xffC34236)
                                : const Color(0xff35827D),
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_right_sharp, size: 15.w, color: Color(0xFF757375),)
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ).withOnTap(onTap: () {
      Get.to(() => Hunkuan_infoPage(), arguments: {
        'model': model.billDetail,
      });
    });
  }
}

