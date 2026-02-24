import 'package:cbc/pages/other/sheet_widget/picker.dart';
import 'package:cbc/pages/tabs/home/account/account_detail/more_query/date_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/component/picker_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../utils/abc_button.dart';
import '../../../../../../utils/color_util.dart';
import '../../../../../../utils/time_tool.dart';
import '../../../../../other/sheet_widget/picker_widget.dart';
import '../account_detail_view.dart';
import 'more_query_logic.dart';
import 'more_query_state.dart';

class MoreWidget extends StatefulWidget {
  const MoreWidget({super.key});

  @override
  State<MoreWidget> createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  final More_queryLogic logic = Get.put(More_queryLogic());
  final More_queryState state = Get.find<More_queryLogic>().state;

  String selectName = '';

  String beginTime = '';
  String endTime = '';
  String type = '';

  // 用来统计弹窗从2008到现在的年数
  int lastYear = 1;

  @override
  void initState() {
    super.initState();
    // 计算当前年份到2008年相隔多少年

    int currentYear = DateTime.now().year;
    lastYear = currentYear - 2008;
    type = '全部';
    settingTime('近1月');
  }

  void settingTime(String tag){
    Map<String, String> dateMap = DateRangeUtils.getDateRange(tag);
    beginTime = dateMap['startDate'] ?? '';
    endTime = dateMap['endDate'] ?? '';
    state.moreData.beginTime = beginTime;
    state.moreData.endTime = endTime;
    setState(() {});
  }

  String valueStr(String name) {
    if (name == '收支类别') return type;
    if (name == '起始时间') return beginTime;
    if (name == '截止时间') return endTime;
    return '';
  }

  DateTimePickerNotifier dateTimePickerNotifier1 = DateTimePickerNotifier();
  DateTimePickerNotifier dateTimePickerNotifier2 = DateTimePickerNotifier();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(top: 6.w),
        itemBuilder: (context, index) {
          String title = state.titleNames[index];
          if (title == 'tag') {
            return Container(
                height: 45.w,
                color: Colors.white,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.tagNames.map((e) {
                    return Container(
                      padding: EdgeInsets.only(
                          top: 5.w, bottom: 3.w, left: 4.w, right: 4.w),
                      alignment: Alignment.center,
                      height: 24.w,
                      margin: EdgeInsets.only(right: 5.w, left: 5.w),
                      decoration: BoxDecoration(
                        color: selectName == e
                            ? BColors.mainColor.withOpacity(0.05)
                            : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(4.w)),
                        border: Border.all(
                            color: selectName == e
                                ? BColors.mainColor
                                : const Color(0xffCCCCCC),
                            width: 1.w),
                      ),
                      child: BaseText(
                        textAlign: TextAlign.center,
                        text: e,
                        style: TextStyle(
                          fontSize: 12.w,
                          height: 1,
                          color: selectName == e
                              ? BColors.mainColor
                              : const Color(0xff000000),
                        ),
                      ),
                    ).withOnTap(onTap: () {
                      selectName = e;
                      settingTime(e);
                    });
                  }).toList(),
                ));
          }
          if (title == 'bottom'){
           return AbcButton(
              title: '确定',
              height: 48.w,
              radius: 6.w,
              onTap: () {
                DateTime firstDay = DateFormat("yyyy-MM-dd").parse(beginTime);
                DateTime lastDay = DateFormat("yyyy-MM-dd").parse(endTime);
                bool errorTime = TimeRangeValidator.checkTimeRange(startTime: firstDay, endTime: lastDay);
                if(errorTime == false){
                  '起始时间大于结束时间，请重新输入'.showBottomToast;
                  return;
                }
                Get.to(() => AccountDetailPage(),arguments: {
                  'reqData':state.moreData,
                });
              },
              margin: EdgeInsets.only(left: 12.w, right: 12.w,top: 20.w),
            );
          }

          return _itemWidget(title, valueStr(title)).withOnTap(onTap: () {
            if (title == '收支类别') {
              AlterPickerTime.showDataPick(
                context,
                title: '选择收支类别',
                dataList: ['全部', '收入', '支出'],
                onConfirm: (List v) {
                  type = v.first;
                  if(type == '全部') state.moreData.type = '';
                  if(type == '收入') state.moreData.type = '1';
                  if(type == '支出') state.moreData.type = '2';
                  setState(() {});
                },
              );
            }
            if (title == '起始时间') {
              AbcPicker.showNewTime(
                title: '选择日期',
                dateTimePickerNotifier: dateTimePickerNotifier1,
                initialDateTime: DateTime.parse(beginTime),
                lastYear: lastYear,
                onDateTimeChanged: (DateTime date) {
                  DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
                  beginTime =  _dateFormat.format(date);
                  state.moreData.beginTime = beginTime;
                  selectName = '';
                  setState(() {});
                },
              );
            }
            if (title == '截止时间') {
              AbcPicker.showNewTime(
                title: '选择日期',
                dateTimePickerNotifier: dateTimePickerNotifier2,
                initialDateTime: DateTime.parse(endTime),
                lastYear: lastYear,
                onDateTimeChanged: (DateTime date) {
                  DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
                  endTime =  _dateFormat.format(date);
                  state.moreData.endTime = endTime;
                  selectName = '';
                  setState(() {});
                },
              );
            }
          });
        },
        separatorBuilder: (context, index) {
          return Container(
            width: 1.sw,
            height: state.titleNames[index] == '收支类别' ? 20.w : 0.8.w,
            color: const Color(0xFFF5F5F5),
          );
        },
        itemCount: state.titleNames.length);
  }

  Widget _itemWidget(String name, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BaseText(
              text: name,
              style: TextStyle(
                fontFamily: 'PingFangSC'
              )
            ).withContainer(width: 110.w),
            BaseText(
              text: value,
              color: Colors.blueAccent,
              fontFamily: "cbc-num",
            ),
          ],
        ),
        Image(
          image: 'ic_jt_right'.png3x,
          width: 25.w,
          height: 25.w,
        )
      ],
    ).withContainer(
        padding: EdgeInsets.only(left: 18.w, right: 12.w),
        color: Colors.white,
        height: 45.w,
        alignment: Alignment.center);
  }
}
