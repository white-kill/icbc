import 'package:common_utils/common_utils.dart';
import 'package:intl/intl.dart';

class ReceiptState {

  List titleNames = [
    'top',
    '收款户名',
    '收款卡号',
    '收款银行',
    '收款金额',
    '手续费',
    '合计',
    '',
    '付款户名',
    '付款卡号',
    '付款银行',
    '',
    '回单编号',
    '指令序号',
    '交易时间',
    '附言',
    'bottom'
  ];

  DateFormat dateFormat = DateFormat('yyyy.MM.dd HH:mm:ss');
  String time ='';
  ReceiptState() {
    ///Initialize variables
    time =  DateUtil.formatDate(DateTime.now(), format:DateFormats.full).replaceAll('-', '.');
  }
}
