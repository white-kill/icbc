import 'package:cbc/generated/json/base/json_field.dart';
import 'package:cbc/generated/json/month_bill_list_entity.g.dart';
import 'dart:convert';
export 'package:cbc/generated/json/month_bill_list_entity.g.dart';

@JsonSerializable()
class MonthBillListEntity {
	int month = 0;
	int year = 0;
	String dateTime = '';
	double income = 0;
	double expenses = 0;

	MonthBillListEntity();

	factory MonthBillListEntity.fromJson(Map<String, dynamic> json) => $MonthBillListEntityFromJson(json);

	Map<String, dynamic> toJson() => $MonthBillListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}