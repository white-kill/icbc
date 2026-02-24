import 'package:cbc/generated/json/base/json_convert_content.dart';
import 'package:cbc/config/model/transfer_page_model.dart';

TransferPageModel $TransferPageModelFromJson(Map<String, dynamic> json) {
  final TransferPageModel transferPageModel = TransferPageModel();
  final List<TransferPageList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<TransferPageList>(e) as TransferPageList)
      .toList();
  if (list != null) {
    transferPageModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    transferPageModel.total = total;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    transferPageModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    transferPageModel.expensesTotal = expensesTotal;
  }
  final dynamic customizeParam = json['customizeParam'];
  if (customizeParam != null) {
    transferPageModel.customizeParam = customizeParam;
  }
  return transferPageModel;
}

Map<String, dynamic> $TransferPageModelToJson(TransferPageModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  data['customizeParam'] = entity.customizeParam;
  return data;
}

extension TransferPageModelExtension on TransferPageModel {
  TransferPageModel copyWith({
    List<TransferPageList>? list,
    int? total,
    String? incomeTotal,
    String? expensesTotal,
    dynamic customizeParam,
  }) {
    return TransferPageModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal
      ..customizeParam = customizeParam ?? this.customizeParam;
  }
}

TransferPageList $TransferPageListFromJson(Map<String, dynamic> json) {
  final TransferPageList transferPageList = TransferPageList();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    transferPageList.id = id;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    transferPageList.amount = amount;
  }
  final String? oppositeName = jsonConvert.convert<String>(
      json['oppositeName']);
  if (oppositeName != null) {
    transferPageList.oppositeName = oppositeName;
  }
  final String? oppositeAccount = jsonConvert.convert<String>(
      json['oppositeAccount']);
  if (oppositeAccount != null) {
    transferPageList.oppositeAccount = oppositeAccount;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    transferPageList.icon = icon;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    transferPageList.day = day;
  }
  final String? daily = jsonConvert.convert<String>(json['daily']);
  if (daily != null) {
    transferPageList.daily = daily;
  }
  final String? time = jsonConvert.convert<String>(json['time']);
  if (time != null) {
    transferPageList.time = time;
  }
  final String? week = jsonConvert.convert<String>(json['week']);
  if (week != null) {
    transferPageList.week = week;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    transferPageList.type = type;
  }
  final String? endPageTime = jsonConvert.convert<String>(json['endPageTime']);
  if (endPageTime != null) {
    transferPageList.endPageTime = endPageTime;
  }
  final TransferPageListBillDetail? billDetail = jsonConvert.convert<
      TransferPageListBillDetail>(json['billDetail']);
  if (billDetail != null) {
    transferPageList.billDetail = billDetail;
  }
  return transferPageList;
}

Map<String, dynamic> $TransferPageListToJson(TransferPageList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['amount'] = entity.amount;
  data['oppositeName'] = entity.oppositeName;
  data['oppositeAccount'] = entity.oppositeAccount;
  data['icon'] = entity.icon;
  data['day'] = entity.day;
  data['daily'] = entity.daily;
  data['time'] = entity.time;
  data['week'] = entity.week;
  data['type'] = entity.type;
  data['endPageTime'] = entity.endPageTime;
  data['billDetail'] = entity.billDetail?.toJson();
  return data;
}

extension TransferPageListExtension on TransferPageList {
  TransferPageList copyWith({
    String? id,
    double? amount,
    String? oppositeName,
    String? oppositeAccount,
    String? icon,
    String? day,
    String? daily,
    String? time,
    String? week,
    String? type,
    String? endPageTime,
    TransferPageListBillDetail? billDetail,
  }) {
    return TransferPageList()
      ..id = id ?? this.id
      ..amount = amount ?? this.amount
      ..oppositeName = oppositeName ?? this.oppositeName
      ..oppositeAccount = oppositeAccount ?? this.oppositeAccount
      ..icon = icon ?? this.icon
      ..day = day ?? this.day
      ..daily = daily ?? this.daily
      ..time = time ?? this.time
      ..week = week ?? this.week
      ..type = type ?? this.type
      ..endPageTime = endPageTime ?? this.endPageTime
      ..billDetail = billDetail ?? this.billDetail;
  }
}

TransferPageListBillDetail $TransferPageListBillDetailFromJson(
    Map<String, dynamic> json) {
  final TransferPageListBillDetail transferPageListBillDetail = TransferPageListBillDetail();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    transferPageListBillDetail.id = id;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    transferPageListBillDetail.amount = amount;
  }
  final String? oppositeBankId = jsonConvert.convert<String>(
      json['oppositeBankId']);
  if (oppositeBankId != null) {
    transferPageListBillDetail.oppositeBankId = oppositeBankId;
  }
  final String? transactionTime = jsonConvert.convert<String>(
      json['transactionTime']);
  if (transactionTime != null) {
    transferPageListBillDetail.transactionTime = transactionTime;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    transferPageListBillDetail.bankCard = bankCard;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    transferPageListBillDetail.bankName = bankName;
  }
  final String? oppositeName = jsonConvert.convert<String>(
      json['oppositeName']);
  if (oppositeName != null) {
    transferPageListBillDetail.oppositeName = oppositeName;
  }
  final String? oppositeAccount = jsonConvert.convert<String>(
      json['oppositeAccount']);
  if (oppositeAccount != null) {
    transferPageListBillDetail.oppositeAccount = oppositeAccount;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    transferPageListBillDetail.icon = icon;
  }
  final String? transactionType = jsonConvert.convert<String>(
      json['transactionType']);
  if (transactionType != null) {
    transferPageListBillDetail.transactionType = transactionType;
  }
  final String? transactionChannel = jsonConvert.convert<String>(
      json['transactionChannel']);
  if (transactionChannel != null) {
    transferPageListBillDetail.transactionChannel = transactionChannel;
  }
  final String? oppositeBankName = jsonConvert.convert<String>(
      json['oppositeBankName']);
  if (oppositeBankName != null) {
    transferPageListBillDetail.oppositeBankName = oppositeBankName;
  }
  final String? certificateNo = jsonConvert.convert<String>(
      json['certificateNo']);
  if (certificateNo != null) {
    transferPageListBillDetail.certificateNo = certificateNo;
  }
  final String? merchantBranch = jsonConvert.convert<String>(
      json['merchantBranch']);
  if (merchantBranch != null) {
    transferPageListBillDetail.merchantBranch = merchantBranch;
  }
  final String? serialNumber = jsonConvert.convert<String>(
      json['serialNumber']);
  if (serialNumber != null) {
    transferPageListBillDetail.serialNumber = serialNumber;
  }
  return transferPageListBillDetail;
}

Map<String, dynamic> $TransferPageListBillDetailToJson(
    TransferPageListBillDetail entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['amount'] = entity.amount;
  data['oppositeBankId'] = entity.oppositeBankId;
  data['transactionTime'] = entity.transactionTime;
  data['bankCard'] = entity.bankCard;
  data['bankName'] = entity.bankName;
  data['oppositeName'] = entity.oppositeName;
  data['oppositeAccount'] = entity.oppositeAccount;
  data['icon'] = entity.icon;
  data['transactionType'] = entity.transactionType;
  data['transactionChannel'] = entity.transactionChannel;
  data['oppositeBankName'] = entity.oppositeBankName;
  data['certificateNo'] = entity.certificateNo;
  data['merchantBranch'] = entity.merchantBranch;
  data['serialNumber'] = entity.serialNumber;
  return data;
}

extension TransferPageListBillDetailExtension on TransferPageListBillDetail {
  TransferPageListBillDetail copyWith({
    String? id,
    double? amount,
    String? oppositeBankId,
    String? transactionTime,
    String? bankCard,
    String? bankName,
    String? oppositeName,
    String? oppositeAccount,
    String? icon,
    String? transactionType,
    String? transactionChannel,
    String? oppositeBankName,
    String? certificateNo,
    String? merchantBranch,
    String? serialNumber,
  }) {
    return TransferPageListBillDetail()
      ..id = id ?? this.id
      ..amount = amount ?? this.amount
      ..oppositeBankId = oppositeBankId ?? this.oppositeBankId
      ..transactionTime = transactionTime ?? this.transactionTime
      ..bankCard = bankCard ?? this.bankCard
      ..bankName = bankName ?? this.bankName
      ..oppositeName = oppositeName ?? this.oppositeName
      ..oppositeAccount = oppositeAccount ?? this.oppositeAccount
      ..icon = icon ?? this.icon
      ..transactionType = transactionType ?? this.transactionType
      ..transactionChannel = transactionChannel ?? this.transactionChannel
      ..oppositeBankName = oppositeBankName ?? this.oppositeBankName
      ..certificateNo = certificateNo ?? this.certificateNo
      ..merchantBranch = merchantBranch ?? this.merchantBranch
      ..serialNumber = serialNumber ?? this.serialNumber;
  }
}