import 'package:cbc/utils/comm_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../routes/app_pages.dart';
import 'child/view.dart';
import 'mine_more_logic.dart';
import 'mine_more_state.dart';

class MineMorePage extends BaseStateless {
  MineMorePage({super.key});

  final MineMoreLogic logic = Get.put(MineMoreLogic());
  final MineMoreState state = Get.find<MineMoreLogic>().state;

  @override
  Widget? get titleWidget => BaseText(
        text: '更多',
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
        Image(image: 'ic_nav_service'.png3x, width: 20.w, height: 20.w)
            .withPadding(right: 20.w)
            .withOnTap(onTap: () => Routes.mineService.push),
        CommWidgetUtils.getMoreIcon(),
      ];

  @override
  Widget initBody(BuildContext context) {
    return Container(
      width: 1.sw,
      height: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.only(top: 22.w),
      child: Stack(
        children: [
          Image(
            image: 'bg_mine_more'.png3x,
            width: 1.sw,
          ),
          GridView.count(
            // 设置交叉轴（水平方向）上的网格数量为5列
            crossAxisCount: 5,
            // 主轴间距（垂直间距）
            mainAxisSpacing: 8.0,
            // 交叉轴间距（水平间距）
            crossAxisSpacing: 8.0,
            // 子项的宽高比，默认为1.0（正方形）
            childAspectRatio: 1.0,
            // 网格项的数据源
            children: List.generate(14, (index) {
              return Container(
                width: 20.w,
                height: 20.w,
              ).withOnTap(onTap: ()=>onTap(index));
            }),
          ),
        ],
      ),
    );
  }

  void onTap(int index) {
    // TODO 需要补充部分页面
    if(index == 0) Routes.billLoading.push; // 月度账单
    if(index == 1) Routes.gongYinIDou.push; // 订单
    if(index == 2) Routes.creditReport.push; // 信用报告
    if(index == 3) Routes.progressStatus.push; // 办理进度
    if(index == 4) {
      Get.to(CpzjPage());
    } // 产品足迹
    if(index == 5) Routes.commitFeedback.push; // 评价与反馈
    if(index == 6) Routes.cloudSave.push; // 云保管
    // if(index == 7) Routes.productHistory.push; // 产品足迹
    if(index == 8) Routes.sharedPresent.push; // 分享有礼
    if(index == 9) Routes.commitFeedback.push; // 评价与反馈
    // if(index == 10) Routes.useSealInfo.push; // 用印信息验证
    if(index == 11) Routes.cloudSave.push; // 云保管
    // if(index == 12) Routes.electronicsApply.push; // 电子发票申请
    // if(index == 13) Routes.foreignIncomeReport.push; // 涉外收入申报
  }
}
