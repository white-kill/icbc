import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../config/dio/network.dart';
import '../../../../../../config/model/category_data_model.dart';
import '../../../../../../config/net_config/apis.dart';
import '../bill_analyze_state.dart';
import 'an_info_state.dart';

class An_infoLogic extends GetxController {
  final An_infoState state = An_infoState();

  SalesData? data;


  @override
  void onInit() {
    super.onInit();
    data = Get.arguments?['model'];
    state.name = data?.title??'';
    state.dateTime = Get.arguments?['time']??DateFormat('yyyy-MM').format(DateTime.now());
    getData();
  }

  void getData(){

    var data1 = {
      'pageNum':state.pageNum,
      'pageSize':20,
      'dateTime':state.dateTime,
      'endPageTime':state.endPageTime,
      'name':state.name,
    };
    print(data1);

    Http.get(Apis.monthBilCategoryList,queryParameters: data1).then((v){
      state.itemModel = CategoryDataModel.fromJson(v);

      state.list = state.list + state.itemModel.list;

      state.refreshController.loadComplete();
      if (!state.itemModel.list.isNotEmpty) {
        state.refreshController.loadNoData();
      }
      state.endPageTime = state.itemModel.list.last.endPageTime;
      if (state.pageNum == 1) {
        state.list = state.itemModel.list;
      } else {
        state.list = state.list + state.itemModel.list;
      }

      update(['updateUI']);
    });


  }
}
