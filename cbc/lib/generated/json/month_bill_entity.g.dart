import 'package:cbc/generated/json/base/json_convert_content.dart';
import 'package:cbc/config/model/month_bill_entity.dart';

MonthBillData $MonthBillDataFromJson(Map<String, dynamic> json) {
  final MonthBillData monthBillData = MonthBillData();
  final MonthBillCustom? custom = jsonConvert.convert<MonthBillCustom>(
      json['custom']);
  if (custom != null) {
    monthBillData.custom = custom;
  }
  final MonthBillExpenses? expenses = jsonConvert.convert<MonthBillExpenses>(
      json['expenses']);
  if (expenses != null) {
    monthBillData.expenses = expenses;
  }
  final MonthBillIncome? income = jsonConvert.convert<MonthBillIncome>(
      json['income']);
  if (income != null) {
    monthBillData.income = income;
  }
  final MonthBillCapital? capital = jsonConvert.convert<MonthBillCapital>(
      json['capital']);
  if (capital != null) {
    monthBillData.capital = capital;
  }
  return monthBillData;
}

Map<String, dynamic> $MonthBillDataToJson(MonthBillData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['custom'] = entity.custom?.toJson();
  data['expenses'] = entity.expenses?.toJson();
  data['income'] = entity.income?.toJson();
  data['capital'] = entity.capital?.toJson();
  return data;
}

extension MonthBillDataExtension on MonthBillData {
  MonthBillData copyWith({
    MonthBillCustom? custom,
    MonthBillExpenses? expenses,
    MonthBillIncome? income,
    MonthBillCapital? capital,
  }) {
    return MonthBillData()
      ..custom = custom ?? this.custom
      ..expenses = expenses ?? this.expenses
      ..income = income ?? this.income
      ..capital = capital ?? this.capital;
  }
}

MonthBillCustom $MonthBillCustomFromJson(Map<String, dynamic> json) {
  final MonthBillCustom monthBillCustom = MonthBillCustom();
  final double? monthCashSurplus = jsonConvert.convert<double>(
      json['monthCashSurplus']);
  if (monthCashSurplus != null) {
    monthBillCustom.monthCashSurplus = monthCashSurplus;
  }
  final String? creditCardNum = jsonConvert.convert<String>(
      json['creditCardNum']);
  if (creditCardNum != null) {
    monthBillCustom.creditCardNum = creditCardNum;
  }
  final String? liability = jsonConvert.convert<String>(json['liability']);
  if (liability != null) {
    monthBillCustom.liability = liability;
  }
  final String? creditCardConsumeNum = jsonConvert.convert<String>(
      json['creditCardConsumeNum']);
  if (creditCardConsumeNum != null) {
    monthBillCustom.creditCardConsumeNum = creditCardConsumeNum;
  }
  final String? payday = jsonConvert.convert<String>(json['payday']);
  if (payday != null) {
    monthBillCustom.payday = payday;
  }
  final double? monthCashSurplusDiff = jsonConvert.convert<double>(
      json['monthCashSurplusDiff']);
  if (monthCashSurplusDiff != null) {
    monthBillCustom.monthCashSurplusDiff = monthCashSurplusDiff;
  }
  final String? creditRatio = jsonConvert.convert<String>(json['creditRatio']);
  if (creditRatio != null) {
    monthBillCustom.creditRatio = creditRatio;
  }
  final String? loginCount = jsonConvert.convert<String>(json['loginCount']);
  if (loginCount != null) {
    monthBillCustom.loginCount = loginCount;
  }
  return monthBillCustom;
}

Map<String, dynamic> $MonthBillCustomToJson(MonthBillCustom entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['monthCashSurplus'] = entity.monthCashSurplus;
  data['creditCardNum'] = entity.creditCardNum;
  data['liability'] = entity.liability;
  data['creditCardConsumeNum'] = entity.creditCardConsumeNum;
  data['payday'] = entity.payday;
  data['monthCashSurplusDiff'] = entity.monthCashSurplusDiff;
  data['creditRatio'] = entity.creditRatio;
  data['loginCount'] = entity.loginCount;
  return data;
}

extension MonthBillCustomExtension on MonthBillCustom {
  MonthBillCustom copyWith({
    double? monthCashSurplus,
    String? creditCardNum,
    String? liability,
    String? creditCardConsumeNum,
    String? payday,
    double? monthCashSurplusDiff,
    String? creditRatio,
    String? loginCount,
  }) {
    return MonthBillCustom()
      ..monthCashSurplus = monthCashSurplus ?? this.monthCashSurplus
      ..creditCardNum = creditCardNum ?? this.creditCardNum
      ..liability = liability ?? this.liability
      ..creditCardConsumeNum = creditCardConsumeNum ?? this.creditCardConsumeNum
      ..payday = payday ?? this.payday
      ..monthCashSurplusDiff = monthCashSurplusDiff ?? this.monthCashSurplusDiff
      ..creditRatio = creditRatio ?? this.creditRatio
      ..loginCount = loginCount ?? this.loginCount;
  }
}

MonthBillExpenses $MonthBillExpensesFromJson(Map<String, dynamic> json) {
  final MonthBillExpenses monthBillExpenses = MonthBillExpenses();
  final double? totalAmount = jsonConvert.convert<double>(json['totalAmount']);
  if (totalAmount != null) {
    monthBillExpenses.totalAmount = totalAmount;
  }
  final double? totalAmountDiff = jsonConvert.convert<double>(
      json['totalAmountDiff']);
  if (totalAmountDiff != null) {
    monthBillExpenses.totalAmountDiff = totalAmountDiff;
  }
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    monthBillExpenses.count = count;
  }
  final double? maxAmount = jsonConvert.convert<double>(json['maxAmount']);
  if (maxAmount != null) {
    monthBillExpenses.maxAmount = maxAmount;
  }
  final String? realName = jsonConvert.convert<String>(json['realName']);
  if (realName != null) {
    monthBillExpenses.realName = realName;
  }
  final List<
      MonthBillExpensesCategoryList>? categoryList = (json['categoryList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<MonthBillExpensesCategoryList>(
          e) as MonthBillExpensesCategoryList).toList();
  if (categoryList != null) {
    monthBillExpenses.categoryList = categoryList;
  }
  final List<
      MonthBillExpensesTrendList>? trendList = (json['trendList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<MonthBillExpensesTrendList>(
          e) as MonthBillExpensesTrendList).toList();
  if (trendList != null) {
    monthBillExpenses.trendList = trendList;
  }
  return monthBillExpenses;
}

Map<String, dynamic> $MonthBillExpensesToJson(MonthBillExpenses entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalAmount'] = entity.totalAmount;
  data['totalAmountDiff'] = entity.totalAmountDiff;
  data['count'] = entity.count;
  data['maxAmount'] = entity.maxAmount;
  data['realName'] = entity.realName;
  data['categoryList'] = entity.categoryList.map((v) => v.toJson()).toList();
  data['trendList'] = entity.trendList.map((v) => v.toJson()).toList();
  return data;
}

extension MonthBillExpensesExtension on MonthBillExpenses {
  MonthBillExpenses copyWith({
    double? totalAmount,
    double? totalAmountDiff,
    int? count,
    double? maxAmount,
    String? realName,
    List<MonthBillExpensesCategoryList>? categoryList,
    List<MonthBillExpensesTrendList>? trendList,
  }) {
    return MonthBillExpenses()
      ..totalAmount = totalAmount ?? this.totalAmount
      ..totalAmountDiff = totalAmountDiff ?? this.totalAmountDiff
      ..count = count ?? this.count
      ..maxAmount = maxAmount ?? this.maxAmount
      ..realName = realName ?? this.realName
      ..categoryList = categoryList ?? this.categoryList
      ..trendList = trendList ?? this.trendList;
  }
}

MonthBillExpensesCategoryList $MonthBillExpensesCategoryListFromJson(
    Map<String, dynamic> json) {
  final MonthBillExpensesCategoryList monthBillExpensesCategoryList = MonthBillExpensesCategoryList();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    monthBillExpensesCategoryList.name = name;
  }
  final double? rate = jsonConvert.convert<double>(json['rate']);
  if (rate != null) {
    monthBillExpensesCategoryList.rate = rate;
  }
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    monthBillExpensesCategoryList.count = count;
  }
  final double? totalAmount = jsonConvert.convert<double>(json['totalAmount']);
  if (totalAmount != null) {
    monthBillExpensesCategoryList.totalAmount = totalAmount;
  }
  return monthBillExpensesCategoryList;
}

Map<String, dynamic> $MonthBillExpensesCategoryListToJson(
    MonthBillExpensesCategoryList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['rate'] = entity.rate;
  data['count'] = entity.count;
  data['totalAmount'] = entity.totalAmount;
  return data;
}

extension MonthBillExpensesCategoryListExtension on MonthBillExpensesCategoryList {
  MonthBillExpensesCategoryList copyWith({
    String? name,
    double? rate,
    int? count,
    double? totalAmount,
  }) {
    return MonthBillExpensesCategoryList()
      ..name = name ?? this.name
      ..rate = rate ?? this.rate
      ..count = count ?? this.count
      ..totalAmount = totalAmount ?? this.totalAmount;
  }
}

MonthBillExpensesTrendList $MonthBillExpensesTrendListFromJson(
    Map<String, dynamic> json) {
  final MonthBillExpensesTrendList monthBillExpensesTrendList = MonthBillExpensesTrendList();
  final String? month = jsonConvert.convert<String>(json['month']);
  if (month != null) {
    monthBillExpensesTrendList.month = month;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    monthBillExpensesTrendList.amount = amount;
  }
  return monthBillExpensesTrendList;
}

Map<String, dynamic> $MonthBillExpensesTrendListToJson(
    MonthBillExpensesTrendList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['month'] = entity.month;
  data['amount'] = entity.amount;
  return data;
}

extension MonthBillExpensesTrendListExtension on MonthBillExpensesTrendList {
  MonthBillExpensesTrendList copyWith({
    String? month,
    double? amount,
  }) {
    return MonthBillExpensesTrendList()
      ..month = month ?? this.month
      ..amount = amount ?? this.amount;
  }
}

MonthBillIncome $MonthBillIncomeFromJson(Map<String, dynamic> json) {
  final MonthBillIncome monthBillIncome = MonthBillIncome();
  final double? totalAmount = jsonConvert.convert<double>(json['totalAmount']);
  if (totalAmount != null) {
    monthBillIncome.totalAmount = totalAmount;
  }
  final double? totalAmountDiff = jsonConvert.convert<double>(
      json['totalAmountDiff']);
  if (totalAmountDiff != null) {
    monthBillIncome.totalAmountDiff = totalAmountDiff;
  }
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    monthBillIncome.count = count;
  }
  final double? maxAmount = jsonConvert.convert<double>(json['maxAmount']);
  if (maxAmount != null) {
    monthBillIncome.maxAmount = maxAmount;
  }
  final String? realName = jsonConvert.convert<String>(json['realName']);
  if (realName != null) {
    monthBillIncome.realName = realName;
  }
  final List<
      MonthBillIncomeCategoryList>? categoryList = (json['categoryList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<MonthBillIncomeCategoryList>(
          e) as MonthBillIncomeCategoryList).toList();
  if (categoryList != null) {
    monthBillIncome.categoryList = categoryList;
  }
  final List<MonthBillIncomeTrendList>? trendList = (json['trendList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<MonthBillIncomeTrendList>(
          e) as MonthBillIncomeTrendList).toList();
  if (trendList != null) {
    monthBillIncome.trendList = trendList;
  }
  return monthBillIncome;
}

Map<String, dynamic> $MonthBillIncomeToJson(MonthBillIncome entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalAmount'] = entity.totalAmount;
  data['totalAmountDiff'] = entity.totalAmountDiff;
  data['count'] = entity.count;
  data['maxAmount'] = entity.maxAmount;
  data['realName'] = entity.realName;
  data['categoryList'] = entity.categoryList.map((v) => v.toJson()).toList();
  data['trendList'] = entity.trendList.map((v) => v.toJson()).toList();
  return data;
}

extension MonthBillIncomeExtension on MonthBillIncome {
  MonthBillIncome copyWith({
    double? totalAmount,
    double? totalAmountDiff,
    int? count,
    double? maxAmount,
    String? realName,
    List<MonthBillIncomeCategoryList>? categoryList,
    List<MonthBillIncomeTrendList>? trendList,
  }) {
    return MonthBillIncome()
      ..totalAmount = totalAmount ?? this.totalAmount
      ..totalAmountDiff = totalAmountDiff ?? this.totalAmountDiff
      ..count = count ?? this.count
      ..maxAmount = maxAmount ?? this.maxAmount
      ..realName = realName ?? this.realName
      ..categoryList = categoryList ?? this.categoryList
      ..trendList = trendList ?? this.trendList;
  }
}

MonthBillIncomeCategoryList $MonthBillIncomeCategoryListFromJson(
    Map<String, dynamic> json) {
  final MonthBillIncomeCategoryList monthBillIncomeCategoryList = MonthBillIncomeCategoryList();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    monthBillIncomeCategoryList.name = name;
  }
  final double? rate = jsonConvert.convert<double>(json['rate']);
  if (rate != null) {
    monthBillIncomeCategoryList.rate = rate;
  }
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    monthBillIncomeCategoryList.count = count;
  }
  final double? totalAmount = jsonConvert.convert<double>(json['totalAmount']);
  if (totalAmount != null) {
    monthBillIncomeCategoryList.totalAmount = totalAmount;
  }
  return monthBillIncomeCategoryList;
}

Map<String, dynamic> $MonthBillIncomeCategoryListToJson(
    MonthBillIncomeCategoryList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['rate'] = entity.rate;
  data['count'] = entity.count;
  data['totalAmount'] = entity.totalAmount;
  return data;
}

extension MonthBillIncomeCategoryListExtension on MonthBillIncomeCategoryList {
  MonthBillIncomeCategoryList copyWith({
    String? name,
    double? rate,
    int? count,
    double? totalAmount,
  }) {
    return MonthBillIncomeCategoryList()
      ..name = name ?? this.name
      ..rate = rate ?? this.rate
      ..count = count ?? this.count
      ..totalAmount = totalAmount ?? this.totalAmount;
  }
}

MonthBillIncomeTrendList $MonthBillIncomeTrendListFromJson(
    Map<String, dynamic> json) {
  final MonthBillIncomeTrendList monthBillIncomeTrendList = MonthBillIncomeTrendList();
  final String? month = jsonConvert.convert<String>(json['month']);
  if (month != null) {
    monthBillIncomeTrendList.month = month;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    monthBillIncomeTrendList.amount = amount;
  }
  return monthBillIncomeTrendList;
}

Map<String, dynamic> $MonthBillIncomeTrendListToJson(
    MonthBillIncomeTrendList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['month'] = entity.month;
  data['amount'] = entity.amount;
  return data;
}

extension MonthBillIncomeTrendListExtension on MonthBillIncomeTrendList {
  MonthBillIncomeTrendList copyWith({
    String? month,
    double? amount,
  }) {
    return MonthBillIncomeTrendList()
      ..month = month ?? this.month
      ..amount = amount ?? this.amount;
  }
}

MonthBillCapital $MonthBillCapitalFromJson(Map<String, dynamic> json) {
  final MonthBillCapital monthBillCapital = MonthBillCapital();
  final double? totalAmount = jsonConvert.convert<double>(json['totalAmount']);
  if (totalAmount != null) {
    monthBillCapital.totalAmount = totalAmount;
  }
  final double? totalAmountDiff = jsonConvert.convert<double>(
      json['totalAmountDiff']);
  if (totalAmountDiff != null) {
    monthBillCapital.totalAmountDiff = totalAmountDiff;
  }
  final List<
      MonthBillCapitalConfigList>? configList = (json['configList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<MonthBillCapitalConfigList>(
          e) as MonthBillCapitalConfigList).toList();
  if (configList != null) {
    monthBillCapital.configList = configList;
  }
  final List<MonthBillCapitalTrendList>? trendList = (json['trendList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<MonthBillCapitalTrendList>(
          e) as MonthBillCapitalTrendList).toList();
  if (trendList != null) {
    monthBillCapital.trendList = trendList;
  }
  return monthBillCapital;
}

Map<String, dynamic> $MonthBillCapitalToJson(MonthBillCapital entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['totalAmount'] = entity.totalAmount;
  data['totalAmountDiff'] = entity.totalAmountDiff;
  data['configList'] = entity.configList.map((v) => v.toJson()).toList();
  data['trendList'] = entity.trendList.map((v) => v.toJson()).toList();
  return data;
}

extension MonthBillCapitalExtension on MonthBillCapital {
  MonthBillCapital copyWith({
    double? totalAmount,
    double? totalAmountDiff,
    List<MonthBillCapitalConfigList>? configList,
    List<MonthBillCapitalTrendList>? trendList,
  }) {
    return MonthBillCapital()
      ..totalAmount = totalAmount ?? this.totalAmount
      ..totalAmountDiff = totalAmountDiff ?? this.totalAmountDiff
      ..configList = configList ?? this.configList
      ..trendList = trendList ?? this.trendList;
  }
}

MonthBillCapitalConfigList $MonthBillCapitalConfigListFromJson(
    Map<String, dynamic> json) {
  final MonthBillCapitalConfigList monthBillCapitalConfigList = MonthBillCapitalConfigList();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    monthBillCapitalConfigList.name = name;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    monthBillCapitalConfigList.amount = amount;
  }
  return monthBillCapitalConfigList;
}

Map<String, dynamic> $MonthBillCapitalConfigListToJson(
    MonthBillCapitalConfigList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['amount'] = entity.amount;
  return data;
}

extension MonthBillCapitalConfigListExtension on MonthBillCapitalConfigList {
  MonthBillCapitalConfigList copyWith({
    String? name,
    double? amount,
  }) {
    return MonthBillCapitalConfigList()
      ..name = name ?? this.name
      ..amount = amount ?? this.amount;
  }
}

MonthBillCapitalTrendList $MonthBillCapitalTrendListFromJson(
    Map<String, dynamic> json) {
  final MonthBillCapitalTrendList monthBillCapitalTrendList = MonthBillCapitalTrendList();
  final String? month = jsonConvert.convert<String>(json['month']);
  if (month != null) {
    monthBillCapitalTrendList.month = month;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    monthBillCapitalTrendList.amount = amount;
  }
  return monthBillCapitalTrendList;
}

Map<String, dynamic> $MonthBillCapitalTrendListToJson(
    MonthBillCapitalTrendList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['month'] = entity.month;
  data['amount'] = entity.amount;
  return data;
}

extension MonthBillCapitalTrendListExtension on MonthBillCapitalTrendList {
  MonthBillCapitalTrendList copyWith({
    String? month,
    double? amount,
  }) {
    return MonthBillCapitalTrendList()
      ..month = month ?? this.month
      ..amount = amount ?? this.amount;
  }
}