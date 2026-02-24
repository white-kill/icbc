import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import '../face/face_view.dart';

class PreFacePage extends BaseStateless {
  PreFacePage({Key? key}) : super(key: key, title: '身份认证');

  @override
  Widget initBody(BuildContext context) {
    return Image.asset(
      'assets/images/face_1.png',
      fit: BoxFit.cover,
      width: 1.sw,
      height: 1.sh,
    ).withOnTap(onTap: () async {
      await Get.to(() => FacePage());
      Get.back();
    });
  }
}

