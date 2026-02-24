import 'package:cbc/generated/json/base/json_field.dart';
import 'package:cbc/generated/json/transfer_page_model.g.dart';
import 'dart:convert';
export 'package:cbc/generated/json/transfer_page_model.g.dart';

@JsonSerializable()
class TransferPageModel {
	List<TransferPageList> list = [];
	int total = 0;
	String incomeTotal = '';
	String expensesTotal = '';
	dynamic customizeParam;

	TransferPageModel();

	factory TransferPageModel.fromJson(Map<String, dynamic> json) => $TransferPageModelFromJson(json);

	Map<String, dynamic> toJson() => $TransferPageModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TransferPageList {
	String id = '';
	double amount = 0;
	String oppositeName = '';
	String oppositeAccount = '';
	String icon = '';
	String day = '';
	String daily = '';
	String time = '';
	String week = '';
	String type = '';
	String endPageTime = '';
	TransferPageListBillDetail? billDetail;

	TransferPageList();

	factory TransferPageList.fromJson(Map<String, dynamic> json) => $TransferPageListFromJson(json);

	Map<String, dynamic> toJson() => $TransferPageListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TransferPageListBillDetail {
	String id = '';
	double amount = 0;
	String oppositeBankId = '';
	String transactionTime = '';
	String bankCard = '';
	String bankName = '';
	String oppositeName = '';
	String oppositeAccount = '';
	String icon = '';
	String transactionType = '';
	String transactionChannel = '';
	String oppositeBankName = '';
	String certificateNo = '';
	String merchantBranch = '';
	String serialNumber = '';

	TransferPageListBillDetail();

	factory TransferPageListBillDetail.fromJson(Map<String, dynamic> json) => $TransferPageListBillDetailFromJson(json);

	Map<String, dynamic> toJson() => $TransferPageListBillDetailToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}