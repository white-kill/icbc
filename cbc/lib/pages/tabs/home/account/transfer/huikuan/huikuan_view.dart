import 'package:cbc/pages/tabs/home/account/transfer/huikuan/componetn/huikuan_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../config/model/transfer_page_model.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../../../utils/comm_widget_utils.dart';
import 'componetn/huikuan_item_widget.dart';
import 'huikuan_logic.dart';
import 'huikuan_state.dart';
import 'hunkuan_info/hunkuan_info_view.dart';

class HuiKuanPage extends BaseStateless {
  HuiKuanPage({Key? key}) : super(key: key,title: '汇款明细');

  final HuikuanLogic logic = Get.put(HuikuanLogic());
  final HuikuanState state = Get.find<HuikuanLogic>().state;


  @override
  get refreshController => state.refreshController;

  @override
  void onLoading() {
    super.onLoading();
    state.transferData.pageNum++;
    logic.getData();
  }

  @override
  bool get enablePullDown => false;


  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'ic_nav_service'.png3x,
      width: 20.w,
      height: 20.w,
      color: const Color(0xFF607483),
    ).withPadding(right: 20.w).withOnTap(onTap: () => Routes.mineService.push),
    CommWidgetUtils.getMoreIcon(icColor: const Color(0xFF607483)),
  ];

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        const HuikuanTopWidget(),
        GetBuilder(
          builder: (HuikuanLogic c) {
            return refreshWidget(
                child: ListView.builder(
                  controller: state.controller,
                  itemBuilder: (context, index) {
                    TransferPageList model = state.list[index];
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
                    return HuikuanItemWidget(model: model,).withOnTap(onTap: () {
                      Get.to(() =>Hunkuan_infoPage(),arguments: {
                        'model':model.billDetail,
                      });
                    });
                  },
                  itemCount:state.list.length,
                ));
          },
          id: 'updateUI',
        ).expanded(),
      ],
    );
  }
}
