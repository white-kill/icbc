import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class CalendarDialog extends StatefulWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;

  const CalendarDialog({
    super.key,
    this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<CalendarDialog> createState() => _CalendarDialogState();
}

class _CalendarDialogState extends State<CalendarDialog> {
  DateTime? _currentSelectedDate;
  DateTime _currentMonth = DateTime.now();
  @override
  void initState() {
    super.initState();
    _currentSelectedDate = widget.selectedDate??DateTime.now();
  }

  bool _isDateInCurrentMonth(DateTime date) {
    return date.month == _currentMonth.month && date.year == _currentMonth.year;
  }

  bool _isFutureDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return date.isAfter(today);
  }
  DateTime? _lastSelectedDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(left: 12.w,right: 12.w,top: 6.w,bottom: 0),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 270.w,
            child: Calendar(
              startOnMonday: true,
              weekDays: const ['一', '二', '三', '四', '五', '六', '日'],
              isExpandable: false,
              dayOfWeekStyle: const TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
              locale: 'zh_CN',
              hideArrows: false,
              hideTodayIcon: true,
              topRowIconColor: Color(0xff666666),
              showEventListViewIcon: false,
              isExpanded: true,
              expandableDateFormat: '',
              displayMonthTextStyle: const TextStyle(
                color: Color(0xff999999),
                fontSize: 14,
              ),
              onDateSelected: (date) {
                // 检查是否是月份切换导致的误触发
                final now = DateTime.now();
                final today = DateTime(now.year, now.month, now.day);

                // 如果选择的日期与当前显示月份不一致，可能是月份切换的误触发
                final isCurrentMonth = date.month == _currentMonth.month &&
                    date.year == _currentMonth.year;

                // 如果是未来日期或者非当前月份，且不是用户明确的选择，则忽略
                if ((date.isAfter(today) || !isCurrentMonth) &&
                    _lastSelectedDate != date) {
                  // 可能是月份切换的误触发，忽略此次回调
                  _lastSelectedDate = null;
                  return;
                }

                // 记录最后一次有效选择
                _lastSelectedDate = date;

                if (date.isAfter(today)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('不能选择未来的日期'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                  return;
                }

                setState(() {
                  _currentSelectedDate = date;
                });
                widget.onDateSelected.call(date);
                Navigator.of(context).pop();

              },
              onMonthChanged: (data) {
                _currentMonth = data;
                setState(() {});
              },
              dayBuilder: (BuildContext context, DateTime day) {
                final isCurrentMonth = _isDateInCurrentMonth(day);
                final isFutureDate = _isFutureDate(day);
                final isSelected = _currentSelectedDate != null &&
                    _currentSelectedDate!.year == day.year &&
                    _currentSelectedDate!.month == day.month &&
                    _currentSelectedDate!.day == day.day;

                final now = DateTime.now();
                final isToday = day.year == now.year &&
                    day.month == now.month &&
                    day.day == now.day;

                final backgroundColor = !isCurrentMonth
                    ? Colors.transparent // 非当前月份使用自定义背景色
                    : isFutureDate
                    ? Colors.transparent
                    : isSelected
                    ? Colors.blue
                    : Colors.transparent;

                final textColor = !isCurrentMonth
                    ? Colors.grey // 非当前月份使用自定义文字颜色
                    : isFutureDate
                    ? Colors.grey
                    : isSelected
                    ? Colors.white
                    : const Color(0xff333333);

                return Container(
                  margin: const EdgeInsets.only(left: 6, right: 6),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                    child: Text(
                      day.day.toString(),
                      style: TextStyle(
                        color: textColor,
                        fontWeight: isToday && isCurrentMonth
                            ? FontWeight.normal
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            height: 32.w,
            width: 1.sw,
            alignment: Alignment.topCenter,
            child: const BaseText(text: '今日'),
          ).withOnTap(onTap: (){
            widget.onDateSelected.call(DateTime.now());
            Navigator.of(context).pop();
          })
        ],
      ),
    );
  }
}