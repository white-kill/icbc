import 'package:cbc/pages/component/search_input_widget.dart';
import 'package:cbc/pages/tabs/home/account/transfer/transfer_view.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:cbc/utils/sticky_tab_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'home_normal_more_logic.dart';
import 'home_normal_more_state.dart';

class HomeNormalMorePage extends BaseStateless {
  HomeNormalMorePage({super.key});

  final HomeNormalMoreLogic logic = Get.put(HomeNormalMoreLogic());
  final HomeNormalMoreState state = Get.find<HomeNormalMoreLogic>().state;

  @override
  Widget? get titleWidget => Container(
        width: double.infinity,
        height: 40.w,
        padding: EdgeInsets.only(right: 20.w),
        child: const SearchInputWidget(),
      );

  @override
  Widget? get leftItem => Container(
        padding: EdgeInsets.symmetric(vertical: 12.w),
        child:
            Image(image: 'ic_left_back'.png3x, color: const Color(0xFF5B6A80)),
      ).withOnTap(onTap: () => Get.back());

  @override
  bool isBack() => false;


  // Tab数据
  final List<String> _tabTitles = [
    '账户管理', '转账服务', '支付管理', '财富管理', '信用卡', '贷款服务', '权益服务',
    '生活服务', '客户专享', '网点服务', '金融助手'
  ];

  // 图片数据
  final List<String> _imageNames = [
    'home_more_1', 'home_more_2', 'home_more_3', 'home_more_4', 'home_more_5',
    'home_more_6', 'home_more_7', 'home_more_8', 'home_more_9', 'home_more_10',
    'home_more_11'
  ];

  @override
  Widget initBody(BuildContext context) {
    // 创建Tab项列表
    final List<TabItem> tabs = List.generate(_tabTitles.length, (index) {
      return TabItem(
        title: _tabTitles[index],
        content: Image(image: "${_imageNames[index]}".png),
      );
    });

    // 创建Header
    final Widget header = _buildHeaderWidget();

    // 创建Tab样式
    const TabStyle tabStyle = TabStyle(
      fontSize: 14,
      selectedColor: Colors.black,
      unselectedColor: Colors.black,
      selectedFontWeight: FontWeight.w600,
      unselectedFontWeight: FontWeight.w400,
      selectedIndicatorColor: Colors.black,
      fontFamily: "PingFangSC",
      indicatorHeight: 2,
      indicatorWidth: 30,
      tabHeight: 50,
      tabPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      tabMargin: EdgeInsets.only(right: 8, top: 8),
      tabTextIndicatorSpacing: 8,
      scrollPadding: EdgeInsets.symmetric(horizontal: 12),
      backgroundColor: Colors.white,
    );

    return StickyTabScrollView(
      tabs: tabs,
      header: header,
      headerHeight: 280.w + 20 + (148/1080 * 1.sw),
      stickyOffset: 0,
      tabStyle: tabStyle,
      scrollAnimationDuration: Duration(milliseconds: 500),
      tabScrollAnimationDuration: Duration(milliseconds: 300),
      scrollAnimationCurve: Curves.easeInOut,
      cacheDelay: Duration(seconds: 1), // 延迟1秒缓存
    );
  }




  _buildHeaderWidget() {
    return Column(
      children: [
        Container(
          width: 1.sw,
          height: 148/1080 * 1.sw,
          child: Image(image: 'home_more_0'.png),
        ),
        Container(
          width: 1.sw,
          height: 140.w,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.w,),

              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text("最近使用", style: TextStyle(
                  fontSize: 13,
                  fontFamily: "cbc",
                  height: 1.5
                ),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFunItem('ic_zzhk', '转账汇款')
                      .withOnTap(onTap: () => Get.to(() => TransferPage())),
                  _buildFunItem('ic_lsmxdy', '历史明细\n打印')
                      .withOnTap(onTap: () =>  Routes.printPage.push), // TODO 历史明细打印
                  _buildFunItem('ic_sz', '收支')
                      .withOnTap(onTap: () => Routes.billPage.push),
                  _buildFunItem('ic_bljd', '办理进度')
                      .withOnTap(onTap: () => Routes.printProgressPage.push), // TODO 办理进度printProgressPage
                  _buildFunItem('ic_zc', '资产')
                      .withOnTap(onTap: () => Routes.mineAssets.push),
                ],
              ),
            ],
          )
        ),
        SizedBox(height: 10,),
        Container(
          width: 1.sw,
          height: 140.w,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.w,),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text("为您推荐", style: TextStyle(
                    fontSize: 13,
                    fontFamily: "cbc",
                    height: 1.5
                ),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildFunItem('ic_grylj', '个人养老金')
                      .withOnTap(onTap: () => Routes.oldAgePension.push),
                  _buildFunItem('ic_ydzd', '月度账单')
                      .withOnTap(onTap: () => Routes.billLoading.push), // TODO 月度账单
                  _buildFunItem('ic_tszx', '投诉咨询')
                      .withOnTap(onTap: () => Routes.mineService.push),
                  _buildFunItem('ic_szcp', '数字藏品')
                      .withOnTap(onTap: () => Routes.virtualCollection.push),
                  _buildFunItem('ic_dk', '贷款')
                      .withOnTap(onTap: () => Routes.loan.push),
                ],
              ),
            ],
          )
        ),
        SizedBox(height: 10,),

      ],
    );
  }



  Widget _buildFunItem(String icon, String name) {
    return Container(
      width: 75.w,
      margin: EdgeInsets.only(top: 12.w),
      child: Column(
        children: [
          Container(
            width: 46.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Image(
              image: icon.png3x,
              width: 46.w,
            ),
          ),
          SizedBox(height: 5.w),
          BaseText(
            text: name,
            fontSize: 12.w,
            color: Colors.black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}


  // @override
  // Widget initBody(BuildContext context) {
  //   return ListView(
  //     padding: EdgeInsets.zero,
  //     children: [
  //       Stack(
  //         children: [
  //           Image(
  //             image: 'img_home_more'.jpg3x,
  //             width: 1.sw,
  //           ),
  //           Positioned(
  //             top: 111.w,
  //             left: 0,
  //             child: Container(
  //               width: 1.sw,
  //               height: 80.w,
  //               color: Colors.white,
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   _buildFunItem('ic_zzhk', '转账汇款')
  //                       .withOnTap(onTap: () => Get.to(() => TransferPage())),
  //                   _buildFunItem('ic_lsmxdy', '历史明细\n打印')
  //                       .withOnTap(onTap: () =>  Routes.printPage.push), // TODO 历史明细打印
  //                   _buildFunItem('ic_sz', '收支')
  //                       .withOnTap(onTap: () => Routes.billPage.push),
  //                   _buildFunItem('ic_bljd', '办理进度')
  //                       .withOnTap(onTap: () => Routes.printProgressPage.push), // TODO 办理进度printProgressPage
  //                   _buildFunItem('ic_zc', '资产')
  //                       .withOnTap(onTap: () => Routes.mineAssets.push),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Positioned(
  //             top: 256.w,
  //             left: 0,
  //             child: Container(
  //               width: 1.sw,
  //               height: 80.w,
  //               color: Colors.white,
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   _buildFunItem('ic_grylj', '个人养老金')
  //                       .withOnTap(onTap: () => Routes.oldAgePension.push),
  //                   _buildFunItem('ic_ydzd', '月度账单')
  //                       .withOnTap(onTap: () => ''), // TODO 月度账单
  //                   _buildFunItem('ic_tszx', '投诉咨询')
  //                       .withOnTap(onTap: () => Routes.mineService.push),
  //                   _buildFunItem('ic_szcp', '数字藏品')
  //                       .withOnTap(onTap: () => Routes.virtualCollection.push),
  //                   _buildFunItem('ic_dk', '贷款')
  //                       .withOnTap(onTap: () => Routes.loan.push),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

