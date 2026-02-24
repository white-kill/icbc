import 'package:cbc/generated/json/base/json_convert_content.dart';
import 'package:cbc/config/model/progress_list_model.dart';
import 'package:cbc/config/model/progress_detail_model.dart';


ProgressListModel $ProgressListModelFromJson(Map<String, dynamic> json) {
  final ProgressListModel progressListModel = ProgressListModel();
  final List<ProgressListList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ProgressListList>(e) as ProgressListList)
      .toList();
  if (list != null) {
    progressListModel.list = list;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    progressListModel.total = total;
  }
  final String? incomeTotal = jsonConvert.convert<String>(json['incomeTotal']);
  if (incomeTotal != null) {
    progressListModel.incomeTotal = incomeTotal;
  }
  final String? expensesTotal = jsonConvert.convert<String>(
      json['expensesTotal']);
  if (expensesTotal != null) {
    progressListModel.expensesTotal = expensesTotal;
  }
  return progressListModel;
}

Map<String, dynamic> $ProgressListModelToJson(ProgressListModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total'] = entity.total;
  data['incomeTotal'] = entity.incomeTotal;
  data['expensesTotal'] = entity.expensesTotal;
  return data;
}

extension ProgressListModelExtension on ProgressListModel {
  ProgressListModel copyWith({
    List<ProgressListList>? list,
    int? total,
    String? incomeTotal,
    String? expensesTotal,
  }) {
    return ProgressListModel()
      ..list = list ?? this.list
      ..total = total ?? this.total
      ..incomeTotal = incomeTotal ?? this.incomeTotal
      ..expensesTotal = expensesTotal ?? this.expensesTotal;
  }
}

ProgressListList $ProgressListListFromJson(Map<String, dynamic> json) {
  final ProgressListList progressListList = ProgressListList();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    progressListList.id = id;
  }
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    progressListList.bankCard = bankCard;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    progressListList.email = email;
  }
  final String? dateTimeRange = jsonConvert.convert<String>(
      json['dateTimeRange']);
  if (dateTimeRange != null) {
    progressListList.dateTimeRange = dateTimeRange;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    progressListList.status = status;
  }
  final String? detailType = jsonConvert.convert<String>(json['detailType']);
  if (detailType != null) {
    progressListList.detailType = detailType;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    progressListList.code = code;
  }
  final String? createTime = jsonConvert.convert<String>(json['createTime']);
  if (createTime != null) {
    progressListList.createTime = createTime;
  }
  final ProgressDetailModel? detail = jsonConvert.convert<ProgressDetailModel>(
      json['detail']);
  if (detail != null) {
    progressListList.detail = detail;
  }
  return progressListList;
}

Map<String, dynamic> $ProgressListListToJson(ProgressListList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bankCard'] = entity.bankCard;
  data['email'] = entity.email;
  data['dateTimeRange'] = entity.dateTimeRange;
  data['status'] = entity.status;
  data['detailType'] = entity.detailType;
  data['code'] = entity.code;
  data['createTime'] = entity.createTime;
  data['detail'] = entity.detail?.toJson();
  return data;
}

extension ProgressListListExtension on ProgressListList {
  ProgressListList copyWith({
    String? id,
    String? bankCard,
    String? email,
    String? dateTimeRange,
    String? status,
    String? detailType,
    String? code,
    String? createTime,
    ProgressDetailModel? detail,
  }) {
    return ProgressListList()
      ..id = id ?? this.id
      ..bankCard = bankCard ?? this.bankCard
      ..email = email ?? this.email
      ..dateTimeRange = dateTimeRange ?? this.dateTimeRange
      ..status = status ?? this.status
      ..detailType = detailType ?? this.detailType
      ..code = code ?? this.code
      ..createTime = createTime ?? this.createTime
      ..detail = detail ?? this.detail;
  }
}