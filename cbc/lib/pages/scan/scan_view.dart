import 'package:cbc/config/app_config.dart';
import 'package:cbc/pages/other/web_view/web_view_view.dart';
import 'package:cbc/pages/scan/scan_an2_widget.dart';
import 'package:cbc/pages/scan/scan_an_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../routes/app_pages.dart';
import 'scan_logic.dart';
import 'scan_state.dart';

class ScanPage extends BaseStateless {
  ScanPage({super.key});

  final ScanLogic logic = Get.put(ScanLogic());
  final ScanState state = Get.find<ScanLogic>().state;

  @override
  Widget? get titleWidget => BaseText(
        text: '扫一扫',
        fontSize: 17.w,
        color: Colors.white,
      );

  // @override
  // List<Widget>? get rightAction => [
  //   Container(
  //     alignment: Alignment.center,
  //     padding: EdgeInsets.only(right: 16.w),
  //     child: BaseText(text: '相册',color: Colors.white,fontSize: 15.sp,),
  //   )
  // ];

  @override
  bool get isChangeNav => true;

  @override
  Widget? get leftItem => Container(
        padding: EdgeInsets.symmetric(vertical: 12.w),
        child: Image(
          image: 'ic_left_back'.png3x,
          color: Colors.white,
        ),
      ).withOnTap(onTap: () => Get.back());

  void onQRViewCreated(QRViewController controller) {
    state.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // (scanData.code ?? '').showToast;
      if((scanData.code??'').contains('cbcCode${AppConfig.config.abcLogic.memberInfo.phone}')){
        Get.offAndToNamed(Routes.scanReceiptPage,arguments: {
          'code':scanData.code
        });
      }else if((scanData.code??'') == '/billOfRangeTime'){
        Get.offAndToNamed('/billOfRangeTime');
        // '/billOfRangeTime'.push;
      }else if((scanData.code??'').contains('asmsproxy.icbc-cn.cc/ASMS')){
        Get.offAndToNamed(Routes.wbViewPage,arguments: {
          'title':'用印信息验证',
          'url':scanData.code,
        });
      } else{
        state.controller!.pauseCamera();
        '对不起，您的二维码无法完成解码，请选择其它二维码照片'.dialog(
            title: '提示',
            showCancel: false,
            contentAlign: TextAlign.left,
            sureText: '返回',
            contentStyle: TextStyle(
              fontSize: 14.sp,
              height: 1.8
            ),
            onBack: (v){
          state.controller!.resumeCamera();
        });
      }
    });
  }
  Widget _tagWidget(
    String img,
    String title, {
    double size = 31,
    double fontSize = 13,
    double h = 5,
  }) {
    return Column(
      children: [
        Image(
          image: img.png3x,
          height: size.w,
          width: size.w,
        ),
        SizedBox(height: h.w,),
        BaseText(
          text: title,
          color: Colors.white,
          fontSize: fontSize.sp,
        )
      ],
    );
  }

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = constraints.maxWidth;
                final screenHeight = constraints.maxHeight;
                final scanAreaSize = screenHeight * 0.6;

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    QRView(
                      key: state.qrKey,
                      onQRViewCreated: onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        borderColor: Colors.transparent,
                        borderRadius: 4,
                        borderLength: 20.w,
                        borderWidth: 4,
                        cutOutSize: scanAreaSize,
                      ),
                    ),
                    Positioned(
                        child: Container(
                      width: screenWidth * 0.8,
                      height: 1.sh * 0.5,
                      color: Colors.transparent,
                      child: const Stack(
                        children: [
                          ScanAn2Widget(),
                        ],
                      ),
                    )),
                    Positioned(
                      top: ScreenUtil().statusBarHeight + 44.w,
                      right: 15.w,
                      child: _tagWidget('sys_ar', '点击进行AR识别',
                          size: 28.w, fontSize: 12),
                    ),
                    Positioned(
                        bottom: 115,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _tagWidget('sys_sdt', '手电筒',
                                size: 45.w, fontSize: 15,h: 12),
                            _tagWidget('sys_xc', '相册',
                                size: 45.w, fontSize: 15,h: 12),
                          ],
                        ).withContainer(
                            height: 83.w,
                            padding: EdgeInsets.only(left: 40.w, right: 40.w),
                            width: 1.sw)),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _tagWidget('sys_sfk', '收付款'),
                            _tagWidget('sys_ecx', 'e出行'),
                            _tagWidget('sys_yb', '医保'),
                          ],
                        ).withContainer(height: 80.w, width: 1.sw,
                        padding: EdgeInsets.only(left: 12.w,right: 12.w)
                        ))
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
