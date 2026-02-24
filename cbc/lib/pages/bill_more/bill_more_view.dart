import 'package:cbc/config/model/month_bill_list_entity.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'bill_more_logic.dart';
import 'bill_more_state.dart';

/// 更多账单
class BillMorePage extends BaseStateless {
  BillMorePage({super.key});

  final BillMoreLogic logic = Get.put(BillMoreLogic());
  final BillMoreState state = Get.find<BillMoreLogic>().state;

  @override
  Widget? get titleWidget => BaseText(
        text: '更多账单',
        fontSize: 17.w,
        color: const Color(0xFF607483),
      );

  @override
  Widget? get leftItem => Container(
        padding: EdgeInsets.symmetric(vertical: 12.w),
        child:
            Image(image: 'ic_left_back'.png3x, color: const Color(0xFF5B6A80)),
      ).withOnTap(onTap: () => Get.back());

  @override
  List<Widget>? get rightAction => [
        _buildTitleAction('ic_title_service', '我的客服')
            .withOnTap(onTap: () => Routes.mineService.push),
        SizedBox(width: 5.w),
      ];

  Widget _buildTitleAction(String img, String text) {
    return Container(
      padding: EdgeInsets.only(top: 8.w, right: 7.w),
      child: Column(
        children: [
          Image(
            image: img.png3x,
            height: 20.w,
          ),
          SizedBox(height: 2.w),
          BaseText(
            text: text,
            fontSize: 9.w,
            color: const Color(0xFF5B6A80),
          ),
        ],
      ),
    );
  }

  @override
  Widget initBody(BuildContext context) {
    return ListView.builder(
      itemCount: 12,
      itemBuilder: _buildItem,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    var month = DateTime.now().month - 1;
    month = month <= 0 ? 12 + month : month;
    var cardMonth = month - index;
    var year = DateTime.now().year;
    year = cardMonth <= 0 ? year - 1 : year;
    cardMonth = cardMonth <= 0 ? 12 + cardMonth : cardMonth;
    return Obx(() {
      MonthBillListEntity? item = null;
      if(index < state.monthBillData.value.length){
        item = state.monthBillData.value[index];
      }
      return Stack(
        children: [
          Image(
            image: 'img_bill_card$cardMonth'.png3x,
            width: double.infinity,
          ),
          Positioned(
            left: 32.w,
            top: 5.w,
            child: BaseText(
              text: '${item?.year}年',
              color: Colors.white.withOpacity(0.85),
              fontSize: 10.5.w,
            ),
          ),
          Positioned(
            left: 240.w,
            top: 19.w,
            child: BaseText(
              text: '$cardMonth月账单',
              color: const Color(0xFF443333),
              fontSize: 12.5.w,
            ),
          ),
          Positioned(
            left: 216.w,
            top: 46.w,
            child: BaseText(
              text: '收入 ￥${item?.income ?? 0}',
              color: const Color(0xFF443333),
              fontSize: 11.w,
            ),
          ),
          Positioned(
            left: 216.w,
            top: 66.w,
            child: BaseText(
              text: '支出 ￥${item?.expenses ?? 0}',
              color: const Color(0xFF443333),
              fontSize: 11.w,
            ),
          ),
        ],
      );
    });
  }
}
