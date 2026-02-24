import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'web_view_logic.dart';
import 'web_view_state.dart';

class WebViewPage extends BaseStateless {
  WebViewPage({Key? key}) : super(key: key,title: Get.arguments?['title']??'详情');

  final WebViewLogic logic = Get.put(WebViewLogic());
  final WebViewState state = Get.find<WebViewLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: WebUri(logic.url)),
      onWebViewCreated: (controller) {
        state.webViewController = controller;
      },
      onLoadStart: (controller, url) {
        // 页面开始加载
      },
      onLoadStop: (controller, url) {
        // 页面加载完成
      },
    );
  }
}
