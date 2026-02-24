import 'package:cbc/generated/json/base/json_field.dart';
import 'package:cbc/generated/json/bill_item_model.g.dart';
import 'dart:convert';
export 'package:cbc/generated/json/bill_item_model.g.dart';

@JsonSerializable()
class BillItemModel {
	List<BillItemList> list = [];
	int total = 0;
	String incomeTotal = '';
	String expensesTotal = '';
	dynamic customizeParam;

	BillItemModel();

	factory BillItemModel.fromJson(Map<String, dynamic> json) => $BillItemModelFromJson(json);

	Map<String, dynamic> toJson() => $BillItemModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BillItemList {
	int id = 0;
	String excerpt = '';
	String amount = '0';
	String accountBalance = '';
	String merchantBranch = '';
	String day = '';
	String daily = '';
	String time = '';
	String week = '';
	String type = '';
	String bankCard = '';
	BillItemListBillDetail? billDetail;
	String endPageTime = '';

	BillItemList();

	factory BillItemList.fromJson(Map<String, dynamic> json) => $BillItemListFromJson(json);

	Map<String, dynamic> toJson() => $BillItemListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BillItemListBillDetail {
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
	String type = '';
	String oppositeBankName = '';

	BillItemListBillDetail();

	factory BillItemListBillDetail.fromJson(Map<String, dynamic> json) => $BillItemListBillDetailFromJson(json);

	Map<String, dynamic> toJson() => $BillItemListBillDetailToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}