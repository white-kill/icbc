import 'package:common_utils/common_utils.dart';
import 'package:intl/intl.dart';

class Hunkuan_infoState {
  List titleNameList = [];
  DateFormat dateFormat = DateFormat('yyyy.MM.dd HH:mm:ss');
  String time ='';

  Hunkuan_infoState() {
    ///Initialize variables

    titleNameList = [
      '收款账号',
      '收款银行',
      '',
      '交易时间',
      '付款账号',
      '付款银行',
      '交易渠道',
      '汇款附言',
      '',
      '汇款方式',
      '币种',
      '钞汇标志',
      '手续费*',
      '是否抵扣套餐',
      '',
    ];

    time =  DateUtil.formatDate(DateTime.now(), format:DateFormats.full).replaceAll('-', '.');

  }
}
