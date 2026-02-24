import '../Req_data.dart';

class More_queryState {
  List titleNames = [
    '收支类别',
    'tag',
    '起始时间',
    '截止时间',
    'bottom',
  ];

  List tagNames = [
    '本日',
    '近1周',
    '近1月',
    '近3月',
    '近6月',
  ];

  ReqBillData moreData = ReqBillData();

  More_queryState() {
    ///Initialize variables
  }
}
