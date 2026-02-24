import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import 'search_content_state.dart';

class Search_contentLogic extends GetxController {
  final Search_contentState state = Search_contentState();

  String content = '';

  int index = 0;

  @override
 void onInit(){
    super.onInit();

    content = Get.arguments?['name']??'';

    state.controller.text = content;
  }

  String image1(){
    if(content == '查询明细') return 'xcmx1';
    if(content == '我的明细') return 'wdmx1';
    if(content == '办理进度') return 'bljd1';
    if(content == '明细打印') return 'mxdy1';
    return 'cxmx1';
  }

  String image2(){
    if(content == '查询明细') return 'xcmx2';
    if(content == '我的明细') return 'wdmx2';
    if(content == '办理进度') return 'mljd2';
    if(content == '明细打印') return 'mxdy2';
    return 'cxmx2';
  }
  void jumpPage(int index){
    if(content == '查询明细') {
      if(index == 1){
        Routes.accountDetailPage.push;
      }
      if(index == 2){
        Routes.billPage.push;
      }
      if(index == 3){
        Routes.accountDetailPage.push;
      }
    }
    if(content == '我的明细'){
      if(index == 1){
        Routes.accountDetailPage.push;
      }
      if(index == 2){
        Routes.billPage.push;
      }
      if(index == 3){
        Routes.printPage.push;
      }
    }
    if(content == '办理进度'){
      if(index == 1){
        Routes.printProgressPage.push;
      }
      if(index == 2){}
      if(index == 3){}
    }
    if(content == '明细打印') {
      if(index == 1){
        Routes.printPage.push;
      }
      if(index == 2){
        Routes.cardTransferPage.push;
      }
      if(index == 3){
        Routes.accountDetailPage.push;
      }
    }
  }
}
