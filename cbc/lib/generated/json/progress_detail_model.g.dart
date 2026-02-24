import 'package:cbc/generated/json/base/json_convert_content.dart';
import 'package:cbc/config/model/progress_detail_model.dart';

ProgressDetailModel $ProgressDetailModelFromJson(Map<String, dynamic> json) {
  final ProgressDetailModel progressDetailModel = ProgressDetailModel();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    progressDetailModel.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    progressDetailModel.name = name;
  }
  final String? orderId = jsonConvert.convert<String>(json['orderId']);
  if (orderId != null) {
    progressDetailModel.orderId = orderId;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    progressDetailModel.bankCard = bankCard;
  }
  final String? busType = jsonConvert.convert<String>(json['busType']);
  if (busType != null) {
    progressDetailModel.busType = busType;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    progressDetailModel.status = status;
  }
  final String? currency = jsonConvert.convert<String>(json['currency']);
  if (currency != null) {
    progressDetailModel.currency = currency;
  }
  final String? detailType = jsonConvert.convert<String>(json['detailType']);
  if (detailType != null) {
    progressDetailModel.detailType = detailType;
  }
  final String? beginTime = jsonConvert.convert<String>(json['beginTime']);
  if (beginTime != null) {
    progressDetailModel.beginTime = beginTime;
  }
  final String? endTime = jsonConvert.convert<String>(json['endTime']);
  if (endTime != null) {
    progressDetailModel.endTime = endTime;
  }
  final String? method = jsonConvert.convert<String>(json['method']);
  if (method != null) {
    progressDetailModel.method = method;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    progressDetailModel.email = email;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    progressDetailModel.code = code;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    progressDetailModel.createTime = createTime;
  }
  final String? showType = jsonConvert.convert<String>(json['showType']);
  if (showType != null) {
    progressDetailModel.showType = showType;
  }
  return progressDetailModel;
}

Map<String, dynamic> $ProgressDetailModelToJson(ProgressDetailModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['orderId'] = entity.orderId;
  data['bankCard'] = entity.bankCard;
  data['busType'] = entity.busType;
  data['status'] = entity.status;
  data['currency'] = entity.currency;
  data['detailType'] = entity.detailType;
  data['beginTime'] = entity.beginTime;
  data['endTime'] = entity.endTime;
  data['method'] = entity.method;
  data['email'] = entity.email;
  data['code'] = entity.code;
  data['createTime'] = entity.createTime;
  data['showType'] = entity.showType;
  return data;
}

extension ProgressDetailModelExtension on ProgressDetailModel {
  ProgressDetailModel copyWith({
    int? id,
    String? name,
    String? orderId,
    String? bankCard,
    String? busType,
    String? status,
    String? currency,
    String? detailType,
    String? beginTime,
    String? endTime,
    String? method,
    String? email,
    String? code,
    String? createTime,
    String? showType,
  }) {
    return ProgressDetailModel()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..orderId = orderId ?? this.orderId
      ..bankCard = bankCard ?? this.bankCard
      ..busType = busType ?? this.busType
      ..status = status ?? this.status
      ..currency = currency ?? this.currency
      ..detailType = detailType ?? this.detailType
      ..beginTime = beginTime ?? this.beginTime
      ..endTime = endTime ?? this.endTime
      ..method = method ?? this.method
      ..email = email ?? this.email
      ..code = code ?? this.code
      ..createTime = createTime ?? this.createTime
      ..showType = showType ?? this.showType;
  }
}