import 'package:cbc/config/model/progress_detail_model.dart';
import 'package:cbc/generated/json/base/json_field.dart';
import 'package:cbc/generated/json/progress_list_model.g.dart';
import 'dart:convert';
export 'package:cbc/generated/json/progress_list_model.g.dart';

@JsonSerializable()
class ProgressListModel {
	List<ProgressListList> list = [];
	int total = 0;
	String incomeTotal = '';
	String expensesTotal = '';

	ProgressListModel();

	factory ProgressListModel.fromJson(Map<String, dynamic> json) => $ProgressListModelFromJson(json);

	Map<String, dynamic> toJson() => $ProgressListModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProgressListList {
	String id = '';
	String bankCard = '';
	String email = '';
	String dateTimeRange = '';
	String status = '';
	String detailType = '';
	String code = '';
	String createTime = '';
	ProgressDetailModel? detail;

	ProgressListList();

	factory ProgressListList.fromJson(Map<String, dynamic> json) => $ProgressListListFromJson(json);

	Map<String, dynamic> toJson() => $ProgressListListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}