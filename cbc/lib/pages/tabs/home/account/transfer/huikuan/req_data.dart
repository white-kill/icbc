class ReqTransferData {
  ReqTransferData({
      this.beginTime = '',
      this.endTime = '',
      this.endPageTime = '',
      this.pageNum = 1,
      this.pageSize = 20,
      this.type = '',
      this.keyword = '',
      this.currency = '',
      this.transactionChannel = '',
      this.maxAmount = '',
      this.minAmount = '',
  });

  ReqTransferData.fromJson(dynamic json) {
    beginTime = json['beginTime'];
    endTime = json['endTime'];
    endPageTime = json['maxAmount'];
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    type = json['type'];
    keyword = json['keyword'];
    currency = json['currency'];
    transactionChannel = json['transactionChannel'];
    maxAmount = json['maxAmount'];
    minAmount = json['minAmount'];
  }
  String beginTime = '';
  String endTime = '';
  int pageNum = 1;
  int pageSize = 20;
  String endPageTime = '';
  String type = '';
  String keyword = '';
  String currency = '';
  String transactionChannel = '';
  String minAmount = '';
  String maxAmount = '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['beginTime'] = beginTime;
    map['endTime'] = endTime;
    map['pageNum'] = pageNum;
    map['pageSize'] = pageSize;
    map['endPageTime'] = endPageTime;
    map['type'] = type;
    map['keyword'] = keyword;
    map['currency'] = currency;
    map['transactionChannel'] = transactionChannel;
    map['minAmount'] = minAmount;
    map['maxAmount'] = maxAmount;
    return map;
  }

}