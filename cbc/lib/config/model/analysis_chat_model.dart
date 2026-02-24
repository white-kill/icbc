import 'package:cbc/generated/json/base/json_field.dart';
import 'package:cbc/generated/json/analysis_chat_model.g.dart';
import 'dart:convert';
export 'package:cbc/generated/json/analysis_chat_model.g.dart';

@JsonSerializable()
class AnalysisChatModel {
	double income = 0;
	double expenses = 0;
	double cashSurplus = 0;
	List<AnalysisChatTrendList> trendList = [];
	List<AnalysisChatIncomeCateogryList> incomeCateogryList = [];
	List<AnalysisChatExpensesCateogryList> expensesCateogryList = [];

	AnalysisChatModel();

	factory AnalysisChatModel.fromJson(Map<String, dynamic> json) => $AnalysisChatModelFromJson(json);

	Map<String, dynamic> toJson() => $AnalysisChatModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnalysisChatTrendList {
	double income = 0;
	double expenses = 0;
	String dateTime = '';

	AnalysisChatTrendList();

	factory AnalysisChatTrendList.fromJson(Map<String, dynamic> json) => $AnalysisChatTrendListFromJson(json);

	Map<String, dynamic> toJson() => $AnalysisChatTrendListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnalysisChatIncomeCateogryList {
	String name = '';
	String rate = '';
	int count = 0;
	String icon = '';
	String categoryIcon = '';
	double totalAmount = 0;

	AnalysisChatIncomeCateogryList();

	factory AnalysisChatIncomeCateogryList.fromJson(Map<String, dynamic> json) => $AnalysisChatIncomeCateogryListFromJson(json);

	Map<String, dynamic> toJson() => $AnalysisChatIncomeCateogryListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AnalysisChatExpensesCateogryList {
	String name = '';
	String rate = '';
	int count = 0;
	String icon = '';
	String categoryIcon = '';
	double totalAmount = 0;

	AnalysisChatExpensesCateogryList();

	factory AnalysisChatExpensesCateogryList.fromJson(Map<String, dynamic> json) => $AnalysisChatExpensesCateogryListFromJson(json);

	Map<String, dynamic> toJson() => $AnalysisChatExpensesCateogryListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}