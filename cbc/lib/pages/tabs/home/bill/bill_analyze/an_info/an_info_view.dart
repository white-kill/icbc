import 'package:cbc/config/abc_config/cbc_logic.dart';
import 'package:cbc/config/dio/network.dart';
import 'package:cbc/config/net_config/apis.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:cbc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../config/model/category_data_model.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../../../utils/comm_widget_utils.dart';
import '../../../account/account_detail/account_detail_info/account_detail_info_view.dart';
import '../../bill_detail/bill_detail_view.dart';
import 'an_info_logic.dart';
import 'an_info_state.dart';
import 'info_item_widget.dart';

class AnInfoPage extends BaseStateless {
  AnInfoPage({Key? key}) : super(key: key, title: '类目明细');

  final An_infoLogic logic = Get.put(An_infoLogic());
  final An_infoState state = Get.find<An_infoLogic>().state;

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
  get refreshController => state.refreshController;

  @override
  void onLoading() {
    super.onLoading();
    state.pageNum++;
    logic.getData();
  }

  @override
  bool get enablePullDown => false;



  @override
  Widget initBody(BuildContext context) {

    return GetBuilder(
      builder: (An_infoLogic c) {
        return refreshWidget(
            child: ListView.builder(
              controller: state.controller,
              itemBuilder: (context, index) {
                if (index == 0) return  _topWidget();

                CategoryDataList model = state.list[index - 1];
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
                return InfoItemWidget(
                  model: model,
                ).withOnTap(onTap: () {
                  Get.to(() => BillDetailPage(),
                      arguments: {'model': model.billDetail});
                });
              },
              itemCount: state.list.length + 1,
            ));
      },
      id: 'updateUI',
    );
  }

  Widget _topWidget(){
    return Container(
      height: 200.w,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 35.w,),
          (logic.data?.icon ?? '').isNotNullOrEmpty
              ? netImage(
            url: logic.data!.icon,
            width: 40.w,
            height: 40.w,
          )
              : Image(
            image: 'ic_zztr'.png3x,
            width: 40.w,
            height: 40.w,
          ),
          SizedBox(height: 6.w,),
          BaseText(text: logic.data?.title??'',fontSize: 12.sp,),
          SizedBox(height: 10.w,),
          BaseText(text: '¥' + (logic.data?.sales??0).abs().bankBalance,style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              color: (logic.data?.sales??0).toString().contains('-')?BColors.main1Color:BColors.mainColor
          ),),
          SizedBox(height: 12.w,),
          BaseText(text: Get.arguments?['timeStr']??'',color: Color(0xff666666),)
        ],
      ),
    );
  }
}
