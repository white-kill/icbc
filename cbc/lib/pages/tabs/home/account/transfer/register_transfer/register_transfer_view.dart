import 'package:cbc/config/app_config.dart';
import 'package:cbc/utils/abc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../../../../utils/comm_widget_utils.dart';
import 'register_transfer_logic.dart';
import 'register_transfer_state.dart';

class RegisterTransferPage extends BaseStateless {
  RegisterTransferPage({Key? key}) : super(key: key, title: '注册账户转账');

  final RegisterTransferLogic logic = Get.put(RegisterTransferLogic());
  final RegisterTransferState state = Get.find<RegisterTransferLogic>().state;

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
      padding: EdgeInsets.only(top: 10.w),
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _itemWidget(state.titleName[index]);
          },
          itemCount: state.titleName.length,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              width: 1.sw,
              height: 0.5.w,
              color: const Color(0xffEFEFEF),
            );
          }, //state.list.length,
        ),
        SizedBox(
          height: 10.w,
        ),
        Container(
          width: 1.sw,
          height: 62.w,
          color: Colors.white,
          padding: EdgeInsets.only(left: 12.w),
          child: Column(
            children: [
              SizedBox(
                height: 12.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(text: '付款账户'),
                  Row(
                    children: [
                      BaseText(
                        text: AppConfig.config.abcLogic.card(),
                        color: Color(0xff2F6FED),
                      ),
                      Image(
                        image: 'ic_jt_right'.png3x,
                        color: Color(0xff879499),
                        width: 25.w,
                        height: 25.w,
                      ).withPadding(left: 12.w, right: 8.w)
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(text: ''),
                  BaseText(
                    text: '可用:${AppConfig.config.abcLogic.balance()}',
                    fontSize: 12.w,
                    color: Color(0xff696969),
                  ).withPadding(right: 40.w),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.w,
        ),
        AbcButton(
          title: '下一步',
          height: 48.w,
          radius: 6.w,
          bgColor: Color(0xffCF0000),
          onTap: () {},
          margin: EdgeInsets.only(left: 12.w, right: 12.w),
        ),
        SizedBox(
          height: 40.w,
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
          text: '1.安全提示:为了您的资金安全，'
              '请勿轻信陌生人通过网络聊天群、直播、电话、'
              '短信等方式进行的诱导性“投资理财”推荐，谨防诈骗。'
              '请到合法正规金融机构办理投资理财业务。'
              '\n\n 2.付款账户:自助注册卡无法使用U盾、密码器认证若您已申领U盾或电子密码器，'
              '您可在“我的账户”下点击“功能升级”按钮，'
              '按照提示通过刷脸认证后将该卡升级为柜面注册卡。'
              '\n\n3.收款账户:若收款账户为自助注册卡，则向该卡转账后，'
              '若再次从该账户转出资金、只能使用工银e支付认证，您可先为该卡开通工银e支付，'
              '或先通过刷脸将该卡升级为柜面注册卡后再转出。冻结、挂失等非正常状态下账户资金无法转出',
          style:
              TextStyle(color: Color(0xff393939), height: 1.8, fontSize: 14.sp),
          maxLines: 20,
        ).withPadding(left: 14.w, right: 14.w)
      ],
    );
  }

  Widget _itemWidget(String name) {
    return Container(
      height: 48.w,
      width: 1.sw,
      color: Colors.white,
      padding: EdgeInsets.only(left: 12.w, right: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [BaseText(text: name), _rightWidget(name)],
      ),
    );
  }

  Widget _rightWidget(String name) {
    if (name == '收款账户') {
      return Row(
        children: [
          const BaseText(
            text: '请选择',
            color: Color(0xff879499),
          ),
          Image(
            image: 'ic_jt_right'.png3x,
            color: Color(0xff879499),
            width: 25.w,
            height: 25.w,
          )
        ],
      );
    }
    if (name == '币种') {
      return BaseText(
        text: '人民币  ',
        color: Color(0xff2F6FED),
      );
    }
    if (name == '转账金额') {
      return Row(
        children: [
          TextFieldWidget(
            textAlign: TextAlign.end,
            hintText: '请输入',
          ).withContainer(width: 100.w),
          SizedBox(
            width: 10.w,
          ),
          Container(
            width: 60.w,
            height: 28.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2.w)),
              border: Border.all(width: 1.w, color: Color(0xffCF0000)),
            ),
            alignment: Alignment.center,
            child: BaseText(
              text: '全额转入',
              color: Color(0xffCF0000),
              fontSize: 13.sp,
            ),
          )
        ],
      );
    }
    return Container();
  }
}
