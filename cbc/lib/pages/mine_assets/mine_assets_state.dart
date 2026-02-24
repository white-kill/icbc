import 'package:common_utils/common_utils.dart';

class MineAssetsState {
  String time = '';


  List otherListNames = [
    '数字人名币',
    '保险',
    '第三方存管',
  ];
  MineAssetsState() {
    ///Initialize variables

    time =  DateUtil.formatDate(DateTime.now(), format:DateFormats.full);

  }
}
