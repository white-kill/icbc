import 'package:get/get.dart';

class WealthState {
  late List<Map<String,String>> dataList;
  var t1Index = 0.obs;
  var t2Index = 0.obs;
  WealthState() {
    dataList=[
      {"col1":"上证指数","col2":"3590.83 -0.41%","col3":"沪深300","col4":"4125.21 -0.58%"},
      {"col1":"中证500","col2":"6554.24 -0.26%","col3":"中证1000","col4":"6654.58 -0.36%"},
      {"col1":"工银配置","col2":"1727.11 +0.11%","col3":"工银混股","col4":"2154.84 +0.18%"},
    ];
  }
}
