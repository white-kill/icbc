import 'package:cbc/generated/json/base/json_field.dart';
import 'package:cbc/generated/json/month_bill_entity.g.dart';
import 'dart:convert';
export 'package:cbc/generated/json/month_bill_entity.g.dart';

@JsonSerializable()
class MonthBillData {
  MonthBillCustom? custom;
  MonthBillExpenses? expenses;
  MonthBillIncome? income;
  MonthBillCapital? capital;

  MonthBillData();

  factory MonthBillData.fromJson(Map<String, dynamic> json) =>
      $MonthBillDataFromJson(json);

  Map<String, dynamic> toJson() => $MonthBillDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MonthBillCustom {
  double monthCashSurplus = 0;
  String creditCardNum = '';
  String liability = '';
  String creditCardConsumeNum = '';
  String payday = '';
  double monthCashSurplusDiff=0;
  String creditRatio = '';
  String loginCount = '';

  MonthBillCustom();

  factory MonthBillCustom.fromJson(Map<String, dynamic> json) =>
      $MonthBillCustomFromJson(json);

  Map<String, dynamic> toJson() => $MonthBillCustomToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MonthBillExpenses {
  double totalAmount = 0;
  double totalAmountDiff = 0;
  int count = 0;
  double maxAmount = 0;
  String realName = '';
  List<MonthBillExpensesCategoryList> categoryList = [];
  List<MonthBillExpensesTrendList> trendList = [];

  MonthBillExpenses();

  factory MonthBillExpenses.fromJson(Map<String, dynamic> json) =>
      $MonthBillExpensesFromJson(json);

  Map<String, dynamic> toJson() => $MonthBillExpensesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MonthBillExpensesCategoryList {
  String name = '';
  double rate = 0;
  int count = 0;
  double totalAmount = 0;

  MonthBillExpensesCategoryList();

  factory MonthBillExpensesCategoryList.fromJson(Map<String, dynamic> json) =>
      $MonthBillExpensesCategoryListFromJson(json);

  Map<String, dynamic> toJson() => $MonthBillExpensesCategoryListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MonthBillExpensesTrendList {
  String month = '';
  double amount = 0;

  MonthBillExpensesTrendList();

  factory MonthBillExpensesTrendList.fromJson(Map<String, dynamic> json) =>
      $MonthBillExpensesTrendListFromJson(json);

  Map<String, dynamic> toJson() => $MonthBillExpensesTrendListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MonthBillIncome {
  double totalAmount = 0;
  double totalAmountDiff = 0;
  int count = 0;
  double maxAmount = 0;
  String realName = '';
  List<MonthBillIncomeCategoryList> categoryList = [];
  List<MonthBillIncomeTrendList> trendList = [];

  MonthBillIncome();

  factory MonthBillIncome.fromJson(Map<String, dynamic> json) =>
      $MonthBillIncomeFromJson(json);

  Map<String, dynamic> toJson() => $MonthBillIncomeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MonthBillIncomeCategoryList {
  String name = '';
  double rate = 0;
  int count = 0;
  double totalAmount = 0;

  MonthBillIncomeCategoryList();

  factory MonthBillIncomeCategoryList.fromJson(Map<String, dynamic> json) =>
      $MonthBillIncomeCategoryListFromJson(json);

  Map<String, dynamic> toJson() => $MonthBillIncomeCategoryListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MonthBillIncomeTrendList {
  String month = '';
  double amount = 0;

  MonthBillIncomeTrendList();

  factory MonthBillIncomeTrendList.fromJson(Map<String, dynamic> json) =>
      $MonthBillIncomeTrendListFromJson(json);

  Map<String, dynamic> toJson() => $MonthBillIncomeTrendListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MonthBillCapital {
  double totalAmount = 0;
  double totalAmountDiff = 0;
  List<MonthBillCapitalConfigList> configList = [];
  List<MonthBillCapitalTrendList> trendList = [];

  MonthBillCapital();

  factory MonthBillCapital.fromJson(Map<String, dynamic> json) =>
      $MonthBillCapitalFromJson(json);

  Map<String, dynamic> toJson() => $MonthBillCapitalToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MonthBillCapitalConfigList {
  String name = '';
  double amount = 0;

  MonthBillCapitalConfigList();

  factory MonthBillCapitalConfigList.fromJson(Map<String, dynamic> json) =>
      $MonthBillCapitalConfigListFromJson(json);

  Map<String, dynamic> toJson() => $MonthBillCapitalConfigListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MonthBillCapitalTrendList {
  String month = '';
  double amount = 0;

  MonthBillCapitalTrendList();

  factory MonthBillCapitalTrendList.fromJson(Map<String, dynamic> json) =>
      $MonthBillCapitalTrendListFromJson(json);

  Map<String, dynamic> toJson() => $MonthBillCapitalTrendListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
