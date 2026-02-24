import 'package:cbc/config/model/bill_item_model.dart';
import 'package:cbc/config/model/pay_ment_model.dart';
import 'package:cbc/generated/json/base/json_field.dart';
import 'package:cbc/generated/json/category_data_model.g.dart';
import 'dart:convert';
export 'package:cbc/generated/json/category_data_model.g.dart';

@JsonSerializable()
class CategoryDataModel {
	List<CategoryDataList> list = [];
	int total = 0;
	dynamic pages;
	String incomeTotal = '';
	String expensesTotal = '';
	dynamic customizeParam;

	CategoryDataModel();

	factory CategoryDataModel.fromJson(Map<String, dynamic> json) => $CategoryDataModelFromJson(json);

	Map<String, dynamic> toJson() => $CategoryDataModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CategoryDataList {
	int id = 0;
	String excerpt = '';
	String amount = '';
	String accountBalance = '';
	String merchantBranch = '';
	String day = '';
	String daily = '';
	String time = '';
	String categoryIcon = '';
	String week = '';
	String type = '';
	String bankCard = '';
	PayMentListBillDetail? billDetail;
	String endPageTime = '';

	CategoryDataList();

	factory CategoryDataList.fromJson(Map<String, dynamic> json) => $CategoryDataListFromJson(json);

	Map<String, dynamic> toJson() => $CategoryDataListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CategoryDataListBillDetail {
	late int id = 0;
	late String bankName = '';
	late String bankCard = '';
	late String excerpt = '';
	late double amount;
	late double accountBalance;
	late String transactionTime = '';
	late String transactionCountry = '';
	late String transactionCurrency = '';
	late String oppositeAccount = '';
	dynamic accountsTime;
	late String merchantBranch = '';
	late String oppositeName = '';
	late int type = 0;
	late String oppositeBankName = '';

	CategoryDataListBillDetail();

	factory CategoryDataListBillDetail.fromJson(Map<String, dynamic> json) => $CategoryDataListBillDetailFromJson(json);

	Map<String, dynamic> toJson() => $CategoryDataListBillDetailToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}