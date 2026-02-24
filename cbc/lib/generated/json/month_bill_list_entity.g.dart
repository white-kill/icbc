import 'package:cbc/generated/json/base/json_convert_content.dart';
import 'package:cbc/config/model/month_bill_list_entity.dart';

MonthBillListEntity $MonthBillListEntityFromJson(Map<String, dynamic> json) {
  final MonthBillListEntity monthBillListEntity = MonthBillListEntity();
  final int? month = jsonConvert.convert<int>(json['month']);
  if (month != null) {
    monthBillListEntity.month = month;
  }
  final int? year = jsonConvert.convert<int>(json['year']);
  if (year != null) {
    monthBillListEntity.year = year;
  }
  final String? dateTime = jsonConvert.convert<String>(json['dateTime']);
  if (dateTime != null) {
    monthBillListEntity.dateTime = dateTime;
  }
  final double? income = jsonConvert.convert<double>(json['income']);
  if (income != null) {
    monthBillListEntity.income = income;
  }
  final double? expenses = jsonConvert.convert<double>(json['expenses']);
  if (expenses != null) {
    monthBillListEntity.expenses = expenses;
  }
  return monthBillListEntity;
}

Map<String, dynamic> $MonthBillListEntityToJson(MonthBillListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['month'] = entity.month;
  data['year'] = entity.year;
  data['dateTime'] = entity.dateTime;
  data['income'] = entity.income;
  data['expenses'] = entity.expenses;
  return data;
}

extension MonthBillListEntityExtension on MonthBillListEntity {
  MonthBillListEntity copyWith({
    int? month,
    int? year,
    String? dateTime,
    double? income,
    double? expenses,
  }) {
    return MonthBillListEntity()
      ..month = month ?? this.month
      ..year = year ?? this.year
      ..dateTime = dateTime ?? this.dateTime
      ..income = income ?? this.income
      ..expenses = expenses ?? this.expenses;
  }
}