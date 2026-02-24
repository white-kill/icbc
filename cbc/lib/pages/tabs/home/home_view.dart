import 'package:cbc/config/abc_config/balance_eye_widget.dart';
import 'package:cbc/pages/tabs/home/component/home_content_widget1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/app_bar_widget.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../routes/app_pages.dart';
import '../../component/placeholder_search_widget.dart';
import 'component/home_content_widget2.dart';
import 'component/home_content_widget3.dart';
import 'component/home_content_widget4.dart';
import 'home_logic.dart';
import 'home_state.dart';

class HomePage extends BaseStateless {
  HomePage({Key? key}) : super(key: key);

  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  double? get lefItemWidth => 0;

  @override
  Widget? get leftItem => Container();

  @override
  Widget? get titleWidget => Obx(() => PlaceholderSearchWidget(
    contentList: const ['财富社区寻宝活动', '微信绑定', '明细查询'],
    searchBgColor: const Color(0xffEAF2FD).withOpacity(0.4),
    color: logic.navActionColor.value,
    leftWidget: !logic.navChange.value?BaseText(text: '退出',fontSize: 15.sp,).withContainer(
      padding: EdgeInsets.only(left: 12.w),
      onTap: () => Get.offAllNamed(Routes.login),
    ):null,
  ));

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
    logic.navChange.value = v;
    logic.navActionColor.value = v ? Colors.black : Colors.black;
  };

  @override
  Function(int index)? get callBackHomeTag => (index){
    if (logic.navChange.value) {
      logic.homeTabIndex.value = index;
    }
  };

  @override
  AppBarController? get appBarController => state.appBarController;

  @override
  Widget initBody(BuildContext context) {
    return Obx(() =>_contentWidget(logic.homeTabIndex.value));
  }


  Widget _contentWidget(int index) {
    if(index == 0) return const HomeContentWidget1();
    if(index == 1) return const HomeContentWidget2();
    if(index == 2) return const HomeContentWidget3();
    if(index == 3) return const HomeContentWidget4();
    return Container();
  }
}
