class ReqBillData {
  ReqBillData({
      this.beginTime = '',
      this.endTime = '',
      this.endPageTime = '',
      this.pageNum = 1,
      this.pageSize = 20,
      this.type = '',});

  ReqBillData.fromJson(dynamic json) {
    beginTime = json['beginTime'];
    endTime = json['endTime'];
    endPageTime = json['maxAmount'];
    pageNum = json['pageNum'];
    pageSize = json['pageSize'];
    type = json['type'];
  }
  String beginTime = '';
  String endTime = '';
  int pageNum = 1;
  int pageSize = 10;
  String endPageTime = '';
  String type = '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['beginTime'] = beginTime;
    map['endTime'] = endTime;
    map['pageNum'] = pageNum;
    map['pageSize'] = pageSize;
    map['endPageTime'] = endPageTime;
    map['type'] = type;
    return map;
  }

}