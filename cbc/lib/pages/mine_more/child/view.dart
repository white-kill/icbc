import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'logic.dart';
import 'state.dart';

class CpzjPage extends BaseStateless {
  CpzjPage({Key? key}) : super(key: key, title: "产品足迹");

  final CpzjLogic logic = Get.put(CpzjLogic());
  final CpzjState state = Get.find<CpzjLogic>().state;

  @override
  Widget initBody(BuildContext context) {
    // TODO: implement initBody
    return GetBuilder<CpzjLogic>(builder: (logic) {
      if (logic.index == 0) {
        return Stack(
          children: [
            Image(image: 'cpzj_1'.png),
            Positioned(
                child: Row(
              children: [
                Expanded(child: Container().withOnTap(onTap: () {
                  logic.index = 0;
                  logic.update();
                })),
                Expanded(child: Container().withOnTap(onTap: () {
                  logic.index = 1;
                  logic.update();
                })),
                Expanded(child: Container().withOnTap(onTap: () {
                  logic.index = 2;
                  logic.update();
                })),
              ],
            ))
          ],
        );
      } else if (logic.index == 1) {
        return Stack(
          children: [
            Image(image: 'cpzj_2'.png),
            Positioned(
                child: Row(
                  children: [
                    Expanded(child: Container().withOnTap(onTap: () {
                      logic.index = 0;
                      logic.update();
                    })),
                    Expanded(child: Container().withOnTap(onTap: () {
                      logic.index = 1;
                      logic.update();


                    })),
                    Expanded(child: Container().withOnTap(onTap: () {
                      logic.index = 2;
                      logic.update();
                    })),
                  ],
                ))
          ],
        );
      } else {
        return Stack(
          children: [
            Image(image: 'cpzj_3'.png),
            Positioned(
                child: Row(
                  children: [
                    Expanded(child: Container().withOnTap(onTap: () {
                      logic.index = 0;
                      logic.update();
                    })),
                    Expanded(child: Container().withOnTap(onTap: () {
                      logic.index = 1;
                      logic.update();
                    })),
                    Expanded(child: Container().withOnTap(onTap: () {
                      logic.index = 2;
                      logic.update();
                    })),
                  ],
                ))
          ],
        );      }
    });
  }
}
