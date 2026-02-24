import 'package:cbc/generated/json/base/json_field.dart';
import 'package:cbc/generated/json/progress_detail_model.g.dart';
import 'dart:convert';
export 'package:cbc/generated/json/progress_detail_model.g.dart';

@JsonSerializable()
class ProgressDetailModel {
	int id = 0;
	String name = '';
	String orderId = '';
	String bankCard = '';
	String busType = '';
	String status = '';
	String currency = '';
	String detailType = '';
	String beginTime = '';
	String endTime = '';
	String method = '';
	String email = '';
	String code = '';
	String createTime = '';
	String showType = '';

	ProgressDetailModel();

	factory ProgressDetailModel.fromJson(Map<String, dynamic> json) => $ProgressDetailModelFromJson(json);

	Map<String, dynamic> toJson() => $ProgressDetailModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}