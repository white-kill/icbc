import 'package:cbc/generated/json/base/json_field.dart';
import 'package:cbc/generated/json/pay_ment_model.g.dart';
import 'dart:convert';
export 'package:cbc/generated/json/pay_ment_model.g.dart';

@JsonSerializable()
class PayMentModel {
	List<PayMentList> list = [];
	int total = 0;
	String incomeTotal = '';
	String expensesTotal = '';
	dynamic customizeParam;

	PayMentModel();

	factory PayMentModel.fromJson(Map<String, dynamic> json) => $PayMentModelFromJson(json);

	Map<String, dynamic> toJson() => $PayMentModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PayMentList {
	int id = 0;
	String excerpt = '';
	String amount = '';
	String accountBalance = '';
	String categoryIcon = '';
	String merchantBranch = '';
	String day = '';
	String daily = '';
	String time = '';
	String week = '';
	String type = '';
	String bankCard = '';
	PayMentListBillDetail? billDetail;
	double incomeTotal = 0;
	double expensesTotal = 0;
	String endPageTime = '';

	PayMentList();

	factory PayMentList.fromJson(Map<String, dynamic> json) => $PayMentListFromJson(json);

	Map<String, dynamic> toJson() => $PayMentListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PayMentListBillDetail {
	int id = 0;
	String bankName = '';
	String bankCard = '';
	String excerpt = '';
	double amount = 0;
	double accountBalance = 0;
	String transactionTime = '';
	String transactionCountry = '';
	String transactionCurrency = '';
	String oppositeAccount = '';
	String accountsTime = '';
	String merchantBranch = '';
	String oppositeName = '';
	String icon = '';
	String type = '';
	String oppositeBankName = '';

	PayMentListBillDetail();

	factory PayMentListBillDetail.fromJson(Map<String, dynamic> json) => $PayMentListBillDetailFromJson(json);

	Map<String, dynamic> toJson() => $PayMentListBillDetailToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}