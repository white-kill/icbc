import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../../config/model/progress_list_model.dart';

class PrintProgressState {
  RefreshController refreshController = RefreshController();
  ScrollController controller = ScrollController();

  int pageNum = 1;

  ProgressListModel progressModel =  ProgressListModel();
  List<ProgressListList> list = [];

  List titleName = [
    '待提交',
    '',
    '未完成',
    '',
    '已完成',
    '',
    '待评价',
  ];
  PrintProgressState() {
    ///Initialize variables
  }
}
