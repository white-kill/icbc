import 'package:cbc/generated/json/base/json_convert_content.dart';
import 'package:cbc/config/model/category_data_model.dart';
import 'package:cbc/config/model/bill_item_model.dart';

import 'package:cbc/config/model/pay_ment_model.dart';


CategoryDataModel $CategoryDataModelFromJson(Map<String, dynamic> json) {
  final CategoryDataModel categoryDataModel = CategoryDataModel();
  final List<CategoryDataList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<CategoryDataList>(e) as CategoryDataList)
      .toList();
  if (list != null) {
    categoryDataModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    categoryDataModel.total = total;
  }
  final dynamic pages = json['pages'];
  if (pages != null) {
    categoryDataModel.pages = pages;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    categoryDataModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    categoryDataModel.expensesTotal = expensesTotal;
  }
  final dynamic customizeParam = json['customizeParam'];
  if (customizeParam != null) {
    categoryDataModel.customizeParam = customizeParam;
  }
  return categoryDataModel;
}

Map<String, dynamic> $CategoryDataModelToJson(CategoryDataModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['pages'] = entity.pages;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  data['customizeParam'] = entity.customizeParam;
  return data;
}

extension CategoryDataModelExtension on CategoryDataModel {
  CategoryDataModel copyWith({
    List<CategoryDataList>? list,
    int? total,
    dynamic pages,
    String? incomeTotal,
    String? expensesTotal,
    dynamic customizeParam,
  }) {
    return CategoryDataModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..pages = pages ?? this.pages
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal
      ..customizeParam = customizeParam ?? this.customizeParam;
  }
}

CategoryDataList $CategoryDataListFromJson(Map<String, dynamic> json) {
  final CategoryDataList categoryDataList = CategoryDataList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    categoryDataList.id = id;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    categoryDataList.excerpt = excerpt;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    categoryDataList.amount = amount;
  }
  final String? accountBalance = jsonConvert.convert<String>(
      json['accountBalance']);
  if (accountBalance != null) {
    categoryDataList.accountBalance = accountBalance;
  }
  final String? merchantBranch = jsonConvert.convert<String>(
      json['merchantBranch']);
  if (merchantBranch != null) {
    categoryDataList.merchantBranch = merchantBranch;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    categoryDataList.day = day;
  }
  final String? daily = jsonConvert.convert<String>(json['daily']);
  if (daily != null) {
    categoryDataList.daily = daily;
  }
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    categoryDataList.time = time;
  }
  final String? categoryIcon = jsonConvert.convert<String>(
      json['categoryIcon']);
  if (categoryIcon != null) {
    categoryDataList.categoryIcon = categoryIcon;
  }
  final String? week = jsonConvert.convert<String>(json['week']);
  if (week != null) {
    categoryDataList.week = week;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    categoryDataList.type = type;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    categoryDataList.bankCard = bankCard;
  }
  final PayMentListBillDetail? billDetail = jsonConvert.convert<
      PayMentListBillDetail>(json['billDetail']);
  if (billDetail != null) {
    categoryDataList.billDetail = billDetail;
  }
  final String? endPageTime = jsonConvert.convert<String>(json['endPageTime']);
  if (endPageTime != null) {
    categoryDataList.endPageTime = endPageTime;
  }
  return categoryDataList;
}

Map<String, dynamic> $CategoryDataListToJson(CategoryDataList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['excerpt'] = entity.excerpt;
  data['amount'] = entity.amount;
  data['accountBalance'] = entity.accountBalance;
  data['merchantBranch'] = entity.merchantBranch;
  data['day'] = entity.day;
  data['daily'] = entity.daily;
  data['time'] = entity.time;
  data['categoryIcon'] = entity.categoryIcon;
  data['week'] = entity.week;
  data['type'] = entity.type;
  data['bankCard'] = entity.bankCard;
  data['billDetail'] = entity.billDetail?.toJson();
  data['endPageTime'] = entity.endPageTime;
  return data;
}

extension CategoryDataListExtension on CategoryDataList {
  CategoryDataList copyWith({
    int? id,
    String? excerpt,
    String? amount,
    String? accountBalance,
    String? merchantBranch,
    String? day,
    String? daily,
    String? time,
    String? categoryIcon,
    String? week,
    String? type,
    String? bankCard,
    PayMentListBillDetail? billDetail,
    String? endPageTime,
  }) {
    return CategoryDataList()
      ..id = id ?? this.id
      ..excerpt = excerpt ?? this.excerpt
      ..amount = amount ?? this.amount
      ..accountBalance = accountBalance ?? this.accountBalance
      ..merchantBranch = merchantBranch ?? this.merchantBranch
      ..day = day ?? this.day
      ..daily = daily ?? this.daily
      ..time = time ?? this.time
      ..categoryIcon = categoryIcon ?? this.categoryIcon
      ..week = week ?? this.week
      ..type = type ?? this.type
      ..bankCard = bankCard ?? this.bankCard
      ..billDetail = billDetail ?? this.billDetail
      ..endPageTime = endPageTime ?? this.endPageTime;
  }
}

CategoryDataListBillDetail $CategoryDataListBillDetailFromJson(
    Map<String, dynamic> json) {
  final CategoryDataListBillDetail categoryDataListBillDetail = CategoryDataListBillDetail();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    categoryDataListBillDetail.id = id;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    categoryDataListBillDetail.bankName = bankName;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    categoryDataListBillDetail.bankCard = bankCard;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    categoryDataListBillDetail.excerpt = excerpt;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    categoryDataListBillDetail.amount = amount;
  }
  final double? accountBalance = jsonConvert.convert<double>(
      json['accountBalance']);
  if (accountBalance != null) {
    categoryDataListBillDetail.accountBalance = accountBalance;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    categoryDataListBillDetail.transactionTime = transactionTime;
  }
  final String? transactionCountry = jsonConvert.convert<String>(
      json['transactionCountry']);
  if (transactionCountry != null) {
    categoryDataListBillDetail.transactionCountry = transactionCountry;
  }
  final String? transactionCurrency = jsonConvert.convert<String>(
      json['transactionCurrency']);
  if (transactionCurrency != null) {
    categoryDataListBillDetail.transactionCurrency = transactionCurrency;
  }
  final String? oppositeAccount = jsonConvert.convert<String>(
      json['oppositeAccount']);
  if (oppositeAccount != null) {
    categoryDataListBillDetail.oppositeAccount = oppositeAccount;
  }
  final dynamic accountsTime = json['accountsTime'];
  if (accountsTime != null) {
    categoryDataListBillDetail.accountsTime = accountsTime;
  }
  final String? merchantBranch = jsonConvert.convert<String>(
      json['merchantBranch']);
  if (merchantBranch != null) {
    categoryDataListBillDetail.merchantBranch = merchantBranch;
  }
  final String? oppositeName = jsonConvert.convert<String>(
      json['oppositeName']);
  if (oppositeName != null) {
    categoryDataListBillDetail.oppositeName = oppositeName;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    categoryDataListBillDetail.type = type;
  }
  final String? oppositeBankName = jsonConvert.convert<String>(
      json['oppositeBankName']);
  if (oppositeBankName != null) {
    categoryDataListBillDetail.oppositeBankName = oppositeBankName;
  }
  return categoryDataListBillDetail;
}

Map<String, dynamic> $CategoryDataListBillDetailToJson(
    CategoryDataListBillDetail entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bankName'] = entity.bankName;
  data['bankCard'] = entity.bankCard;
  data['excerpt'] = entity.excerpt;
  data['amount'] = entity.amount;
  data['accountBalance'] = entity.accountBalance;
  data['transactionTime'] = entity.transactionTime;
  data['transactionCountry'] = entity.transactionCountry;
  data['transactionCurrency'] = entity.transactionCurrency;
  data['oppositeAccount'] = entity.oppositeAccount;
  data['accountsTime'] = entity.accountsTime;
  data['merchantBranch'] = entity.merchantBranch;
  data['oppositeName'] = entity.oppositeName;
  data['type'] = entity.type;
  data['oppositeBankName'] = entity.oppositeBankName;
  return data;
}

extension CategoryDataListBillDetailExtension on CategoryDataListBillDetail {
  CategoryDataListBillDetail copyWith({
    int? id,
    String? bankName,
    String? bankCard,
    String? excerpt,
    double? amount,
    double? accountBalance,
    String? transactionTime,
    String? transactionCountry,
    String? transactionCurrency,
    String? oppositeAccount,
    dynamic accountsTime,
    String? merchantBranch,
    String? oppositeName,
    int? type,
    String? oppositeBankName,
  }) {
    return CategoryDataListBillDetail()
      ..id = id ?? this.id
      ..bankName = bankName ?? this.bankName
      ..bankCard = bankCard ?? this.bankCard
      ..excerpt = excerpt ?? this.excerpt
      ..amount = amount ?? this.amount
      ..accountBalance = accountBalance ?? this.accountBalance
      ..transactionTime = transactionTime ?? this.transactionTime
      ..transactionCountry = transactionCountry ?? this.transactionCountry
      ..transactionCurrency = transactionCurrency ?? this.transactionCurrency
      ..oppositeAccount = oppositeAccount ?? this.oppositeAccount
      ..accountsTime = accountsTime ?? this.accountsTime
      ..merchantBranch = merchantBranch ?? this.merchantBranch
      ..oppositeName = oppositeName ?? this.oppositeName
      ..type = type ?? this.type
      ..oppositeBankName = oppositeBankName ?? this.oppositeBankName;
  }
}