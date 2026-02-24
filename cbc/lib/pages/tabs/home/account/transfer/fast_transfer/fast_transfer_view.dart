import 'package:cbc/config/abc_config/cbc_logic.dart';
import 'package:cbc/config/app_config.dart';
import 'package:cbc/config/dio/network.dart';
import 'package:cbc/config/net_config/apis.dart';
import 'package:cbc/pages/tabs/home/account/transfer/card_transfer/conmponent/card_input_money.dart';
import 'package:cbc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../../../../utils/color_util.dart';
import '../../../../../../utils/comm_widget_utils.dart';
import '../../component/kh_wd.dart';
import '../transfer_success/transfer_success_view.dart';
import 'conmponent/fast_input_money.dart';
import 'fast_transfer_logic.dart';
import 'fast_transfer_state.dart';

class FastTransferPage extends BaseStateless {
  FastTransferPage({Key? key}) : super(key: key, title: '快速转账');

  final FastTransferLogic logic = Get.put(FastTransferLogic());
  final FastTransferState state = Get.find<FastTransferLogic>().state;

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
    return GetBuilder(
      builder: (FastTransferLogic c) {
        return ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.w))
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 12.w,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25.w,
                      ),
                      netImage(
                          url: logic.model.icon, width: 40.w, height: 40.w),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            text: logic.model.name,
                            style: TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4.w,
                          ),
                          Row(
                            children: [
                              BaseText(
                                text: logic.model.bankName,
                                color: Color(0xff666666),
                                fontSize: 15.sp,
                              ),
                              BaseText(
                                text:
                                    ' (${logic.model.bankCard.getLastFourByList()})',
                                fontSize: 15.sp,
                                color: Color(0xff333333),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12.w,
                  ),
                  const FastInputMoney(),
                  Row(
                    children: [
                      Obx(() => BaseText(
                        text: logic.transferTimeName.value,
                        fontSize: 15.sp,
                        color: Color(0xff333333),
                      )),
                      SizedBox(
                        width: 10.w,
                      ),
                      BaseText(
                        text: '更改',
                        color: BColors.blue1Color,
                        fontSize: 15.sp,
                      ).withOnTap(onTap: (){
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context:context,
                          builder: (context) {
                            return Column(
                              children: [

                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    Map data = state.transferTime[index];
                                    return Container(
                                      width: 1.sw,
                                      height: 55.w,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: 15.w,right: 15.w),
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          BaseText(text: data['title'],color: BColors.blue1Color,),
                                          SizedBox(height: 6.w,),
                                          BaseText(text: data['content'],fontSize: 12.sp,color: Color(0xff666666),),
                                        ],
                                      ),
                                    ).withOnTap(onTap: (){
                                      logic.transferTimeName.value = data['title'];
                                      Get.back();
                                    });
                                  },
                                  itemCount: state.transferTime.length,
                                  separatorBuilder: (BuildContext context, int index) {
                                    return Container(
                                      width: 1.sw,
                                      height: 0.5.w,
                                      color: const Color(0xffEFEFEF),
                                    );
                                  }, //state.list.length,
                                ).withContainer(
                                  margin: EdgeInsets.only(left: 15.w,right: 15.w),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(6.w))
                                  ),
                                ),

                                SizedBox(height: 16.w,),
                                Container(
                                  width: 1.sw,
                                  height: 45.w,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 15.w,right: 15.w),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(6.w))
                                  ),
                                  child: BaseText(text: '取消'),
                                ).withOnTap(onTap:(){
                                  Get.back();
                                })
                              ],
                            ).withContainer(
                                height: 260.w,
                                color: Colors.transparent
                            );
                          },
                        );
                      })
                    ],
                  ).withPadding(
                    left: 30.w,
                    bottom: 12.w,
                  ),
                  Container(
                    width: 340.w,
                    height: 45.w,
                    margin: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 20.w, bottom: 20.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xffF35855),
                      borderRadius: BorderRadius.all(Radius.circular(6.w)),
                    ),
                    child: BaseText(
                        text: "下一步", color: Colors.white, fontSize: 14.sp),
                  ).withOnTap(onTap: () {
                    //transfer
                    if(state.fastReq.amount == ''){
                      '请输入转账金额'.showToast;
                      return;
                    }
                    FocusScope.of(context).unfocus();
                    AlterWidget.alterWidget(builder: (context) {
                      return  KhWd(callBack: (){
                        SmartDialog.dismiss().then((v){
                          Http.post(Apis.transfer,data: state.fastReq.toJson()).then((v){
                            if(v != null){
                              AppConfig.config.abcLogic.memberInfoData();
                              Get.to(() => TransferSuccessPage(),arguments: {
                                'cardNo':state.fastReq.cardNo,
                                'bankName':state.fastReq.bankName,
                              });
                            }
                          });
                        });

                      },);
                    });

                  }),
                  SizedBox(
                    height: 10.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseText(
                        text:
                            '使用中国工商银行(${AppConfig.config.abcLogic.cardFour()})付款，',
                        fontSize: 15.sp,
                        color: Color(0xff666666),
                      ),
                      BaseText(
                        text: '更换',
                        color: BColors.blue1Color,
                        fontSize: 15.sp,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.w,
                  ),
                  BaseText(
                    text: '可用:${AppConfig.config.abcLogic.balance()}元',
                    fontSize: 15.sp,
                    color: Color(0xff666666),
                  ),
                  SizedBox(
                    height: 15.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.w,
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
              text:
              '1.安全提示:为了您的资金安全，请勿轻信陌生人通过网络聊天群、直播、电话、短信等方式进行的诱导性“投资理财”、代办大额信用卡或高额贷款、网购客服或快递进行退货等非正规渠道要求进行转账汇款，谨防被骗。任何向您索要各类密码、电子密码器动态密码、短信验码的都是骗子，千万别给!'
                  '\n2.汇款类型:根据人民银行关于防范电信诈骗有关要求，我行为您提供“实时汇款、普通汇款、次日汇款”三种汇款方式选择。对于“普通汇款”和“次日汇款”，您可在限定时间内通过手机银行或网银“转账汇款-查询汇款明细”进行撤销。\n'
                  '\n3.到账时间'
                  '\n(1)本行汇款:实时受理，实时到账。'
                  '\n(2)跨行汇款:①小于100万元(含)汇款，实时受理，一般实时到账。②大于100万元汇款:工作日(周-至周四)交易时间(前一日20:30-当日17:15)一般实时到达收款行;工作日非交易时间(17:15-20:30)提交，系统预约至当日20:30处理后，实时到达收款行;非工作日时间(周五17:15-周日20:30)，系统实时受理(最迟半小时后汇出)。资金到账时间以收款银行为准。跨行汇款业务受人行跨行资金支付系统影响，如服务时间临时变动，以人民银行公告为'
                  '\n4.收款人信息:当您向其他银行汇款时，系统无法判断收款人信息是否准确，仅对信息格式进行校验，请您务必准确填写收款人户名、卡(账)号/手机号、收款行等信息，若因上述信息填写错误导致汇款失败，手续费不退回。汇款成功后收款人信息将自动添加至“我的收款人”，方便您再次汇款操作。通过手机号向其汇款时，若其手机号已绑定收款银行账户(含他行)，则将实时汇入绑定账户;若其手机号未绑定银行账户，则系统将向收款人发送信息，根据收款人短信回复卡/账号汇入资金。'
                  '\n5.交易限额:若您手机银行为柜面注册，且已开通工银e支付并设置支付密码(工银e支付-安全管理-支付密码)，您可自助上调e支付转账限额(转账汇款-支付限额)，通过刷脸认证可上调转账限额至最高单笔20万元、日累计100万元。各类转账认证方式(U盾、电子密码器、短信、支付密码/指纹/刷脸)交易限额，您可在“工银e支付-支付限额”下查看、调整。向绑定工行账户手机号汇款交易限额受支付认证方式控制;向绑定他行账户手机号汇款，单笔最高100万元;向未绑定银行账户手机号汇款单笔最高5万元。'
                  '\n6.汇款手续费:手机银行境内人民币汇款目前暂不收费。短信通知手续费将根据我行政策进行减免，请以实际扣款情况为准。'
                  '\n7.付款账户:自助注册卡无法使用U盾、密码器认证，若您已申领U盾或电子密码器，您可登录手机银行在“我的账户”下点击“功能升级”按钮，按照提示通过刷脸认证后将该卡升级为柜面注册卡。'
                  '\n8.其它说明:'
                  '\n(1)境内汇款不支持向16位财智账户卡汇款。国际借记卡、贷记卡外币账户作为收款账户可接收本人其他同币种外币账户转入;自2021年1月17日起，转账金额10元以下，附言最多可输6个汉字(字母、数字);10元(含)以上，可输最多30个汉字(字母、数字)。'
                  '\n(2)为帮助您保护交易安全，我行可能会对部分交易要求您进行人脸识别验证。如您不便进行人脸识别，请通过我行网点等其他渠道办理，',
              style: TextStyle(
                  color: Color(0xff333436), height: 1.8, fontSize: 14.sp),
              maxLines: 100,
            ).withPadding(left: 14.w, right: 14.w),
            SizedBox(height: ScreenUtil().bottomBarHeight + 25.w),
          ],
        );
      },
      id: 'updateUI',
    );
  }
}
