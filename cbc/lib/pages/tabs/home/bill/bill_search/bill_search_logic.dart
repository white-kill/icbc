import 'package:get/get.dart';

import '../../../../../utils/sp_util.dart';
import 'bill_search_state.dart';

class Bill_searchLogic extends GetxController {
  final Bill_searchState state = Bill_searchState();
  List tagList = [];

  @override
  void onInit() {
    super.onInit();
    tagList = searchHistoryValue.split(',');
  }
}
