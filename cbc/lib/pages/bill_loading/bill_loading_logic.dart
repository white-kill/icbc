import 'package:get/get.dart';

import 'bill_loading_state.dart';

class BillLoadingLogic extends GetxController {
  var isLoading = 0.obs;
  final BillLoadingState state = BillLoadingState();
}
