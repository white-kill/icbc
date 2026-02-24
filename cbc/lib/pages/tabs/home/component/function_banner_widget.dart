import 'package:cbc/pages/index/index_logic.dart';
import 'package:cbc/pages/other/change_nav/change_nav_view.dart';
import 'package:cbc/pages/other/fixed_nav/fixed_nav_view.dart';
import 'package:cbc/pages/other/image/image_view.dart';
import 'package:cbc/pages/tabs/home/account/transfer/transfer_view.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

class FunctionBannerWidget extends StatefulWidget {
  const FunctionBannerWidget({super.key});

  @override
  State<FunctionBannerWidget> createState() => _FunctionBannerWidgetState();
}

class _FunctionBannerWidgetState extends State<FunctionBannerWidget> {
  List dataList = [
    [
      {'image': 'ic_fhome_1_', 'name': '存款'},
      {'image': 'ic_fhome_1_', 'name': '转账汇款'},
      {'image': 'ic_fhome_1_', 'name': '热门活动'},
      {'image': 'ic_fhome_1_', 'name': '贷款'},
      {'image': 'ic_fhome_1_', 'name': '生活缴费'},
      {'image': 'ic_fhome_1_', 'name': '信用报告'},
      {'image': 'ic_fhome_1_', 'name': '工银i豆商城'},
      {'image': 'ic_fhome_1_', 'name': '医保'},
      {'image': 'ic_fhome_1_', 'name': '薪管家'},
      {'image': 'ic_fhome_1_', 'name': '资产'}
    ],
    // [
    //   {'image': 'ic_fhome_2_', 'name': '信用卡'},
    //   {'image': 'ic_fhome_2_', 'name': '炭空间'},
    //   {'image': 'ic_fhome_2_', 'name': '收支'},
    //   {'image': 'ic_fhome_2_', 'name': '汇款明细'},
    //   {'image': 'ic_fhome_2_', 'name': '分期付款'},
    //   {'image': 'ic_fhome_2_', 'name': '个人养老金'},
    //   {'image': 'ic_fhome_2_', 'name': '安全中心'},
    //   {'image': 'ic_fhome_2_', 'name': '投诉咨询'},
    //   {'image': 'ic_fhome_2_', 'name': '自动归集'},
    //   {'image': 'ic_fhome_2_', 'name': '更多'}
    // ]
    [
      {'image': 'ic_fhome_2_', 'name': '任务中心'},
      {'image': 'ic_fhome_2_', 'name': '权益中心'},
      {'image': 'ic_fhome_2_', 'name': 'e通办'},
      {'image': 'ic_fhome_2_', 'name': '远程办'},
      {'image': 'ic_fhome_2_', 'name': '绿色空间'},
      {'image': 'ic_fhome_2_', 'name': '微信绑定'},
      {'image': 'ic_fhome_2_', 'name': '结售汇'},
      {'image': 'ic_fhome_2_', 'name': '理财'},
      {'image': 'ic_fhome_2_', 'name': '基金'},
      {'image': 'ic_fhome_2_', 'name': '更多'}
    ]
  ];

  void jumpPage(String name) {
    if (name == '存款') Routes.deposit.push;
    if (name == '转账汇款') Get.to(() => TransferPage());
    if (name == '热门活动') Routes.gyidly.push;
    if (name == '贷款') Routes.loan.push;
    if (name == '生活缴费') Routes.lifeFee.push;
    if (name == '医保') Routes.gyesb.push;
    if (name == '薪管家') Routes.salaryManager.push;
    if (name == '资产') Routes.mineAssets.push;
    if (name == '天天盈') Routes.dayDayEarn.push;
    if (name == '贵金属') Routes.nobleMetal.push;
    if (name == '信用卡') Get.put<IndexLogic>(IndexLogic()).selectIndex(1);
    if (name == '炭空间') Routes.carbonSpace.push;
    if (name == '收支') Routes.billPage.push;
    if (name == '汇款明细') Routes.accountDetailPage.push;
    if (name == '分期付款') Routes.hirePurchase.push;
    if (name == '个人养老金') Routes.oldAgePension.push;
    if (name == '安全中心') Routes.safeCenter.push;
    if (name == '投诉咨询') Routes.mineService.push;
    if (name == '自动归集') Routes.mineAssetsCollection.push;
    if (name == '任务中心') Get.to(ImagePage(
      title: '任务中心',
      image: 'rwzx',
      navChange: false,
      right: false,
    ));
    if (name == '权益中心') {
      Get.to(() => ChangeNavPage(), arguments: {
        'title': '工银礼享家',
        'image': 'qyzx',
        'right': true
      });
    }
    if (name == 'e通办') {
      Get.to(() => ChangeNavPage(), arguments: {
        'title': 'e通办',
        'image': 'etb',
        'right': true
      });
    }
    if (name == '远程办') {
      Get.to(() => ChangeNavPage(), arguments: {
        'title': '远程办',
        'image': 'ycb',
        'hideRightAction': true
      });
    }
    if (name == '绿色空间') {
      Get.to(() => ChangeNavPage(), arguments: {
        'title': '绿色空间',
        'image': 'lskj',
        'hideRightAction': true
      });
    }
    if (name == '微信绑定') {
      Get.to(() => FixedNavPage(), arguments: {
        'title': '微信绑定',
        'image': 'wxbd',
        'hideRightAction': true
      });
    }
    if (name == '工银i豆商城') Routes.gongYinIDou.push;
    if (name == '信用报告') Routes.creditReport.push;
    if (name == '结售汇') Routes.whmm.push;
    if (name == '理财') Get.to(() => FixedNavPage(), arguments: {
      'imageList': ['lc_1','lc_2'],
      'title': '理财',
      'right': true
    });
    if (name == '基金') Get.to(() => FixedNavPage(), arguments: {
      'imageList': ['jj_1','jj_2'],
      'title': '基金',
      'right': true
    });
    if (name == '更多') Routes.homeNormalMore.push;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sw / 1080 * 675 * 0.55,
      width: 375.w,
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: SwiperHorizontal(
          itemCount: dataList.length,
          activeColor: const Color(0xffD00000),
          color: const Color(0xffBEBEBE),
          widgetBuilder: (_, index) {
            return _swiperItemWidget(dataList[index], index);
          }),
    );
  }

  bool _hasTag(List data, int index) =>
      data[index]['name'] == '分期付款' || data[index]['name'] == '个人养老金';

  Widget _swiperItemWidget(List data, int idx) {
    return VerticalGridView(
      widgetBuilder: (_, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: _hasTag(data, index) ? 8.w : 0),
                  child: Image(
                    image: 'ic_fhome_${idx + 1}_${index + 1}'.png3x,
                    width: _hasTag(data, index) ? 28.w : 28.w,
                    height: 28.w,
                  ),
                ),
                // )
              ],
            ),
            SizedBox(
              height: 4.w,
            ),
            BaseText(
              text: data[index]['name'],
              style: TextStyle(
                  fontSize: 11.8.w,
                  fontFamily: 'PingFangSC',
                  color: Colors.black.withAlpha(180),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ).withOnTap(onTap: () => jumpPage(data[index]['name']));
      },
      itemCount: data.length,
      crossCount: 5,
      mainHeight: 1.sw / 1080 * 675 * 0.22,
      spacing: 5.w,
    );
  }
}
