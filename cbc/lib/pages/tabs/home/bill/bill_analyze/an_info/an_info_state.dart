import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../../config/model/category_data_model.dart';

class An_infoState {

  RefreshController refreshController = RefreshController();
  ScrollController controller = ScrollController();

  int pageNum = 1;
  String dateTime = '';
  String endPageTime = '';
  String name = '';



  CategoryDataModel itemModel = CategoryDataModel();
  List<CategoryDataList> list = [];
  An_infoState() {
    ///Initialize variables
  }
}
