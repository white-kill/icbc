class BillReq {
  BillReq({
      this.pageNum = 1,
      this.pageSize = 20,
      this.beginTime = '',
      this.endTime = '',
      this.maxAmount = '',
      this.minAmount = '',
      this.endPageTime = '',
      this.type = '',
      this.transactionType = '',
      this.transactionCurrency = '',
      this.keyword = '',

  });

  BillReq.fromJson(dynamic json) {
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    beginTime = json['beginTime'];
    endTime = json['endTime'];
    maxAmount = json['maxAmount'];
    minAmount = json['minAmount'];
    endPageTime = json['endPageTime'];
    type = json['type'];
    transactionType = json['transactionType'];
    transactionCurrency = json['transactionCurrency'];
    keyword = json['keyword'];

  }
  int pageNum = 1;
  int pageSize = 20;
  String beginTime = '';
  String endTime = '';
  String maxAmount = '';
  String minAmount = '';
  String endPageTime = '';
  String type = '';
  String transactionType = '';
  String transactionCurrency = '';
  String keyword = '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pageNum'] = pageNum;
    map['pageSize'] = pageSize;
    map['beginTime'] = beginTime;
    map['endTime'] = endTime;
    map['maxAmount'] = maxAmount;
    map['minAmount'] = minAmount;
    map['endPageTime'] = endPageTime;
    map['type'] = type;
    map['transactionType'] = transactionType;
    map['transactionCurrency'] = transactionCurrency;
    map['keyword'] = keyword;
    return map;
  }

}