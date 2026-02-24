import 'package:intl/intl.dart';

class DateRangeUtils {
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  // 获取今日日期
  static String getToday() {
    return _dateFormat.format(DateTime.now());
  }

  // 获取本周第一天
  static String getThisWeekStart() {
    final now = DateTime.now();
    final weekday = now.weekday;
    final start = now.subtract(Duration(days: weekday - 1));
    return _dateFormat.format(start);
  }

  // 获取本月第一天
  static String getThisMonthStart() {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, 1);
    return _dateFormat.format(start);
  }

  // 获取本季度第一天
  static String getThisQuarterStart() {
    final now = DateTime.now();
    final quarterMonth = (now.month - 1) ~/ 3 * 3 + 1;
    final start = DateTime(now.year, quarterMonth, 1);
    return _dateFormat.format(start);
  }

  // 获取本年第一天
  static String getThisYearStart() {
    final now = DateTime.now();
    final start = DateTime(now.year, 1, 1);
    return _dateFormat.format(start);
  }

  // 获取特定时间范围的起始日期
  static Map<String, String> getDateRange(String rangeType) {
    final now = DateTime.now();
    DateTime startDate;

    switch (rangeType) {
      case '本日':
        startDate = DateTime(now.year, now.month, now.day);
        break;
      case '近1周':
        startDate = now.subtract(const Duration(days: 6)); // 包含今天共7天
        break;
      case '近1月':
        startDate = DateTime(now.year, now.month - 1, now.day);
        break;
      case '近3月':
        startDate = DateTime(now.year, now.month - 3, now.day);
        break;
      case '近6月':
        startDate = DateTime(now.year, now.month - 6, now.day);
        break;
      case '本周':
        final weekday = now.weekday;
        startDate = now.subtract(Duration(days: weekday - 1));
        break;
      case '本月':
        startDate = DateTime(now.year, now.month, 1);
        break;
      case '本季度':
        final quarterMonth = (now.month - 1) ~/ 3 * 3 + 1;
        startDate = DateTime(now.year, quarterMonth, 1);
        break;
      case '本年':
        startDate = DateTime(now.year, 1, 1);
        break;
      default:
        startDate = now;
    }

    return {
      'startDate': _dateFormat.format(startDate),
      'endDate': _dateFormat.format(now),
    };
  }

  // 批量获取所有时间范围
  static Map<String, Map<String, String>> getAllDateRanges() {
    return {
      '本日': getDateRange('本日'),
      '近1周': getDateRange('近1周'),
      '近1月': getDateRange('近1月'),
      '近3月': getDateRange('近3月'),
      '近6月': getDateRange('近6月'),
      '本周': getDateRange('本周'),
      '本月': getDateRange('本月'),
      '本季度': getDateRange('本季度'),
      '本年': getDateRange('本年'),
    };
  }

  // 获取时间范围列表（用于下拉选择）
  static List<Map<String, dynamic>> getDateRangeOptions() {
    final ranges = getAllDateRanges();
    return [
      {
        'label': '本日',
        'value': '本日',
        'startDate': ranges['本日']!['startDate'],
        'endDate': ranges['本日']!['endDate'],
      },
      {
        'label': '近1周',
        'value': '近1周',
        'startDate': ranges['近1周']!['startDate'],
        'endDate': ranges['近1周']!['endDate'],
      },
      {
        'label': '近1月',
        'value': '近1月',
        'startDate': ranges['近1月']!['startDate'],
        'endDate': ranges['近1月']!['endDate'],
      },
      {
        'label': '近3月',
        'value': '近3月',
        'startDate': ranges['近3月']!['startDate'],
        'endDate': ranges['近3月']!['endDate'],
      },
      {
        'label': '近6月',
        'value': '近6月',
        'startDate': ranges['近6月']!['startDate'],
        'endDate': ranges['近6月']!['endDate'],
      },
    ];
  }
}