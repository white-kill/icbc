import 'package:cbc/pages/bill_of_range/bill_of_range_view.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'bill_loading_logic.dart';
import 'bill_loading_state.dart';

class BillLoadingPage extends StatelessWidget {
  BillLoadingPage({super.key});

  final BillLoadingLogic logic = Get.put(BillLoadingLogic());
  final BillLoadingState state = Get.find<BillLoadingLogic>().state;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 100),
        duration: const Duration(milliseconds: 2000),
        onEnd: () => Get.off(() => BillOfRangePage()),
        builder: (context, value, child) {
          logic.isLoading.value = value.toInt();
          return Obx(() {
            return Stack(
              children: [
                Image(
                  image: 'bg_bill_loading'.png3x,
                  width: 1.sw,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 354.w,
                  left: 170.w,
                  child: BaseText(
                    text: '${logic.isLoading.value}%',
                    fontSize: 19.w,
                    color: const Color(0xFF882222),
                  ),
                ),
                Positioned(
                  top: 45.w,
                  right: 16.w,
                  child: Image(
                    image: 'ic_bill_screen_close'.png3x,
                    width: 34.w,
                  ).withOnTap(onTap: () => Get.back()),
                ),
              ],
            );
          });
        });
  }
}
