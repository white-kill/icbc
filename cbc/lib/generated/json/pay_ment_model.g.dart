import 'package:cbc/generated/json/base/json_convert_content.dart';
import 'package:cbc/config/model/pay_ment_model.dart';

PayMentModel $PayMentModelFromJson(Map<String, dynamic> json) {
  final PayMentModel payMentModel = PayMentModel();
  final List<PayMentList>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<PayMentList>(e) as PayMentList).toList();
  if (list != null) {
    payMentModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    payMentModel.total = total;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    payMentModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    payMentModel.expensesTotal = expensesTotal;
  }
  final dynamic customizeParam = json['customizeParam'];
  if (customizeParam != null) {
    payMentModel.customizeParam = customizeParam;
  }
  return payMentModel;
}

Map<String, dynamic> $PayMentModelToJson(PayMentModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  data['customizeParam'] = entity.customizeParam;
  return data;
}

extension PayMentModelExtension on PayMentModel {
  PayMentModel copyWith({
    List<PayMentList>? list,
    int? total,
    String? incomeTotal,
    String? expensesTotal,
    dynamic customizeParam,
  }) {
    return PayMentModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal
      ..customizeParam = customizeParam ?? this.customizeParam;
  }
}

PayMentList $PayMentListFromJson(Map<String, dynamic> json) {
  final PayMentList payMentList = PayMentList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    payMentList.id = id;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    payMentList.excerpt = excerpt;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    payMentList.amount = amount;
  }
  final String? accountBalance = jsonConvert.convert<String>(
      json['accountBalance']);
  if (accountBalance != null) {
    payMentList.accountBalance = accountBalance;
  }
  final String? categoryIcon = jsonConvert.convert<String>(
      json['categoryIcon']);
  if (categoryIcon != null) {
    payMentList.categoryIcon = categoryIcon;
  }
  final String? merchantBranch = jsonConvert.convert<String>(
      json['merchantBranch']);
  if (merchantBranch != null) {
    payMentList.merchantBranch = merchantBranch;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    payMentList.day = day;
  }
  final String? daily = jsonConvert.convert<String>(json['daily']);
  if (daily != null) {
    payMentList.daily = daily;
  }
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    payMentList.time = time;
  }
  final String? week = jsonConvert.convert<String>(json['week']);
  if (week != null) {
    payMentList.week = week;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    payMentList.type = type;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    payMentList.bankCard = bankCard;
  }
  final PayMentListBillDetail? billDetail = jsonConvert.convert<
      PayMentListBillDetail>(json['billDetail']);
  if (billDetail != null) {
    payMentList.billDetail = billDetail;
  }
  final double? incomeTotal = jsonConvert.convert<double>(json['incomeTotal']);
  if (incomeTotal != null) {
    payMentList.incomeTotal = incomeTotal;
  }
  final double? expensesTotal = jsonConvert.convert<double>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    payMentList.expensesTotal = expensesTotal;
  }
  final String? endPageTime = jsonConvert.convert<String>(json['endPageTime']);
  if (endPageTime != null) {
    payMentList.endPageTime = endPageTime;
  }
  return payMentList;
}

Map<String, dynamic> $PayMentListToJson(PayMentList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['excerpt'] = entity.excerpt;
  data['amount'] = entity.amount;
  data['accountBalance'] = entity.accountBalance;
  data['categoryIcon'] = entity.categoryIcon;
  data['merchantBranch'] = entity.merchantBranch;
  data['day'] = entity.day;
  data['daily'] = entity.daily;
  data['time'] = entity.time;
  data['week'] = entity.week;
  data['type'] = entity.type;
  data['bankCard'] = entity.bankCard;
  data['billDetail'] = entity.billDetail?.toJson();
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  data['endPageTime'] = entity.endPageTime;
  return data;
}

extension PayMentListExtension on PayMentList {
  PayMentList copyWith({
    int? id,
    String? excerpt,
    String? amount,
    String? accountBalance,
    String? categoryIcon,
    String? merchantBranch,
    String? day,
    String? daily,
    String? time,
    String? week,
    String? type,
    String? bankCard,
    PayMentListBillDetail? billDetail,
    double? incomeTotal,
    double? expensesTotal,
    String? endPageTime,
  }) {
    return PayMentList()
      ..id = id ?? this.id
      ..excerpt = excerpt ?? this.excerpt
      ..amount = amount ?? this.amount
      ..accountBalance = accountBalance ?? this.accountBalance
      ..categoryIcon = categoryIcon ?? this.categoryIcon
      ..merchantBranch = merchantBranch ?? this.merchantBranch
      ..day = day ?? this.day
      ..daily = daily ?? this.daily
      ..time = time ?? this.time
      ..week = week ?? this.week
      ..type = type ?? this.type
      ..bankCard = bankCard ?? this.bankCard
      ..billDetail = billDetail ?? this.billDetail
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal
      ..endPageTime = endPageTime ?? this.endPageTime;
  }
}

PayMentListBillDetail $PayMentListBillDetailFromJson(
    Map<String, dynamic> json) {
  final PayMentListBillDetail payMentListBillDetail = PayMentListBillDetail();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    payMentListBillDetail.id = id;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    payMentListBillDetail.bankName = bankName;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    payMentListBillDetail.bankCard = bankCard;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    payMentListBillDetail.excerpt = excerpt;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    payMentListBillDetail.amount = amount;
  }
  final double? accountBalance = jsonConvert.convert<double>(
      json['accountBalance']);
  if (accountBalance != null) {
    payMentListBillDetail.accountBalance = accountBalance;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    payMentListBillDetail.transactionTime = transactionTime;
  }
  final String? transactionCountry = jsonConvert.convert<String>(
      json['transactionCountry']);
  if (transactionCountry != null) {
    payMentListBillDetail.transactionCountry = transactionCountry;
  }
  final String? transactionCurrency = jsonConvert.convert<String>(
      json['transactionCurrency']);
  if (transactionCurrency != null) {
    payMentListBillDetail.transactionCurrency = transactionCurrency;
  }
  final String? oppositeAccount = jsonConvert.convert<String>(
      json['oppositeAccount']);
  if (oppositeAccount != null) {
    payMentListBillDetail.oppositeAccount = oppositeAccount;
  }
  final String? accountsTime = jsonConvert.convert<String>(
      json['accountsTime']);
  if (accountsTime != null) {
    payMentListBillDetail.accountsTime = accountsTime;
  }
  final String? merchantBranch = jsonConvert.convert<String>(
      json['merchantBranch']);
  if (merchantBranch != null) {
    payMentListBillDetail.merchantBranch = merchantBranch;
  }
  final String? oppositeName = jsonConvert.convert<String>(
      json['oppositeName']);
  if (oppositeName != null) {
    payMentListBillDetail.oppositeName = oppositeName;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    payMentListBillDetail.icon = icon;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    payMentListBillDetail.type = type;
  }
  final String? oppositeBankName = jsonConvert.convert<String>(
      json['oppositeBankName']);
  if (oppositeBankName != null) {
    payMentListBillDetail.oppositeBankName = oppositeBankName;
  }
  return payMentListBillDetail;
}

Map<String, dynamic> $PayMentListBillDetailToJson(
    PayMentListBillDetail entity) {
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
  data['icon'] = entity.icon;
  data['type'] = entity.type;
  data['oppositeBankName'] = entity.oppositeBankName;
  return data;
}

extension PayMentListBillDetailExtension on PayMentListBillDetail {
  PayMentListBillDetail copyWith({
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
    String? accountsTime,
    String? merchantBranch,
    String? oppositeName,
    String? icon,
    String? type,
    String? oppositeBankName,
  }) {
    return PayMentListBillDetail()
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
      ..icon = icon ?? this.icon
      ..type = type ?? this.type
      ..oppositeBankName = oppositeBankName ?? this.oppositeBankName;
  }
}