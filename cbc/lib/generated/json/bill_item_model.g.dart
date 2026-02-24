import 'package:cbc/generated/json/base/json_convert_content.dart';
import 'package:cbc/config/model/bill_item_model.dart';

BillItemModel $BillItemModelFromJson(Map<String, dynamic> json) {
  final BillItemModel billItemModel = BillItemModel();
  final List<BillItemList>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<BillItemList>(e) as BillItemList).toList();
  if (list != null) {
    billItemModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    billItemModel.total = total;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    billItemModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    billItemModel.expensesTotal = expensesTotal;
  }
  final dynamic customizeParam = json['customizeParam'];
  if (customizeParam != null) {
    billItemModel.customizeParam = customizeParam;
  }
  return billItemModel;
}

Map<String, dynamic> $BillItemModelToJson(BillItemModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  data['customizeParam'] = entity.customizeParam;
  return data;
}

extension BillItemModelExtension on BillItemModel {
  BillItemModel copyWith({
    List<BillItemList>? list,
    int? total,
    String? incomeTotal,
    String? expensesTotal,
    dynamic customizeParam,
  }) {
    return BillItemModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal
      ..customizeParam = customizeParam ?? this.customizeParam;
  }
}

BillItemList $BillItemListFromJson(Map<String, dynamic> json) {
  final BillItemList billItemList = BillItemList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    billItemList.id = id;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    billItemList.excerpt = excerpt;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    billItemList.amount = amount;
  }
  final String? accountBalance = jsonConvert.convert<String>(
      json['accountBalance']);
  if (accountBalance != null) {
    billItemList.accountBalance = accountBalance;
  }
  final String? merchantBranch = jsonConvert.convert<String>(
      json['merchantBranch']);
  if (merchantBranch != null) {
    billItemList.merchantBranch = merchantBranch;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    billItemList.day = day;
  }
  final String? daily = jsonConvert.convert<String>(json['daily']);
  if (daily != null) {
    billItemList.daily = daily;
  }
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    billItemList.time = time;
  }
  final String? week = jsonConvert.convert<String>(json['week']);
  if (week != null) {
    billItemList.week = week;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    billItemList.type = type;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    billItemList.bankCard = bankCard;
  }
  final BillItemListBillDetail? billDetail = jsonConvert.convert<
      BillItemListBillDetail>(json['billDetail']);
  if (billDetail != null) {
    billItemList.billDetail = billDetail;
  }
  final String? endPageTime = jsonConvert.convert<String>(json['endPageTime']);
  if (endPageTime != null) {
    billItemList.endPageTime = endPageTime;
  }
  return billItemList;
}

Map<String, dynamic> $BillItemListToJson(BillItemList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['excerpt'] = entity.excerpt;
  data['amount'] = entity.amount;
  data['accountBalance'] = entity.accountBalance;
  data['merchantBranch'] = entity.merchantBranch;
  data['day'] = entity.day;
  data['daily'] = entity.daily;
  data['time'] = entity.time;
  data['week'] = entity.week;
  data['type'] = entity.type;
  data['bankCard'] = entity.bankCard;
  data['billDetail'] = entity.billDetail?.toJson();
  data['endPageTime'] = entity.endPageTime;
  return data;
}

extension BillItemListExtension on BillItemList {
  BillItemList copyWith({
    int? id,
    String? excerpt,
    String? amount,
    String? accountBalance,
    String? merchantBranch,
    String? day,
    String? daily,
    String? time,
    String? week,
    String? type,
    String? bankCard,
    BillItemListBillDetail? billDetail,
    String? endPageTime,
  }) {
    return BillItemList()
      ..id = id ?? this.id
      ..excerpt = excerpt ?? this.excerpt
      ..amount = amount ?? this.amount
      ..accountBalance = accountBalance ?? this.accountBalance
      ..merchantBranch = merchantBranch ?? this.merchantBranch
      ..day = day ?? this.day
      ..daily = daily ?? this.daily
      ..time = time ?? this.time
      ..week = week ?? this.week
      ..type = type ?? this.type
      ..bankCard = bankCard ?? this.bankCard
      ..billDetail = billDetail ?? this.billDetail
      ..endPageTime = endPageTime ?? this.endPageTime;
  }
}

BillItemListBillDetail $BillItemListBillDetailFromJson(
    Map<String, dynamic> json) {
  final BillItemListBillDetail billItemListBillDetail = BillItemListBillDetail();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    billItemListBillDetail.id = id;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    billItemListBillDetail.bankName = bankName;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    billItemListBillDetail.bankCard = bankCard;
  }
  final String? excerpt = jsonConvert.convert<String>(json['excerpt']);
  if (excerpt != null) {
    billItemListBillDetail.excerpt = excerpt;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    billItemListBillDetail.amount = amount;
  }
  final double? accountBalance = jsonConvert.convert<double>(
      json['accountBalance']);
  if (accountBalance != null) {
    billItemListBillDetail.accountBalance = accountBalance;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    billItemListBillDetail.transactionTime = transactionTime;
  }
  final String? transactionCountry = jsonConvert.convert<String>(
      json['transactionCountry']);
  if (transactionCountry != null) {
    billItemListBillDetail.transactionCountry = transactionCountry;
  }
  final String? transactionCurrency = jsonConvert.convert<String>(
      json['transactionCurrency']);
  if (transactionCurrency != null) {
    billItemListBillDetail.transactionCurrency = transactionCurrency;
  }
  final String? oppositeAccount = jsonConvert.convert<String>(
      json['oppositeAccount']);
  if (oppositeAccount != null) {
    billItemListBillDetail.oppositeAccount = oppositeAccount;
  }
  final String? accountsTime = jsonConvert.convert<String>(
      json['accountsTime']);
  if (accountsTime != null) {
    billItemListBillDetail.accountsTime = accountsTime;
  }
  final String? merchantBranch = jsonConvert.convert<String>(
      json['merchantBranch']);
  if (merchantBranch != null) {
    billItemListBillDetail.merchantBranch = merchantBranch;
  }
  final String? oppositeName = jsonConvert.convert<String>(
      json['oppositeName']);
  if (oppositeName != null) {
    billItemListBillDetail.oppositeName = oppositeName;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    billItemListBillDetail.type = type;
  }
  final String? oppositeBankName = jsonConvert.convert<String>(
      json['oppositeBankName']);
  if (oppositeBankName != null) {
    billItemListBillDetail.oppositeBankName = oppositeBankName;
  }
  return billItemListBillDetail;
}

Map<String, dynamic> $BillItemListBillDetailToJson(
    BillItemListBillDetail entity) {
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

extension BillItemListBillDetailExtension on BillItemListBillDetail {
  BillItemListBillDetail copyWith({
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
    String? type,
    String? oppositeBankName,
  }) {
    return BillItemListBillDetail()
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