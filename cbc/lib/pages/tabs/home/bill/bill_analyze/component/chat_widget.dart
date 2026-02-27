import 'package:cbc/pages/other/fixed_nav/fixed_nav_view.dart';
import 'package:cbc/pages/tabs/home/bill/bill_analyze/component/rank_widget.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/extension/double_extension.dart';

import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../bill_analyze_logic.dart';
import '../bill_analyze_state.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late TooltipBehavior _tooltipBehavior;

  final BillAnalyzeLogic logic = Get.put(BillAnalyzeLogic());
  final BillAnalyzeState state = Get.find<BillAnalyzeLogic>().state;

  @override
  void initState() {
    super.initState();
    _initializeBehaviors();
  }

  // 滚动到最后面

  void _initializeBehaviors() {
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        color: Colors.grey[600],
        borderColor: Colors.white,
        shouldAlwaysShow: true,
        shared: true,
        borderWidth: 1,
        builder: (dynamic d, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          DailyData e = d as DailyData;
          return Container(
            padding: const EdgeInsets.all(12),
            height: 85.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                  text: DateFormat(logic.selectName.value == '月度分析'
                          ? 'yyyy年MM月dd日'
                          : 'yyyy年')
                      .format(e.date),
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),

                // SizedBox(height: 4.w,),
                BaseText(
                  text: '收入:${e.income}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                // SizedBox(height: 4.w,),
                BaseText(
                  text: '支出:${e.expense}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        });
  }

  // 控制系列可见性
  bool _showIncome = true;
  bool _showExpense = true;

  Widget _tagWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 5.w, bottom: 3.w, left: 4.w, right: 4.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.w)),
            border: Border.all(
                color: type() == '1' ? BColors.mainColor : Color(0xff999999),
                width: 1.w),
          ),
          child: BaseText(
            textAlign: TextAlign.center,
            text: '全部',
            style: TextStyle(
              fontSize: 12.w,
              height: 1,
              color: type() == '1' ? BColors.mainColor : Color(0xff999999),
            ),
          ),
        ).withOnTap(onTap: () {
          _showIncome = true;
          _showExpense = true;
          setState(() {});
        }),
        SizedBox(
          width: 8.w,
        ),
        Container(
          padding:
              EdgeInsets.only(top: 5.w, bottom: 3.w, left: 4.w, right: 4.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.w)),
            border: Border.all(
                color: type() == '2' ? BColors.mainColor : Color(0xff999999),
                width: 1.w),
          ),
          child: BaseText(
            textAlign: TextAlign.center,
            text: '收入',
            style: TextStyle(
              fontSize: 12.w,
              height: 1,
              color: type() == '2' ? BColors.mainColor : Color(0xff999999),
            ),
          ),
        ).withOnTap(onTap: () {
          _showIncome = false;
          _showExpense = true;
          setState(() {});
        }),
        SizedBox(
          width: 8.w,
        ),
        Container(
          padding:
              EdgeInsets.only(top: 5.w, bottom: 3.w, left: 4.w, right: 4.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.w)),
            border: Border.all(
                color:
                    type() == '3' ? BColors.mainColor : const Color(0xff999999),
                width: 1.w),
          ),
          child: BaseText(
            textAlign: TextAlign.center,
            text: '支出',
            style: TextStyle(
              fontSize: 12.w,
              height: 1,
              color:
                  type() == '3' ? BColors.mainColor : const Color(0xff999999),
            ),
          ),
        ).withOnTap(onTap: () {
          _showIncome = true;
          _showExpense = false;
          setState(() {});
        }),
      ],
    ).withContainer(width: 1.sw);
  }

  String getChineseUnitSimple(double number) {
    if (number < 1000) {
      return '';
    }

    final absNumber = number.abs();
    final digits = absNumber.toStringAsFixed(0).length;

    if (digits <= 4) {
      return '千';
    } else if (digits <= 5) {
      return '万';
    } else if (digits <= 6) {
      return '十万';
    } else if (digits <= 7) {
      return '百万';
    } else if (digits <= 8) {
      return '千万';
    } else if (digits <= 9) {
      return '亿';
    } else if (digits <= 10) {
      return '十亿';
    } else if (digits <= 11) {
      return '百亿';
    } else if (digits <= 12) {
      return '千亿';
    } else {
      return '万亿';
    }
  }

  Widget _topWidget() {
    return GetBuilder(
      builder: (BillAnalyzeLogic c) {
        double t =
            (logic.model?.expenses ?? 0).abs() + (logic.model?.income ?? 0);
        return Container(
          child: Column(
            children: [
              Row(
                children: [
                  BaseText(
                    text: '收支对比',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BaseText(
                        text: '收入(元)',
                        style: TextStyle(
                            color: Color(0xff999999),
                            fontWeight: FontWeight.w400),
                      ),
                      BaseText(
                        text: (logic.model?.income ?? 0).bankBalance,
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.bold),
                      ),
                      getChineseUnitSimple(logic.model?.income ?? 0) == ''?SizedBox.shrink():Container(
                        padding: EdgeInsets.only( right: 2.w),
                        color: BColors.mainColor.withOpacity(0.05),
                        margin: EdgeInsets.only(left: 4.w,top: 2.w),
                        child: BaseText(
                          text: getChineseUnitSimple(logic.model?.income ?? 0),
                          color: BColors.mainColor,
                          fontSize: 10.sp,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const BaseText(
                        text: '支出(元)',
                        style: TextStyle(
                            color: Color(0xff999999),
                            fontWeight: FontWeight.w400),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(
                            text: (logic.model?.expenses ?? 0).abs().bankBalance,
                            style: TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.bold),
                          ),

                          getChineseUnitSimple((logic.model?.expenses ?? 0).abs()) == ''?const SizedBox.shrink(): Container(
                            padding: EdgeInsets.only(right: 2.w),
                            color: BColors.main1Color.withOpacity(0.05),
                            margin: EdgeInsets.only(left: 4.w,top: 2.w),
                            child: BaseText(
                              text: getChineseUnitSimple((logic.model?.expenses ?? 0).abs()),
                              color: BColors.main1Color,
                              fontSize: 10.sp,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 12.w,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6.w),
                child: Row(
                  children: [
                    Container(
                      height: 6.w,
                      width: (1.sw - 52.w) *
                          (t == 0 ? 0.5 : (logic.model!.income / t)),
                      decoration: BoxDecoration(
                          color: logic.model == null
                              ? Colors.white
                              : BColors.mainColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6.w),
                            bottomLeft: Radius.circular(6.w),
                          )),
                    ),
                    Container(
                      height: 6.w,
                      width: (1.sw - 52.w) *
                          (t == 0 ? 0.5 : (logic.model!.expenses.abs() / t)),
                      decoration: BoxDecoration(
                          color: logic.model == null
                              ? Colors.white
                              : BColors.main1Color,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6.w),
                            bottomRight: Radius.circular(6.w),
                          )),
                    )
                  ],
                ).withContainer(
                  width: 1.sw - 52.w,
                ),
              )
            ],
          ),
        );
      },
      id: 'updateRank',
    );
  }

  Widget _shouzhijieyuWidget() {
    return GetBuilder(
      builder: (BillAnalyzeLogic c) {
        double t =
            (logic.model?.expenses ?? 0).abs() - (logic.model?.income ?? 0);
        return Container(
          width: 1.sw,
          alignment: Alignment.centerRight,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BaseText(
                text: t > 0 ? '超支 ' : '结余  ',
                fontSize: 13.sp,
                color: Color(0xff666666),
              ),
              BaseText(
                text: (t.abs()).bankBalance,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: t > 0?BColors.main1Color:BColors.mainColor
                ),
              )
            ],
          ),
        );
      },
      id: 'updateRank',
    );
  }


  String type() {
    if (_showIncome && _showExpense) return '1';
    if (!_showIncome && _showExpense) return '2';
    if (_showIncome && !_showExpense) return '3';
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(height: 16),
            _topWidget(),
            const SizedBox(height: 16),
            _shouzhijieyuWidget(),
            const SizedBox(height: 12),
            _tagWidget(),
            const SizedBox(height: 16),
            Stack(
              children: [
                Container(
                  height: 180.w,
                  width: 1.sw,
                  padding: EdgeInsets.only(bottom: 18.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 1.sw,
                        height: 0.5,
                        color: const Color(0xffdedede),
                      ),
                      Container(
                        width: 1.sw,
                        height: 0.5,
                        color: const Color(0xffdedede),
                      ),
                      Container(
                        width: 1.sw,
                        height: 0.5,
                        color: const Color(0xffdedede),
                      ),
                      Container(
                        width: 1.sw,
                        height: 0.5,
                        color: const Color(0xffdedede),
                      ),
                      Container(
                        width: 1.sw,
                        height: 0.5,
                        color: const Color(0xffdedede),
                      ),
                      Container(
                        width: 1.sw,
                        height: 1.w,
                        color: const Color(0xffdedede),
                      ),
                    ],
                  ),
                ),
                GetBuilder(
                  builder: (BillAnalyzeLogic c) {
                    return SingleChildScrollView(
                      controller: logic.aScrollController,
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          height: 180.w,
                          width: (1.sw - 60) / 6 * state.monthDailyData.length,
                          child: SfCartesianChart(
                            tooltipBehavior: _tooltipBehavior,
                            plotAreaBorderWidth: 0,
                            borderWidth: 0,
                            margin: EdgeInsets.zero,
                            enableSideBySideSeriesPlacement: true,
                            primaryXAxis: CategoryAxis(
                              axisLabelFormatter:
                                  (AxisLabelRenderDetails details) {
                                DateTime dateTime =
                                    DateTime.parse(details.text);
                                int month = dateTime.month; // 获取月份（1-12）
                                int year = dateTime.year;
                                // 如果是1月，展示类似“26年1月”的格式，否则只展示“x月”
                                return ChartAxisLabel(
                                  logic.selectName.value == '月度分析'
                                      ? (month == 1
                                          ? '${year % 100}年$month月'
                                          : '$month月')
                                      : '$year年',
                                  TextStyle(
                                    fontSize: 10.sp,
                                  ),
                                );
                              },
                              axisLine: AxisLine(width: 0),
                              majorTickLines: MajorTickLines(width: 0),
                              majorGridLines: MajorGridLines(width: 0),
                              autoScrollingMode: AutoScrollingMode.end,
                            ),
                            primaryYAxis: NumericAxis(
                              isVisible: true,
                              majorTickLines: MajorTickLines(size: 0),
                              majorGridLines: MajorGridLines(width: 0),
                              axisLine: AxisLine(width: 0),
                              labelStyle: TextStyle(
                                fontSize: 0,
                                color: Colors.transparent,
                              ),
                              edgeLabelPlacement: EdgeLabelPlacement.none,
                              minimum: 0,
                              // 确保 Y 轴从 0 开始，或者设置为适当的最小值
                              maximum: state.monthDailyData.isNotEmpty
                                  ? state.monthDailyData
                                          .map((e) => e.income)
                                          .reduce((a, b) => a > b ? a : b) *
                                      1.2
                                  : 1000, // 最大值设置为收入最大值的 1.2 倍，或者设置固定值
                            ),
                            series: <CartesianSeries>[
                              // 收入柱状图 - 使用渐变颜色
                              if (_showIncome)
                                ColumnSeries<DailyData, DateTime>(
                                  name: '收入',
                                  dataSource: state.monthDailyData,
                                  xValueMapper: (DailyData data, _) =>
                                      data.date,
                                  yValueMapper: (DailyData data, _) {
                                    // 如果收入数据为0或无效，设置为一个更合适的最小高度
                                    return data.income > 0
                                        ? data.income + logic.p / 50
                                        : logic.p / 50; // 默认值改为 5 或其他合适的值
                                  },
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.green.withOpacity(0.2),
                                      Colors.green.withOpacity(0.8),
                                    ],
                                    stops: const [0.0, 1.0],
                                  ),
                                  pointColorMapper: (d, index) {
                                    double opacity = (d.income / 200).clamp(0.2,
                                        logic.selectIndex == index ? 1 : 0.4);
                                    return Color.lerp(
                                        // Colors.green.withValues(alpha: 0.2),
                                        // Colors.green.withValues(alpha: opacity),
                                        Colors.green.withOpacity(0.2),
                                        Colors.green.withOpacity(opacity),
                                        opacity);
                                  },
                                  width: type() == '1' ? 0.4 : 0.2,
                                  spacing: 0.6,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  animationDuration: 1000,
                                  dataLabelSettings: const DataLabelSettings(
                                    isVisible: false,
                                    labelAlignment: ChartDataLabelAlignment.top,
                                    textStyle: TextStyle(fontSize: 10),
                                  ),
                                  onPointTap: (ChartPointDetails details) {
                                    DailyData clickedDataPoint =
                                        state.monthDailyData[
                                            details.pointIndex ?? 0];
                                    logic.selectIndex = details.pointIndex ?? 0;
                                    if (logic.selectName.value == '月度分析') {
                                      state.monthStr = DateFormat('yyyy年MM月')
                                          .format(clickedDataPoint.date);
                                    } else {
                                      state.yearStr = DateFormat('yyyy年')
                                          .format(clickedDataPoint.date);
                                    }
                                    logic.update(['updateTag']);
                                    logic.getData(
                                        time: DateFormat(
                                                logic.selectName.value == '月度分析'
                                                    ? 'yyyy-MM'
                                                    : 'yyyy')
                                            .format(clickedDataPoint.date),
                                        type: logic.selectName.value == '月度分析'
                                            ? '0'
                                            : '1');
                                    print(
                                        "点击的日期: ${clickedDataPoint.date}, 收入: ${clickedDataPoint.income}, 支出: ${clickedDataPoint.expense}");
                                  },
                                ),

                              // 支出柱状图 - 使用渐变颜色
                              if (_showExpense)
                                ColumnSeries<DailyData, DateTime>(
                                  name: '支出',
                                  dataSource: state.monthDailyData,
                                  xValueMapper: (DailyData data, _) =>
                                      data.date,
                                  yValueMapper: (DailyData data, _) {
                                    // 如果支出数据为0或无效，设置为一个更合适的最小高度
                                    return data.expense > 0
                                        ? data.expense + logic.p / 50
                                        : logic.p / 50; // 默认值改为 5 或其他合适的值
                                  },
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      BColors.mainColor.withOpacity(0.2),
                                      BColors.mainColor.withOpacity(0.8),
                                    ],
                                    stops: const [0.0, 1.0],
                                  ),
                                  pointColorMapper: (d, index) {
                                    double opacity = (d.income / 200).clamp(0.2,
                                        logic.selectIndex == index ? 1 : 0.4);
                                    return Color.lerp(
                                        // Colors.green.withValues(alpha: 0.2),
                                        // Colors.green.withValues(alpha: opacity),
                                        Colors.green.withOpacity(0.2),
                                        Colors.green.withOpacity(opacity),
                                        opacity);
                                  },
                                  width: type() == '1' ? 0.4 : 0.2,
                                  spacing: 0.6,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  animationDuration: 1000,
                                  dataLabelSettings: const DataLabelSettings(
                                    isVisible: false,
                                    labelAlignment: ChartDataLabelAlignment.top,
                                    textStyle: TextStyle(fontSize: 10),
                                  ),
                                  emptyPointSettings: const EmptyPointSettings(
                                    mode: EmptyPointMode
                                        .average, // 设置为间隙模式，空点显示为平均值
                                  ),
                                  onPointTap: (ChartPointDetails details) {
                                    DailyData clickedDataPoint =
                                        state.monthDailyData[
                                            details.pointIndex ?? 0];
                                    logic.selectIndex = details.pointIndex ?? 0;
                                    if (logic.selectName.value == '月度分析') {
                                      state.monthStr = DateFormat('yyyy年MM月')
                                          .format(clickedDataPoint.date);
                                    } else {
                                      state.yearStr = DateFormat('yyyy年')
                                          .format(clickedDataPoint.date);
                                    }
                                    logic.update(['updateTag']);
                                    logic.getData(
                                        time: DateFormat(
                                                logic.selectName.value == '月度分析'
                                                    ? 'yyyy-MM'
                                                    : 'yyyy')
                                            .format(clickedDataPoint.date),
                                        type: logic.selectName.value == '月度分析'
                                            ? '0'
                                            : '1');
                                    print(
                                        "点击的日期: ${clickedDataPoint.date}, 收入: ${clickedDataPoint.income}, 支出: ${clickedDataPoint.expense}");
                                  },
                                ),
                            ],
                            selectionGesture: ActivationMode.singleTap,
                          )),
                    );
                  },
                  id: 'updateMonth',
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ).withContainer(
            margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 10.w),
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.w)),
            )),
        RankWidget(),
        Container(
          margin: EdgeInsets.only(top: 20.w, bottom: 40.w),
          child: BaseText(
            text: '查看不计入收支的明细',
            color: Colors.blueAccent,
          ),
        ).withOnTap(onTap: () {
          Get.to(() => FixedNavPage(), arguments: {
            'image': 'lbmx',
            'title': '类别明细',
            'right': true
          });
        })
      ],
    );
  }
}
