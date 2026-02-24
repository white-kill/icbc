import 'package:cbc/generated/json/base/json_convert_content.dart';
import 'package:cbc/config/model/analysis_chat_model.dart';

AnalysisChatModel $AnalysisChatModelFromJson(Map<String, dynamic> json) {
  final AnalysisChatModel analysisChatModel = AnalysisChatModel();
  final double? income = jsonConvert.convert<double>(json['income']);
  if (income != null) {
    analysisChatModel.income = income;
  }
  final double? expenses = jsonConvert.convert<double>(json['expenses']);
  if (expenses != null) {
    analysisChatModel.expenses = expenses;
  }
  final double? cashSurplus = jsonConvert.convert<double>(json['cashSurplus']);
  if (cashSurplus != null) {
    analysisChatModel.cashSurplus = cashSurplus;
  }
  final List<AnalysisChatTrendList>? trendList = (json['trendList'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<AnalysisChatTrendList>(e) as AnalysisChatTrendList)
      .toList();
  if (trendList != null) {
    analysisChatModel.trendList = trendList;
  }
  final List<
      AnalysisChatIncomeCateogryList>? incomeCateogryList = (json['incomeCateogryList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<AnalysisChatIncomeCateogryList>(
          e) as AnalysisChatIncomeCateogryList).toList();
  if (incomeCateogryList != null) {
    analysisChatModel.incomeCateogryList = incomeCateogryList;
  }
  final List<
      AnalysisChatExpensesCateogryList>? expensesCateogryList = (json['expensesCateogryList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<AnalysisChatExpensesCateogryList>(
          e) as AnalysisChatExpensesCateogryList).toList();
  if (expensesCateogryList != null) {
    analysisChatModel.expensesCateogryList = expensesCateogryList;
  }
  return analysisChatModel;
}

Map<String, dynamic> $AnalysisChatModelToJson(AnalysisChatModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['income'] = entity.income;
  data['expenses'] = entity.expenses;
  data['cashSurplus'] = entity.cashSurplus;
  data['trendList'] = entity.trendList.map((v) => v.toJson()).toList();
  data['incomeCateogryList'] =
      entity.incomeCateogryList.map((v) => v.toJson()).toList();
  data['expensesCateogryList'] =
      entity.expensesCateogryList.map((v) => v.toJson()).toList();
  return data;
}

extension AnalysisChatModelExtension on AnalysisChatModel {
  AnalysisChatModel copyWith({
    double? income,
    double? expenses,
    double? cashSurplus,
    List<AnalysisChatTrendList>? trendList,
    List<AnalysisChatIncomeCateogryList>? incomeCateogryList,
    List<AnalysisChatExpensesCateogryList>? expensesCateogryList,
  }) {
    return AnalysisChatModel()
      ..income = income ?? this.income
      ..expenses = expenses ?? this.expenses
      ..cashSurplus = cashSurplus ?? this.cashSurplus
      ..trendList = trendList ?? this.trendList
      ..incomeCateogryList = incomeCateogryList ?? this.incomeCateogryList
      ..expensesCateogryList = expensesCateogryList ??
          this.expensesCateogryList;
  }
}

AnalysisChatTrendList $AnalysisChatTrendListFromJson(
    Map<String, dynamic> json) {
  final AnalysisChatTrendList analysisChatTrendList = AnalysisChatTrendList();
  final double? income = jsonConvert.convert<double>(json['income']);
  if (income != null) {
    analysisChatTrendList.income = income;
  }
  final double? expenses = jsonConvert.convert<double>(json['expenses']);
  if (expenses != null) {
    analysisChatTrendList.expenses = expenses;
  }
  final String? dateTime = jsonConvert.convert<String>(json['dateTime']);
  if (dateTime != null) {
    analysisChatTrendList.dateTime = dateTime;
  }
  return analysisChatTrendList;
}

Map<String, dynamic> $AnalysisChatTrendListToJson(
    AnalysisChatTrendList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['income'] = entity.income;
  data['expenses'] = entity.expenses;
  data['dateTime'] = entity.dateTime;
  return data;
}

extension AnalysisChatTrendListExtension on AnalysisChatTrendList {
  AnalysisChatTrendList copyWith({
    double? income,
    double? expenses,
    String? dateTime,
  }) {
    return AnalysisChatTrendList()
      ..income = income ?? this.income
      ..expenses = expenses ?? this.expenses
      ..dateTime = dateTime ?? this.dateTime;
  }
}

AnalysisChatIncomeCateogryList $AnalysisChatIncomeCateogryListFromJson(
    Map<String, dynamic> json) {
  final AnalysisChatIncomeCateogryList analysisChatIncomeCateogryList = AnalysisChatIncomeCateogryList();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    analysisChatIncomeCateogryList.name = name;
  }
  final String? rate = jsonConvert.convert<String>(json['rate']);
  if (rate != null) {
    analysisChatIncomeCateogryList.rate = rate;
  }
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    analysisChatIncomeCateogryList.count = count;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    analysisChatIncomeCateogryList.icon = icon;
  }
  final String? categoryIcon = jsonConvert.convert<String>(
      json['categoryIcon']);
  if (categoryIcon != null) {
    analysisChatIncomeCateogryList.categoryIcon = categoryIcon;
  }
  final double? totalAmount = jsonConvert.convert<double>(json['totalAmount']);
  if (totalAmount != null) {
    analysisChatIncomeCateogryList.totalAmount = totalAmount;
  }
  return analysisChatIncomeCateogryList;
}

Map<String, dynamic> $AnalysisChatIncomeCateogryListToJson(
    AnalysisChatIncomeCateogryList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['rate'] = entity.rate;
  data['count'] = entity.count;
  data['icon'] = entity.icon;
  data['categoryIcon'] = entity.categoryIcon;
  data['totalAmount'] = entity.totalAmount;
  return data;
}

extension AnalysisChatIncomeCateogryListExtension on AnalysisChatIncomeCateogryList {
  AnalysisChatIncomeCateogryList copyWith({
    String? name,
    String? rate,
    int? count,
    String? icon,
    String? categoryIcon,
    double? totalAmount,
  }) {
    return AnalysisChatIncomeCateogryList()
      ..name = name ?? this.name
      ..rate = rate ?? this.rate
      ..count = count ?? this.count
      ..icon = icon ?? this.icon
      ..categoryIcon = categoryIcon ?? this.categoryIcon
      ..totalAmount = totalAmount ?? this.totalAmount;
  }
}

AnalysisChatExpensesCateogryList $AnalysisChatExpensesCateogryListFromJson(
    Map<String, dynamic> json) {
  final AnalysisChatExpensesCateogryList analysisChatExpensesCateogryList = AnalysisChatExpensesCateogryList();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    analysisChatExpensesCateogryList.name = name;
  }
  final String? rate = jsonConvert.convert<String>(json['rate']);
  if (rate != null) {
    analysisChatExpensesCateogryList.rate = rate;
  }
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    analysisChatExpensesCateogryList.count = count;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    analysisChatExpensesCateogryList.icon = icon;
  }
  final String? categoryIcon = jsonConvert.convert<String>(
      json['categoryIcon']);
  if (categoryIcon != null) {
    analysisChatExpensesCateogryList.categoryIcon = categoryIcon;
  }
  final double? totalAmount = jsonConvert.convert<double>(json['totalAmount']);
  if (totalAmount != null) {
    analysisChatExpensesCateogryList.totalAmount = totalAmount;
  }
  return analysisChatExpensesCateogryList;
}

Map<String, dynamic> $AnalysisChatExpensesCateogryListToJson(
    AnalysisChatExpensesCateogryList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['rate'] = entity.rate;
  data['count'] = entity.count;
  data['icon'] = entity.icon;
  data['categoryIcon'] = entity.categoryIcon;
  data['totalAmount'] = entity.totalAmount;
  return data;
}

extension AnalysisChatExpensesCateogryListExtension on AnalysisChatExpensesCateogryList {
  AnalysisChatExpensesCateogryList copyWith({
    String? name,
    String? rate,
    int? count,
    String? icon,
    String? categoryIcon,
    double? totalAmount,
  }) {
    return AnalysisChatExpensesCateogryList()
      ..name = name ?? this.name
      ..rate = rate ?? this.rate
      ..count = count ?? this.count
      ..icon = icon ?? this.icon
      ..categoryIcon = categoryIcon ?? this.categoryIcon
      ..totalAmount = totalAmount ?? this.totalAmount;
  }
}