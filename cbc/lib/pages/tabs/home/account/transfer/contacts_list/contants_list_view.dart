import 'package:azlistview/azlistview.dart';
import 'package:cbc/config/app_config.dart';
import 'package:cbc/config/model/member_info_model.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/net_image_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../utils/color_util.dart';
import '../bank_list/bank_list_model.dart';
import 'contants_list_logic.dart';
import 'contants_list_state.dart';

class ContactsListPage extends BaseStateless {
  ContactsListPage({Key? key}) : super(key: key, title: '我的收款人');

  final ContactsListLogic logic = Get.put(ContactsListLogic());
  final ContactsListState state = Get.find<ContactsListLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(
      builder: (ContactsListLogic c) {
        return AzListView(
          data: logic.contactList,
          itemCount: logic.contactList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) return _buildHeader();
            ContactInfo model = logic.contactList[index];
            return _buildListItem(model);
          },
          susItemHeight: 40.w,
          // padding: EdgeInsets.only(top: 32.w),
          susItemBuilder: (BuildContext context, int index) {
            ContactInfo model = logic.contactList[index];
            if ('我' == model.getSuspensionTag())
              return Container(
                padding: EdgeInsets.only(left: 16.0),
                color: Color(0xFFF3F4F5),
                width: 1.sw,
                height: 40.w,
                alignment: Alignment.centerLeft,
                child: BaseText(
                  text: '${AppConfig.config.abcLogic.memberInfo.realName}的账户',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF666666),
                  ),
                ),
              );
            return getSusItem(context, model.getSuspensionTag(),
                susHeight: 40.w);
          },
          indexBarData: SuspensionUtil.getTagIndexList(logic.contactList),
          indexBarOptions: IndexBarOptions(
            textStyle: TextStyle(fontSize: 12.sp, color: BColors.mainColor),
            indexHintWidth: 0.w,
            indexHintHeight: 0.w,
          ),
        );
      },
      id: 'updateUI',
    );
  }

  Widget getSusItem(BuildContext context, String tag, {double susHeight = 40}) {
    return Container(
      height: susHeight,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF666666),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(left: 16.w),
      margin: EdgeInsets.only(top: 40.w),
      color: Colors.white,
      child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            MemberInfoBankList model = state.infoModel.bankList[index];
            return Row(
              children: [
                Image(
                  image: 'ay'.png3x,
                  width: 25.w,
                  height: 25.w,
                ).withPadding(right: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: model.realName,
                      fontSize: 16.sp,
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    Row(
                      children: [
                        BaseText(
                          text: model.bankName,
                          fontSize: 13.sp,
                          color: const Color(0xff666666),
                        ),
                        BaseText(
                          text: '（${model.bankCard.maskBankCardNumber()}）',
                          fontSize: 13.sp,
                          color: Color(0xff666666),
                        )
                      ],
                    )
                  ],
                )
              ],
            ).withContainer(
                constraints: BoxConstraints(
                  minHeight: 55.w,
                ),
                padding: EdgeInsets.all(12.w));
          },
          separatorBuilder: (context, index) {
            return Container(
              width: 1.sw,
              height: 0.5.w,
              color: const Color(0xffdedede),
            );
          },
          itemCount: state.infoModel.bankList.length),
    );
  }

  Widget _buildListItem(ContactInfo model) {
    return Row(
      children: [
        NetImageWidget(
          url: model.icon,
          width: 32.w,
          height: 32.w,
        ).withPadding(right: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseText(
              text: model.name,
              fontSize: 16.sp,
            ),
            SizedBox(
              height: 4.w,
            ),
            Row(
              children: [
                BaseText(
                  text: model.bankName,
                  fontSize: 13.sp,
                  color: const Color(0xff666666),
                ),
                BaseText(
                  text: '（${model.bankCard.maskBankCardNumber()}）',
                  fontSize: 13.sp,
                  color: Color(0xff666666),
                )
              ],
            )
          ],
        )
      ],
    )
        .withContainer(
            color: Colors.white,
            constraints: BoxConstraints(
              minHeight: 55.w,
            ),
            padding: EdgeInsets.all(12.w))
        .withOnTap(onTap: () async {
      // 跳转到收款人详情页
      final result = await Get.toNamed(
        Routes.contractDetailPage,
        arguments: {
          'icon': model.icon,
          'bankName': model.bankName,
          'id': model.bankId,
          'name': model.name,
          'bankCard': model.bankCard,
        },
      );
      // 如果有返回结果，再返回给上一页
      if (result != null) {
        Get.back(result: result);
      }
    });
  }
}
