import 'dart:convert';

import 'package:cbc/config/model/progress_list_model.dart';
import 'package:get/get.dart';

import '../../../../../../config/dio/network.dart';
import '../../../../../../config/net_config/apis.dart';
import 'print_progress_state.dart';

class PrintProgressLogic extends GetxController {
  final PrintProgressState state = PrintProgressState();

  String selectTypeName = '已完成';

  @override
  void onInit() {
    super.onInit();
    getData();
  }


  Future getData() async{
    await Http.get(
        Apis.applyPageList,
        queryParameters: {
          'pageSize':'20',
          'pageNum':state.pageNum,
          'status':'2',
        },
        isLoading: state.pageNum == 1
    ).then((v) {
      // String jsonString = jsonEncode(v['list'][0]['detail']);
      // print(jsonString);
      state.progressModel = ProgressListModel.fromJson(v);
      state.refreshController.loadComplete();
      if (!state.progressModel.list.isNotEmpty) {
        state.refreshController.loadNoData();
      }
      if(state.pageNum == 1){
        state.list = state.progressModel.list;
      }else{
        state.list = state.list + state.progressModel.list;
      }

      update(['updateUI','updateTop']);
    });
  }


  String countStr(String name){
    if(name == '已完成') return '(${state.list.length})';
    return '(0)';
  }
}
