import 'package:cbc/config/abc_config/balance_eye_widget.dart';
import 'package:cbc/config/abc_config/balance_widget.dart';
import 'package:cbc/config/app_config.dart';
import 'package:cbc/pages/tabs/home/account/account_detail/account_detail_info/account_detail_info_view.dart';
import 'package:cbc/pages/tabs/home/account/account_detail/component/account_detail_item_widget.dart';
import 'package:cbc/pages/tabs/home/account/account_detail/component/account_detail_list_widget.dart';
import 'package:cbc/pages/tabs/home/account/account_detail/component/account_detail_top_widget.dart';
import 'package:cbc/pages/tabs/home/account/account_detail/more_query/more_query_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/model/bill_item_model.dart';
import '../../../../../routes/app_pages.dart';
import 'account_detail_logic.dart';
import 'account_detail_state.dart';

class AccountDetailPage extends BaseStateless {
  AccountDetailPage({Key? key}) : super(key: key, title: '查询明细');

  final Account_detailLogic logic = Get.put(Account_detailLogic());
  final Account_detailState state = Get.find<Account_detailLogic>().state;

  @override
  get refreshController => state.refreshController;


  @override
  void onLoading() {
    super.onLoading();
    state.billData.pageNum++;
    logic.getData();
  }

  @override
  bool get enablePullDown => false;

  @override
  List<Widget>? get rightAction => [
        BaseText(
          text: logic.showFilter ? '我的帐号' : '更多查询',
          fontSize: 16.sp,
          color: const Color(0xFF607483),
        )
            .withContainer(
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: 12.w),
        )
            .withOnTap(onTap: () {
          if (logic.showFilter) {
            Get.back();
            Get.back();
          } else {
            Get.offAndToNamed(Routes.mreQueryPage);
          }
        })
      ];

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(
      builder: (Account_detailLogic c) {
        return refreshWidget(
            noDataWidget:logic.showFilter ?null: Container(
              padding: EdgeInsets.only(left: 12.w,right: 12.w),
              child: BaseText(
                color: Color(0xff666666),
                maxLines: 10,
                text: '以上为您近一个月的账户交易明细，如需查询更长时间范围的明细，请点击右上角“更多查询”',
                textAlign: TextAlign.center,
              ),
            ),
            child: ListView.builder(
              controller: state.controller,
              itemBuilder: (context, index) {
                if (index == 0) return const AccountDetailTopWidget();

                BillItemList model = state.list[index - 1];
                if (model.day != '') {
                  return Container(
                    width: 1.sw,
                    height: 35.w,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15.w),
                    color: const Color(0xffF4F5F7),
                    child: BaseText(
                      text: model.day,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  );
                }
                return AccountDetailItemWidget(
                  model: model,
                  index: 0,
                ).withOnTap(onTap: () {
                  Get.to(() => AccountDetailInfoPage(),
                      arguments: {'model': model.billDetail});
                });
              },
              itemCount: state.list.length + 1,
            ));
      },
      id: 'updateUI',
    );
  }
}
