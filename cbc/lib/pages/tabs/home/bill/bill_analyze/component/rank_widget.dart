import 'package:cbc/pages/tabs/home/bill/bill_analyze/an_info/an_info_view.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:cbc/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../bill_analyze_logic.dart';
import '../bill_analyze_state.dart';

class RankWidget extends StatefulWidget {
  const RankWidget({super.key});

  @override
  State<RankWidget> createState() => _RankWidgetState();
}

class _RankWidgetState extends State<RankWidget> {

  bool isOne = true;

  final BillAnalyzeLogic logic = Get.put(BillAnalyzeLogic());
  final BillAnalyzeState state = Get.find<BillAnalyzeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (BillAnalyzeLogic c){
      return Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 12.w,bottom: 12.w),
            child:  BaseText(text: '分类排行榜',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Container(
                width: 50.w,
                padding: EdgeInsets.all(4.w),
                alignment: Alignment.center,
                child: BaseText(text: '收入',color:isOne? BColors.mainColor:Color(0xff999999),),
                decoration: BoxDecoration(
                    color:isOne? BColors.mainColor.withOpacity(0.1):Color(0xff999999).withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(20.w))
                ),
              ).withOnTap(onTap: (){
                isOne = true;
                setState(() {});
              }),

              Container(
                width: 50.w,
                padding: EdgeInsets.all(4.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:!isOne? BColors.mainColor.withOpacity(0.1):Color(0xff999999).withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(20.w))
                ),
                child: BaseText(text: '支出',color: !isOne? BColors.mainColor:Color(0xff999999),),
              ).withOnTap(onTap: (){
                isOne = false;
                setState(() {});
              })
            ],
          ),
          Row(
            children: [
              Container(
                  width: 200.w,
                  height: 200.w,
                  child: SfCircularChart(
                      margin: EdgeInsets.zero,
                      series: <CircularSeries>[
                        DoughnutSeries<SalesData, String>(
                          dataSource:isOne? state.data1:state.data2,
                          xValueMapper: (SalesData data, _) =>
                          data.title,
                          yValueMapper: (SalesData data, _) =>
                          data.sales,
                          pointColorMapper: (SalesData data, _) =>
                          data.color,
                          animationDuration: 500,
                          radius: '60%',
                          innerRadius: '65%',
                        )
                      ])),
              Column(
                children: (isOne? state.data1:state.data2).map((e){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseText(text: e.title,style: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0xff666666)
                      ),),
                      BaseText(text: '${e.rate}%',style: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0xff666666)
                      ),),
                    ],
                  ).withPadding(
                      bottom: 6.w,
                    right: 12.w
                  );
                }).toList(),
              ).expanded()
            ],
          ),

          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              SalesData s = (isOne? state.data1:state.data2)[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Image(
                      //   image: 'ic_zztr'.png3x,
                      //   width: 20.w,
                      //   height: 20.w,
                      // ).withPadding(right: 6.w),

                      netImage(
                        url: s.icon,
                        width: 20.w,
                        height: 20.w,
                      ).withPadding(right: 6.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(text: s.title),
                          SizedBox(
                            height: 8.w,
                          ),

                          Row(
                            children: [

                              BaseText(text: '${s.rate}%',style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Color(0xff999999)
                              ),),
                              SizedBox(width: 2.w,),
                              Stack(
                                children: [
                                  Container(
                                    width: 130.w,
                                    height: 3.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xffdedede),
                                        borderRadius: BorderRadius.all(Radius.circular(2.w))
                                    ),
                                  ),
                                  Container(
                                    width: (130 * (double.parse(s.rate)/100)).w,
                                    height: 3.w,
                                    decoration: BoxDecoration(
                                        color:isOne?BColors.mainColor:BColors.main1Color,
                                        borderRadius: BorderRadius.all(Radius.circular(2.w))
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                          // BaseText(text: 'rankModel.transactionTime'),

                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          BaseText(
                            text: '¥${s.sales.bankBalance}',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Image(
                        image: 'ic_jt_right'.png3x,
                        width: 20.w,
                        height: 20.w,
                      )
                    ],
                  )
                ],
              ).withContainer(
                  height: 55.w,
                  margin: EdgeInsets.only(bottom: 10.w),
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  onTap: (){
                Get.to(() => AnInfoPage(),arguments: {
                  'model':s,
                  'time':logic.timeStr,
                  'timeStr': logic.selectName.value == '月度分析'?logic.state.monthStr:logic.state.yearStr
                });
              });
            },
            itemCount: (isOne? state.data1:state.data2).length,
          ),
        ],
      ).withContainer(
          margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 10.w),
          padding: EdgeInsets.only(left: 10.w,),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.w)),
          ));
    },id: 'updateRank',);
  }
}
