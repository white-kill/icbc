import 'package:get/get.dart';

import 'web_view_state.dart';

class WebViewLogic extends GetxController {
  final WebViewState state = WebViewState();
  String url = '';

  @override
  void onInit() {
    super.onInit();
    url = (Get.arguments?['url']??'https://asmsproxy.icbc-cn.cc/ASMS/asms/codechk/index.html?ywyzm=AA44935F5026&jbys=2025-09-16&dqh=2902&jyrq=2025-09-16&dysj=10:10:20&kh=6222032902007773743&zc=3,279.64&sr=0.00&hm=%E7%8E%8B%E8%95%8A');
  }
}
