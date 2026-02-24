import 'package:cbc/config/app_config.dart';
import 'package:cbc/config/model/month_bill_entity.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../utils/abc_button.dart';
import '../other/fixed_nav/fixed_nav_view.dart';
import 'bill_of_range_logic.dart';
import 'bill_of_range_state.dart';
import 'component/hai_bao_swiper.dart';

/// 月度账单、年度账单
class BillOfRangePage extends BaseStateless {
  BillOfRangePage({super.key});

  final BillOfRangeLogic logic = Get.put(BillOfRangeLogic());
  final BillOfRangeState state = Get.find<BillOfRangeLogic>().state;

  @override
  Widget? get titleWidget => Obx(
        () {
          var month = state.month.value;
          month = month <= 0 ? 12 + month : month;
          return SizedBox(
            height: 42.w,
            child: Stack(
              children: [
                Container(
                  width: 100.w,
                  height: 42.w,
                  alignment: Alignment.center,
                  child: BaseText(
                    text: '$month月账单',
                    fontSize: 17.w,
                    color: const Color(0xFF607483),
                  ),
                ),
                Positioned(
                  bottom: 3.w,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: 6.w,
                    height: 6.w,
                    child: Image(
                      image: 'ic_bill_month_down'.png3x,
                    ),
                  ),
                )
              ],
            ),
          ).withOnTap(onTap: () => Routes.billMore.push);
        },
      );

  @override
  Widget? get leftItem => Container(
        padding: EdgeInsets.symmetric(vertical: 12.w),
        child:
            Image(image: 'ic_left_back'.png3x, color: const Color(0xFF5B6A80)),
      ).withOnTap(onTap: () => Get.back());

  @override
  List<Widget>? get rightAction => [
        _buildTitleAction('ic_title_share', '分享'),
        _buildTitleAction('ic_title_service', '我的客服')
            .withOnTap(onTap: () => Routes.mineService.push),
        _buildTitleAction('ic_title_bill', '更多账单')
            .withOnTap(onTap: () => Routes.billMore.push),
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
    return GestureDetector(
      onTap: () {
        logic.showPop2.value = false;
        logic.showPop3.value = false;
        logic.showPop4.value = false;
      },
      child: Obx(() {
        return Stack(
          children: [
            PageView(
              controller: state.pageController,
              scrollDirection: Axis.vertical, // 设置为垂直方向
              onPageChanged: (index) {
                state.currentPageIndex.value = index; // 监听页面变化
              },
              children: [
                _buildPage0(),
                _buildPage1(),
                _buildPage2(),
                _buildPage3(),
                _buildPage4(),
                _buildPage5(),
                _buildPage6(),
                _buildPage7(),
                _buildPage8(),
              ],
            ),
            if (state.currentPageIndex.value != 8)
              Positioned(
                left: 173.w,
                bottom: 10.w,
                child: Image(
                  image: 'ic_bill_page_next'.png3x,
                  width: 24.w,
                ).withOnTap(
                  onTap: () => state.pageController.animateToPage(
                    state.pageController.page!.ceil() + 1,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease,
                  ),
                ),
              ),
            if (state.currentPageIndex.value != 0)
              Positioned(
                right: 20.w,
                bottom: 75.w,
                child: Image(
                  image: 'ic_bill_of_range_back_top'.png3x,
                  width: 48.w,
                ).withOnTap(
                  onTap: () => state.pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 240),
                    curve: Curves.ease,
                  ),
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget _buildPage8() {
    return Container(
      padding: EdgeInsets.only(top: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image(
                image: 'bg_bill_of_range_tow_top_long'.png3x,
                width: 345.w,
                height: 648.w,
                fit: BoxFit.fill,
              ),
              Positioned(
                left: 21.w,
                top: 35.w,
                child: Image(
                  image: 'ic_bill_icon'.png3x,
                  width: 12.w,
                ),
              ),
              Positioned(
                left: 41.w,
                top: 31.w,
                child: BaseText(
                  text: '我的画像',
                  fontSize: 15.w,
                  color: const Color(0xFF662222),
                ),
              ),
              Positioned(
                left: 38.w,
                top: 70.w,
                child: Image(
                  image: 'img_bill_poster_round'.png3x,
                  width: 275.w,
                ),
              ),
              Positioned(
                left: 21.w,
                top: 352.w,
                child: Image(
                  image: 'ic_bill_icon'.png3x,
                  width: 12.w,
                ),
              ),
              Positioned(
                left: 41.w,
                top: 348.w,
                child: BaseText(
                  text: '重要时刻',
                  fontSize: 15.w,
                  color: const Color(0xFF662222),
                ),
              ),
              Positioned(
                left: 19.w,
                top: 382.w,
                child: Container(
                  width: 308.w,
                  height: 240.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFF5DFBE),
                      width: 2.5.w,
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x22FADC8C),
                        Color(0x44FADC8C),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 82.w,
                top: 397.w,
                child: Container(
                  width: 174.w,
                  height: 26.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.w),
                    color: const Color(0x1BCF2539),
                  ),
                  alignment: Alignment.center,
                  child: BaseText(
                    text:
                        "${AppConfig.config.abcLogic.memberInfo.openTime}您成为工行客户",
                    fontSize: 11.5.w,
                    color: const Color(0xFFCF1C30),
                  ),
                ),
              ),
              Positioned(
                left: 27.w,
                top: 435.w,
                child: Container(
                  width: 116.w,
                  height: 41.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.w),
                    color: const Color(0x66FADC8C),
                  ),
                  padding: EdgeInsets.only(left: 10.w, top: 4.w),
                  child: BaseText(
                    text: AppConfig.config.abcLogic.memberInfo.openTime,
                    fontSize: 9.5.w,
                    color: const Color(0xFF454545),
                  ),
                ),
              ),
              Positioned(
                left: 37.w,
                top: 456.w,
                child: BaseText(
                  text: "开通电子银行",
                  fontSize: 9.8.w,
                  color: const Color(0xFF454545),
                ),
              ),
              Positioned(
                left: 168.w,
                top: 423.w,
                child: Container(
                  width: 2.w,
                  height: 25.w,
                  color: const Color(0xFFBB0000),
                ),
              ),
              Positioned(
                left: 160.w,
                top: 447.w,
                child: Container(
                  width: 17.5.w,
                  height: 17.5.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    border: Border.all(
                      color: const Color(0xFFBB0000),
                      width: 2.8.w,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 168.w,
                top: 463.w,
                child: Container(
                  width: 2.w,
                  height: 25.w,
                  color: const Color(0xFFBB0000),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.w),
              color: const Color(0xFFBB0000),
            ),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.w),
            child: BaseText(
              text: '生成我的海报',
              fontSize: 14.w,
              color: const Color(0xFFFFFFFF),
            ),
          ).withOnTap(onTap: () {
            AlterWidget.alterWidget(builder: (context) {
              return SizedBox(
                width: 1.sw,
                height: 1.sh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 456.w,
                      width: 345.w + 20.w,
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: HaiBaoSwiper(
                          itemCount: 4,
                          activeColor: const Color(0xffD00000),
                          color: const Color(0xffBEBEBE),
                          widgetBuilder: (_, index) {
                            return Stack(
                              children: [
                                Image(
                                  image: 'bg_schb'.png3x,
                                  width: 345.w,
                                  height: 456.w,
                                ).withPadding(
                                  left: 10.w,
                                  right: 10.w,
                                ),
                                Positioned(
                                    left: 20.w,
                                    top: 302.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            BaseText(
                                              text: state.titleName[index],
                                              style: TextStyle(
                                                  color: Color(0xff684D47),
                                                  fontSize: 16.sp,
                                                  height: 1),
                                            ),
                                            SizedBox(
                                              width: 6.w,
                                            ),
                                            Obx(
                                              () => BaseText(
                                                text: logic.showMoney.value
                                                    ? logic.moneyStr(index)
                                                    : "****",
                                                style: TextStyle(
                                                    color: BColors.mainColor,
                                                    fontSize: 16.sp,
                                                    height: 1),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4.w,
                                        ),
                                        BaseText(
                                          text: state.contentName[index],
                                          style: TextStyle(
                                              color: Color(0xff684D47)
                                                  .withOpacity(0.8),
                                              fontSize: 12.sp),
                                        ),
                                      ],
                                    )),
                                Positioned(
                                  right: 30.w,
                                  top: 296.w,
                                  child: Obx(() => Image(
                                        image: logic.showMoney.value
                                            ? 'ic_eye_open'.png3x
                                            : 'ic_eye_close'.png3x,
                                        width: 18.w,
                                        height: 18.w,
                                        color: Color(0xff684D47),
                                      ).withOnTap(onTap: () {
                                        logic.showMoney.value =
                                            !logic.showMoney.value;
                                      })),
                                ),
                                Positioned(
                                  right: 25.w,
                                  top: 355.w,
                                  child: GetBuilder(
                                    builder: (BillOfRangeLogic c) {
                                      return logic.qrImage == null
                                          ? SizedBox(
                                              width: 60.w,
                                              height: 60.w,
                                            )
                                          : PrettyQrView(
                                              qrImage: logic.qrImage!,
                                            ).withContainer(
                                              width: 60.w, height: 60.w);
                                    },
                                    id: 'code',
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    Image(
                      image: 'ic_schb_close'.png3x,
                      width: 35.w,
                      height: 35.w,
                    ).withOnTap(onTap: () {
                      SmartDialog.dismiss();
                    }),
                    AbcButton(
                      title: '确定',
                      height: 35.w,
                      width: 220.w,
                      radius: 20.w,
                      bgColor: const Color(0xFFBB0000),
                      onTap: () {},
                      margin:
                          EdgeInsets.only(left: 12.w, right: 12.w, top: 20.w),
                    )
                  ],
                ),
              );
            });
          }),
        ],
      ),
    );
  }

  Widget _buildPage7() {
    return Container(
      // padding: EdgeInsets.only(top: 20.w),
      child: Stack(
        children: [
          Image(
            image: 'new_img_bill_page_7'.png3x,
          ),

          Positioned(
            top: 100.w,
            left: 121.w,
            child: BaseText(
              text: '12',
              color: BColors.mainColor,
              fontSize: 12.sp,
            ),
          ),

          Positioned(
            top: 100.w,
            right: 109.w,
            child: BaseText(
              text: '0',
              color: BColors.mainColor,
              fontSize: 12.sp,
            ),
          ),

          Positioned(
            top: 156.w,
            left: 86.w,
            child: BaseText(
              text: '230',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
          ),

          Positioned(
            top: 220.w,
            left: 86.w,
            child: BaseText(
              text: '0',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
          ),

          Positioned(
            top: 346.w,
            left: 45.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                  text: AppConfig.config.abcLogic.card(),
                  fontSize: 14.sp,
                  color: Color(0xff521F19),
                ),
                SizedBox(
                  height: 2.w,
                ),
                BaseText(
                  text: '${AppConfig.config.abcLogic.openTime().year}年' +
                      '${AppConfig.config.abcLogic.openTime().month}月' +
                      '${AppConfig.config.abcLogic.openTime().day + 3}日',
                  fontSize: 11.sp,
                  color: Color(0xff521F19),
                ),
                SizedBox(
                  height: 5.w,
                ),
                BaseText(
                  text: '${AppConfig.config.abcLogic.openTime().year}年' +
                      '${AppConfig.config.abcLogic.openTime().month}月' +
                      '${AppConfig.config.abcLogic.openTime().day + 5}日',
                  fontSize: 11.sp,
                  color: Color(0xff521F19),
                ),
                SizedBox(
                  height: 5.w,
                ),
                BaseText(
                  text: '${AppConfig.config.abcLogic.openTime().year}年' +
                      '${AppConfig.config.abcLogic.openTime().month}月' +
                      '${AppConfig.config.abcLogic.openTime().day + 3}日',
                  fontSize: 11.sp,
                  color: Color(0xff521F19),
                ),
              ],
            ),
          ),

          // Positioned(
          //   top: 142.w,
          //   left: 205.w,
          //   child: Container(
          //     color: Colors.red,
          //     width: 50.w,
          //     height: 20.w,
          //   ).withOnTap(onTap: () => Routes.personalPoints.push),
          // ),
          // Positioned(
          //   top: 140.w,
          //   left: 265.w,
          //   child: Container(
          //     color: Colors.red,
          //     width: 70.w,
          //     height: 26.w,
          //   ).withOnTap(onTap: () => Routes.pointsStore.push),
          // ),
          // Positioned(
          //   top: 200.w,
          //   left: 280.w,
          //   child: Container(
          //     color: Colors.red,
          //     width: 42.w,
          //     height: 26.w,
          //   ).withOnTap(onTap: () => Routes.carbonSpace.push),
          // ),
          // Positioned(
          //   top: 200.w,
          //   left: 125.w,
          //   child: Container(
          //     color: Colors.red,
          //     width: 42.w,
          //     height: 26.w,
          //   ).withOnTap(onTap: () => Routes.insteadMoney.push),
          // ),

          Positioned(
            top: 150.w,
            left: 35.w,
            child: Container(
              width: 306.w,
              height: 28.w,
            ).withOnTap(onTap: () => Routes.gongYinIDou.push),
          ),
          Positioned(
            top: 215.w,
            left: 35.w,
            child: Container(
              width: 306.w,
              height: 28.w,
            ).withOnTap(onTap: () => Routes.insteadMoney.push
                // Routes.personalLevel.push
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage6() {
    return Container(
      padding: EdgeInsets.only(top: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image(
                image: 'img_bill_bank_card'.jpg3x,
                width: 1.sw,
                height: 408.w,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 308.w,
                left: 78.w,
                child: SizedBox(
                  width: 222.w,
                  height: 38.w,
                ).withOnTap(onTap: () => Routes.sqxyk.push),
              ),
            ],
          ),
          Image(
            image: 'img_bill_ad2'.png3x,
            width: 345.w,
          ).withPadding(
            top: 10.w,
          ),
        ],
      ),
    );
  }

  Widget _buildPage5() {
    return Container(
      padding: EdgeInsets.only(top: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image(
                image: 'img_bill_page_5'.jpg3x,
                width: 1.sw,
              ),
            ],
          ),
          Image(
            image: 'img_bill_ad3'.png3x,
            width: 345.w,
          ).withPadding(
            top: 10.w,
          ),
        ],
      ),
    );
  }

  Widget _buildPage4() {
    return Container(
      child: Stack(
        children: [
          Image(
            image: 'img_bill_page_4'.png3x,
            width: 1.sw,
          ),
          Positioned(
            left: 21.w,
            top: 192.w,
            child: _buildLineChart4(),
          ),
          Positioned(
            left: 51.w,
            top: 95.w,
            child: BaseText(
              text:
                  (state.monthData.value.capital?.totalAmount ?? 0).bankBalance,
              fontSize: 18.w,
              color: const Color(0xFF4C241A),
            ),
          ),
          // 较上月
          Positioned(
            left: 102.w,
            top: 124.5.w,
            child: BaseText(
              text: (state.monthData.value.capital?.totalAmountDiff ?? 0)
                  .bankBalance,
              fontSize: 13.w,
              color: const Color(0xFF4C241A),
            ),
          ),
          Positioned(
            top: 75.w,
            left: 90.w,
            child: Container(
              width: 20.w,
              height: 20.w,
            ).withOnTap(onTap: () {
              logic.showPop4.value = !logic.showPop4.value;

            }),
          ),

          Positioned(
            top: 86.w,
            right: 52.w,
            child: SizedBox(
              width: 48.w,
              height: 48.w,
            ).withOnTap(onTap: () {
              Get.to(() => FixedNavPage(), arguments: {
                'imageList': ['zczd'],
                'title': '资产诊断',
                'right': true
              });
            }),
          ),
          logic.showPop4.value ?
          Positioned(
              top: 42.w,
              left: 108.w,
              child: Image(image: "month_bill_all_pop".png, width: 200.w,)) : SizedBox(),
        ],
      ),
    );
  }

  Widget _buildLineChart4() {
    return SizedBox(
      width: 335.w,
      height: 90.w,
      child: SfCartesianChart(
        borderWidth: 0,
        borderColor: Colors.transparent,
        primaryXAxis: CategoryAxis(
          labelStyle: TextStyle(
            color: const Color(0x663E340D),
            fontSize: 11.w,
          ),
          majorGridLines: const MajorGridLines(
            width: 0,
            color: Colors.transparent,
          ),
        ),
        primaryYAxis: NumericAxis(
          desiredIntervals: 2,
          // 增加刻度线数量
          // 隐藏Y轴标签
          labelStyle: const TextStyle(color: Colors.transparent, fontSize: 0),
          // 隐藏Y轴线
          axisLine: const AxisLine(
            width: 0,
            color: Colors.transparent,
          ),
          // 隐藏网格线
          majorGridLines: MajorGridLines(
            width: 1.w,
            color: const Color(0x443E340D),
            dashArray: const <double>[5, 2], // 设置Y轴网格线为虚线
          ),
          // 隐藏刻度线
          majorTickLines: const MajorTickLines(
            width: 0,
            color: Colors.transparent,
          ),
        ),
        series: <CartesianSeries>[
          LineSeries<MonthBillCapitalTrendList, String>(
            dataSource: (state.monthData.value.capital?.trendList ?? [])
                .reversed
                .toList(),
            xValueMapper: (data, _) => data.month,
            yValueMapper: (data, _) => data.amount,
            color: const Color(0xFFD3B36B),
            width: 3.w,
            // 启用数据标签并设置样式
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              // 显示数据标签
              labelPosition: ChartDataLabelPosition.outside,
              // 标签位置在点的外部（上方）
              textStyle: TextStyle(
                color: const Color(0xFF594317),
                fontSize: 9.w,
              ),
              // 自定义标签格式
              labelAlignment: ChartDataLabelAlignment.top,
              builder: (dynamic data, dynamic point, dynamic series,
                  int pointIndex, int seriesIndex) {
                return Container(
                  padding: EdgeInsets.all(2.w),
                  child: Text(
                    (data as MonthBillCapitalTrendList).amount.bankBalance,
                    style: TextStyle(
                      color: const Color(0xFF594317),
                      fontSize: 9.w,
                    ),
                  ),
                );
              },
            ),
            markerSettings: MarkerSettings(
              isVisible: true,
              color: Colors.white,
              borderColor: const Color(0xFFD3B36B),
              borderWidth: 1.5.w,
              height: 7.w,
              width: 7.w,
            ),
          ),
        ],
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  Widget _buildPage3() {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(top: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image(
                  image: state.page3Tab0.value
                      ? 'img_bill_page_zc'.png3x
                      : 'img_bill_page_3_2'.png3x,
                  width: 1.sw,
                ),
                Positioned(
                  left: 56.w,
                  top: 31.5.w,
                  child: BaseText(
                    text: "我的支出",
                    fontSize: 15.w,
                    color: const Color(0xFF4C241A),
                  ),
                ),
                Positioned(
                  left: 54.w,
                  top: 73.w,
                  child: BaseText(
                    text: "总收入",
                    fontSize: 12.w,
                    color: const Color(0xFF4C241A),
                  ),
                ),
                if (!state.page3Tab0.value)
                  Positioned(
                    left: 56.w,
                    top: 188.w,
                    child: BaseText(
                      text: "历史支出走势",
                      fontSize: 13.5.w,
                      color: const Color(0xFF4C241A),
                    ),
                  ),
                Positioned(
                  left: 53.w,
                  top: 93.w,
                  child: BaseText(
                    text: (state.monthData.value.income?.totalAmount ?? 0)
                        .bankBalance,
                    fontSize: 18.w,
                    color: const Color(0xFF4C241A),
                  ),
                ),
                // 较上月
                Positioned(
                  left: 102.w,
                  top: 123.w,
                  child: BaseText(
                    text: (state.monthData.value.custom?.monthCashSurplusDiff ??
                        0)
                        .bankBalance,

                    fontSize: 13.w,
                    color: const Color(0xFF4C241A),
                  ),
                ),
                if (!state.page3Tab0.value)
                  Positioned(
                    top: 216.w,
                    left: 21.w,
                    child: _buildLineChart3(),
                  ),
                if (!state.page3Tab0.value)
                  Positioned(
                    top: 505.w,
                    left: 52.w,
                    child: SizedBox(
                      width: 280.w,
                      child: BaseText(
                        style: TextStyle(
                          color: const Color(0xFF4C241A),
                          fontSize: 12.5.w,
                          height: 1.5,
                        ),
                        text:
                            "您这个月共有${state.monthData.value.income?.count ?? 0}笔支出，适当消费，有助于提升幸福感~",
                        textAlign: TextAlign.left,
                        maxLines: 2,
                      ),
                    ),
                  ),

                if (state.page3Tab0.value)
                  Positioned(
                      top: 150.w,
                      left: 40.w,
                      child: Column(
                        children: [
                          Container(
                              width: 260.w,
                              height: 260.w,
                              child: SfCircularChart(
                                  margin: EdgeInsets.zero,
                                  series: <CircularSeries>[
                                    DoughnutSeries<SalesData, String>(
                                      dataSource: state.data2,
                                      xValueMapper: (SalesData data, _) =>
                                      data.title,
                                      yValueMapper: (SalesData data, _) =>
                                      data.sales,
                                      pointColorMapper: (SalesData data, _) =>
                                      data.color,
                                      animationDuration: 500,
                                      dataLabelMapper:
                                          (SalesData data, int index) {
                                        return '${data.sales}\n${data.title}';
                                      },
                                      dataLabelSettings: DataLabelSettings(
                                        isVisible: true,
                                        labelPosition:
                                        ChartDataLabelPosition.inside,
                                        // 标签显示在外侧
                                        textStyle: TextStyle(
                                          fontSize: 10.sp,
                                          color: const Color(0xFF4C241A),
                                        ),
                                        // 不使用系列颜色
                                        overflowMode: OverflowMode.shift,
                                        connectorLineSettings: const ConnectorLineSettings(
                                          type: ConnectorType.line,
                                          width: 1,
                                          color: BColors.main1Color,
                                        ),
                                      ),
                                      radius: '50%',    // 外圆半径（相对于图表容器）
                                      innerRadius: '65%', // 内圆半径（相对于外圆半径）
                                    )
                                  ])),

                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index){
                              SalesData data = state.data2[index];
                              return Container(
                                padding: EdgeInsets.only(bottom:4.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 12.w),
                                          width: 110.w,
                                          child: Row(
                                            children: [
                                              createCircleWithHole(
                                                  size: 13.w,
                                                  color: data.color,
                                                  borderWidth: 3.w
                                              ),
                                              SizedBox(width: 4.w,),
                                              BaseText(text: data.title),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          width: 80.w * (data.rate/100),
                                          height: 4.w,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(4.w)),
                                              color:  BColors.main1Color
                                          ),
                                        ),
                                        SizedBox(width: 12.w,),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        BaseText(text: '¥${data.sales.bankBalance}'),
                                        Image(image: 'ic_jt_right'.png3x,width: 16.w,height: 16.w,)
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },itemCount: state.data2.length,).withContainer(
                            height: 140.w,
                            width: 1.sw - 80.w,
                          )
                        ],
                      )),
                if (state.page3Tab0.value)
                  Positioned(
                      top: 540.w,
                      left: 27.w,
                      child:    Stack(
                        children: [
                          Image(image: 'bottom_chart'.png3x,width: 1.sw - 60.w,height: 125.w,fit: BoxFit.fill,),

                          Positioned(
                            top: 10.w,
                            left: 20.w,
                            child: SizedBox(
                              width: 280.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BaseText(
                                    style: TextStyle(
                                      color: const Color(0xFF4C241A),
                                      fontSize: 12.5.w,
                                      height: 1.5,
                                    ),
                                    text:
                                    "您这个月共有${state.monthData.value.income?.count ?? 0}笔支出，适当消费，有助于提升幸福感~",
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      BaseText(text: '${state.monthData.value.expenses?.maxAmount ?? 0}',
                                        style: TextStyle(
                                          color: const Color(0xFF4C241A),
                                          fontSize: 12.5.w,
                                          height: 1.5,
                                        ),
                                      ),
                                      SizedBox(height: 8.w,),
                                      BaseText(text: state.monthData.value.expenses?.realName ?? '',
                                        style: TextStyle(
                                          color: const Color(0xFF4C241A),
                                          fontSize: 12.5.w,
                                          height: 1.5,
                                        ),
                                      )
                                    ],
                                  ).withPadding(
                                      top: 10.w,
                                      left: 88.w
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),

                Positioned(
                  top: 160.w,
                  left: 76.w,
                  child: Container(
                    width: 86.w,
                    height: 25.w,
                  ).withOnTap(
                    onTap: () => state.page3Tab0.value = true,
                  ),
                ),
                Positioned(
                  top: 160.w,
                  left: 214.w,
                  child: SizedBox(
                    width: 86.w,
                    height: 25.w,
                  ).withOnTap(
                    onTap: () => state.page3Tab0.value = false,
                  ),
                ),
                Positioned(
                  top: 75.w,
                  left: 90.w,
                  child: Container(
                    width: 20.w,
                    height: 20.w,
                  ).withOnTap(onTap: () {
                    logic.showPop3.value = !logic.showPop3.value;
                    /// 感叹号
                  }),
                ),
                logic.showPop3.value ?
                Positioned(
                    top: 66.w,
                    left: 112.w,
                    child: Image(image: "month_bill_pay_pop".png, width: 200.w,)) : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineChart3() {
    return SizedBox(
      width: 335.w,
      height: 240.w,
      child: SfCartesianChart(
        borderWidth: 0,
        borderColor: Colors.transparent,
        primaryXAxis: CategoryAxis(
          labelStyle: TextStyle(
            color: const Color(0x663E340D),
            fontSize: 11.w,
          ),
          majorGridLines: const MajorGridLines(
            width: 0,
            color: Colors.transparent,
          ),
        ),
        primaryYAxis: NumericAxis(
          desiredIntervals: 10,
          // 增加刻度线数量
          // 隐藏Y轴标签
          labelStyle: const TextStyle(color: Colors.transparent, fontSize: 0),
          // 隐藏Y轴线
          axisLine: const AxisLine(
            width: 0,
            color: Colors.transparent,
          ),
          // 隐藏网格线
          majorGridLines: MajorGridLines(
            width: 1.w,
            color: const Color(0x443E340D),
            dashArray: const <double>[5, 2], // 设置Y轴网格线为虚线
          ),
          // 隐藏刻度线
          majorTickLines: const MajorTickLines(
            width: 0,
            color: Colors.transparent,
          ),
        ),
        series: <CartesianSeries>[
          LineSeries<MonthBillExpensesTrendList, String>(
            dataSource: (state.monthData.value.expenses?.trendList ?? [])
                .reversed
                .toList(),
            xValueMapper: (data, _) => data.month,
            yValueMapper: (data, _) => data.amount,
            color: const Color(0xFFD3B36B),
            width: 3.w,
            // 启用数据标签并设置样式
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              // 显示数据标签
              labelPosition: ChartDataLabelPosition.outside,
              // 标签位置在点的外部（上方）
              textStyle: TextStyle(
                color: const Color(0xFF594317),
                fontSize: 9.w,
              ),
              // 自定义标签格式
              labelAlignment: ChartDataLabelAlignment.top,
              builder: (dynamic data, dynamic point, dynamic series,
                  int pointIndex, int seriesIndex) {
                return Container(
                  padding: EdgeInsets.all(2.w),
                  child: Text(
                    (data as MonthBillExpensesTrendList).amount.bankBalance,
                    style: TextStyle(
                      color: const Color(0xFF594317),
                      fontSize: 9.w,
                    ),
                  ),
                );
              },
            ),
            markerSettings: MarkerSettings(
              isVisible: true,
              color: Colors.white,
              borderColor: const Color(0xFFD3B36B),
              borderWidth: 1.5.w,
              height: 7.w,
              width: 7.w,
            ),
          ),
        ],
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  Widget _buildPage2() {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(top: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              // 您这个月共有0笔收入，请再接再厉，财富自由指日可待！
              children: [
                Image(
                  image: state.page2Tab0.value
                      ? 'img_bill_page_cat'.png3x
                      : 'img_bill_page_2_2'.png3x,
                  width: 1.sw,
                ),
                Positioned(
                  left: 53.w,
                  top: 93.w,
                  child: BaseText(
                    text: (state.monthData.value.income?.totalAmount ?? 0)
                        .bankBalance,
                    fontSize: 18.w,
                    color: const Color(0xFF4C241A),
                  ),
                ),
                // 较上月
                Positioned(
                  left: 102.w,
                  top: 123.w,
                  child: BaseText(
                    text: (state.monthData.value.custom?.monthCashSurplusDiff ??
                        0)
                        .bankBalance,
                    fontSize: 13.w,
                    color: const Color(0xFF4C241A),
                  ),
                ),
                if (!state.page2Tab0.value)
                  Positioned(
                    top: 216.w,
                    left: 21.w,
                    child: _buildLineChart2(),
                  ),
                if (!state.page2Tab0.value)
                  Positioned(
                    top: 505.w,
                    left: 52.w,
                    child: SizedBox(
                      width: 280.w,
                      child: BaseText(
                        style: TextStyle(
                          color: const Color(0xFF4C241A),
                          fontSize: 12.5.w,
                          height: 1.5,
                        ),
                        text:
                            "您这个月共有${state.monthData.value.income?.count ?? 0}笔收入，请再接再厉，财富自由指日可待！",
                        textAlign: TextAlign.left,
                        maxLines: 2,
                      ),
                    ),
                  ),
                if (state.page2Tab0.value)
                  Positioned(
                      top: 150.w,
                      left: 40.w,
                      child: Column(
                        children: [
                          Container(
                              width: 260.w,
                              height: 260.w,
                              child: SfCircularChart(
                                  margin: EdgeInsets.zero,
                                  series: <CircularSeries>[
                                    DoughnutSeries<SalesData, String>(
                                      dataSource: state.data1,
                                      xValueMapper: (SalesData data, _) =>
                                          data.title,
                                      yValueMapper: (SalesData data, _) =>
                                          data.sales,
                                      pointColorMapper: (SalesData data, _) =>
                                          data.color,
                                      animationDuration: 500,
                                      dataLabelMapper:
                                          (SalesData data, int index) {
                                        return '${data.sales}\n${data.title}';
                                      },
                                      dataLabelSettings: DataLabelSettings(
                                        isVisible: true,
                                        labelPosition:
                                        ChartDataLabelPosition.inside,
                                        // 标签显示在外侧
                                        textStyle: TextStyle(
                                          fontSize: 10.sp,
                                          color: const Color(0xFF4C241A),
                                        ),
                                        // 不使用系列颜色
                                        overflowMode: OverflowMode.shift,
                                        connectorLineSettings: const ConnectorLineSettings(
                                          type: ConnectorType.line,
                                          width: 1,
                                          color: BColors.mainColor,
                                        ),
                                      ),
                                      radius: '50%',    // 外圆半径（相对于图表容器）
                                      innerRadius: '65%', // 内圆半径（相对于外圆半径）
                                    )
                                  ])),

                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index){
                            SalesData data = state.data1[index];
                            return Container(
                              padding: EdgeInsets.only(bottom:4.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 12.w),
                                        width: 110.w,
                                        child: Row(
                                          children: [
                                            createCircleWithHole(
                                                size: 13.w,
                                                color: data.color,
                                                borderWidth: 3.w
                                            ),
                                            SizedBox(width: 4.w,),
                                            BaseText(text: data.title),

                                          ],
                                        ),
                                      ),

                                      Container(
                                        width: 80.w * (data.rate/100),
                                        height: 4.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(4.w)),
                                            color:  BColors.mainColor
                                        ),
                                      ),
                                      SizedBox(width: 12.w,),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      BaseText(text: '¥${data.sales.bankBalance}'),
                                      Image(image: 'ic_jt_right'.png3x,width: 16.w,height: 16.w,)
                                    ],
                                  )
                                ],
                              ),
                            );
                          },itemCount: state.data1.length,).withContainer(
                            height: 140.w,
                            width: 1.sw - 80.w,
                          )
                        ],
                      )),
                if (state.page2Tab0.value)
                Positioned(
                    top: 540.w,
                    left: 27.w,
                    child:    Stack(
                  children: [
                    Image(image: 'bottom_chart'.png3x,width: 1.sw - 60.w,height: 125.w,fit: BoxFit.fill,),

                    Positioned(
                      top: 10.w,
                      left: 20.w,
                      child: SizedBox(
                      width: 280.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            style: TextStyle(
                              color: const Color(0xFF4C241A),
                              fontSize: 12.5.w,
                              height: 1.5,
                            ),
                            text:
                            "您这个月共有${state.monthData.value.income?.count ?? 0}笔收入，请再接再厉，财富自由指日可待！",
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BaseText(text: '${state.monthData.value.income?.maxAmount ?? 0}',
                                style: TextStyle(
                                  color: const Color(0xFF4C241A),
                                  fontSize: 12.5.w,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: 8.w,),
                              BaseText(text: '${state.monthData.value.income?.realName ?? ''}',
                                style: TextStyle(
                                  color: const Color(0xFF4C241A),
                                  fontSize: 12.5.w,
                                  height: 1.5,
                                ),
                              )
                            ],
                          ).withPadding(
                            top: 10.w,
                            left: 88.w
                          )
                        ],
                      ),
                    ),
                    )
                  ],
                )),
                Positioned(
                  top: 160.w,
                  left: 76.w,
                  child: SizedBox(
                    width: 86.w,
                    height: 25.w,
                  ).withOnTap(
                    onTap: () => state.page2Tab0.value = true,
                  ),
                ),
                Positioned(
                  top: 160.w,
                  left: 214.w,
                  child: SizedBox(
                    width: 86.w,
                    height: 25.w,
                  ).withOnTap(
                    onTap: () => state.page2Tab0.value = false,
                  ),
                ),
                Positioned(
                  top: 75.w,
                  left: 90.w,
                  child: Container(

                    width: 20.w,
                    height: 20.w,
                  ).withOnTap(onTap: () {
                    logic.showPop2.value = !logic.showPop2.value;
                    /// 感叹号
                  }),
                ),
                logic.showPop2.value ?
                Positioned(
                  top: 66.w,
                  left: 112.w,
                    child: Image(image: "month_bill_income_pop".png, width: 200.w,)) : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLineChart2() {
    return SizedBox(
      width: 335.w,
      height: 240.w,
      child: SfCartesianChart(
        borderWidth: 0,
        borderColor: Colors.transparent,
        primaryXAxis: CategoryAxis(
          labelStyle: TextStyle(
            color: const Color(0x663E340D),
            fontSize: 11.w,
          ),
          majorGridLines: const MajorGridLines(
            width: 0,
            color: Colors.transparent,
          ),
        ),
        primaryYAxis: NumericAxis(
          desiredIntervals: 10,
          // 增加刻度线数量
          // 隐藏Y轴标签
          labelStyle: const TextStyle(color: Colors.transparent, fontSize: 0),
          // 隐藏Y轴线
          axisLine: const AxisLine(
            width: 0,
            color: Colors.transparent,
          ),
          // 隐藏网格线
          majorGridLines: MajorGridLines(
            width: 1.w,
            color: const Color(0x443E340D),
            dashArray: const <double>[5, 2], // 设置Y轴网格线为虚线
          ),
          // 隐藏刻度线
          majorTickLines: const MajorTickLines(
            width: 0,
            color: Colors.transparent,
          ),
        ),
        series: <CartesianSeries>[
          LineSeries<MonthBillIncomeTrendList, String>(
            dataSource: (state.monthData.value.income?.trendList ?? [])
                .reversed
                .toList(),
            xValueMapper: (data, _) => data.month,
            yValueMapper: (data, _) => data.amount,
            color: const Color(0xFFD3B36B),
            width: 3.w,
            // 启用数据标签并设置样式
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              // 显示数据标签
              labelPosition: ChartDataLabelPosition.outside,
              // 标签位置在点的外部（上方）
              textStyle: TextStyle(
                color: const Color(0xFF594317),
                fontSize: 9.w,
              ),
              // 自定义标签格式
              labelAlignment: ChartDataLabelAlignment.top,
              builder: (dynamic data, dynamic point, dynamic series,
                  int pointIndex, int seriesIndex) {
                return Container(
                  padding: EdgeInsets.all(2.w),
                  child: Text(
                    (data as MonthBillIncomeTrendList).amount.bankBalance,
                    style: TextStyle(
                      color: const Color(0xFF594317),
                      fontSize: 9.w,
                    ),
                  ),
                );
              },
            ),
            markerSettings: MarkerSettings(
              isVisible: true,
              color: Colors.white,
              borderColor: const Color(0xFFD3B36B),
              borderWidth: 1.5.w,
              height: 7.w,
              width: 7.w,
            ),
          ),
        ],
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  Widget _buildPage1() {
    return Container(
      padding: EdgeInsets.only(top: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image(
                image: 'img_bill_page_1'.png3x,
                width: 1.sw,
              ),
              Positioned(
                left: 44.w,
                top: 69.w,
                child: BaseText(
                  text:
                      "¥${(state.monthData.value.income?.totalAmount ?? 0).bankBalance}",
                  fontSize: 16.w,
                  color: Colors.white,
                ),
              ),
              Positioned(
                right: 46.w,
                top: 69.w,
                child: BaseText(
                  text:
                      "¥${(state.monthData.value.expenses?.totalAmount ?? 0).bankBalance}",
                  fontSize: 16.w,
                  color: Colors.white,
                ),
              ),
              // 收支结余
              Positioned(
                left: 46.w,
                top: 146.w,
                child: BaseText(
                  text: (state.monthData.value.custom?.monthCashSurplus ?? 0)
                      .bankBalance,
                  fontSize: 15.w,
                  color: const Color(0xFF4C241A),
                ),
              ),
              // 较上月
              Positioned(
                right: 46.w,
                top: 150.w,
                child: Row(
                  children: [
                    BaseText(
                      text: '较上月: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: Color(0xFF4C241A)),
                    ),
                    BaseText(
                      text: (state.monthData.value.custom?.monthCashSurplusDiff ??
                          0)
                          .bankBalance,

                      style: TextStyle(
                          fontSize: 13.w,
                          color: const Color(0xFF4C241A),
                          height: 1.5),
                    )
                  ],
                ),
              ),
              // 我的资产
              Positioned(
                left: 46.w,
                top: 217.w,
                child: BaseText(
                  text: (state.monthData.value.capital?.totalAmount ?? 0)
                      .bankBalance,
                  fontSize: 14.w,
                  color: const Color(0xFF4C241A),
                ),
              ),
              // 存款占比
              Positioned(
                right: 46.w,
                top: 217.w,
                child: BaseText(
                  text: "100%",
                  fontSize: 12.w,
                  color: const Color(0xFF4C241A),
                ),
              ),
              // 我的负债
              Positioned(
                left: 46.w,
                top: 282.w,
                child: BaseText(
                  text: "${state.monthData.value.custom?.liability ?? 0}",
                  fontSize: 14.w,
                  color: const Color(0xFF4C241A),
                ),
              ),
              // 我的信用卡
              Positioned(
                right: 160.w,
                top: 282.w,
                child: BaseText(
                  text: "${state.monthData.value.custom?.creditCardNum ?? 0}",
                  fontSize: 14.w,
                  color: const Color(0xFF4C241A),
                ),
              ),
              // 信用卡占比
              Positioned(
                left: 106.w,
                top: 305.5.w,
                child: BaseText(
                  text: "0%",
                  fontSize: 11.w,
                  color: const Color(0xFF4C241A),
                ),
              ),
              // 信用卡消费笔数
              Positioned(
                right: 86.w,
                top: 305.5.w,
                child: BaseText(
                  text:
                      "${state.monthData.value.custom?.creditCardConsumeNum ?? 0}",
                  fontSize: 11.w,
                  color: const Color(0xFF4C241A),
                ),
              ),
              Positioned(
                top: 196.w,
                left: 34.w,
                child: SizedBox(
                  width: 308.w,
                  height: 60.w,
                ).withOnTap(
                  onTap: () => state.pageController.animateToPage(
                    4,
                    duration: const Duration(microseconds: 240),
                    curve: Curves.ease,
                  ),
                ),
              ),
              Positioned(
                top: 262.w,
                left: 34.w,
                child: SizedBox(
                  width: 148.w,
                  height: 70.w,
                ).withOnTap(
                  onTap: () => state.pageController.animateToPage(
                    5,
                    duration: const Duration(microseconds: 240),
                    curve: Curves.ease,
                  ),
                ),
              ),
              Positioned(
                top: 262.w,
                left: 194.w,
                child: SizedBox(
                  width: 148.w,
                  height: 70.w,
                ).withOnTap(
                  onTap: () => state.pageController.animateToPage(
                    6,
                    duration: const Duration(microseconds: 240),
                    curve: Curves.ease,
                  ),
                ),
              ),
              Positioned(
                top: 372.w,
                left: 34.w,
                child: SizedBox(
                  width: 148.w,
                  height: 56.w,
                ).withOnTap(
                  onTap: () => state.pageController.animateToPage(
                    7,
                    duration: const Duration(microseconds: 240),
                    curve: Curves.ease,
                  ),
                ),
              ),
              Positioned(
                top: 372.w,
                left: 194.w,
                child: SizedBox(
                  width: 148.w,
                  height: 56.w,
                ).withOnTap(
                  onTap: () => state.pageController.animateToPage(
                    8,
                    duration: const Duration(microseconds: 240),
                    curve: Curves.ease,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPage0() {
    return Obx(
      () {
        var month = state.month.value;
        month = month <= 0 ? 12 + month : month;
        return Stack(
          children: [
            Image(
              image: 'img_bill_cover$month'.jpg3x,
              width: 1.sw,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 10.w,
              bottom: 46.w,
              child: Image(
                image: 'bg_bill_header'.png3x,
                width: 46.w,
              ),
            ),
            Positioned(
              left: 10.w,
              bottom: 48.w,
              child: Container(
                width: 46.w,
                alignment: Alignment.center,
                child: BaseText(
                  text: AppConfig.config.abcLogic.memberInfo.realName
                      .removeFirstChar1(),
                  fontSize: 11.w,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 10.w,
              bottom: 46.w,
              child: Image(
                image: 'ic_bill_user_notify'.png3x,
                width: 46.w,
              ),
            ),
          ],
        );
      },
    );
  }
}

// 数据模型类
class ChartData {
  ChartData(this.month, this.amount);

  final String month;
  final double amount;
}
