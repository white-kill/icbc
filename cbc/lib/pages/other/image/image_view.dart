import 'package:cbc/routes/app_pages.dart';
import 'package:cbc/utils/comm_widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'image_logic.dart';
import 'image_state.dart';

class ImagePage extends BaseStateless {
  ImagePage({
    super.key,
    super.title,
    this.navBarColor = Colors.white,
    this.navTitleColor = Colors.black,
    this.defNavTitleColor = const Color(0xFF607483),
    this.bg = const Color(0xFFF4F5F7),
    this.navBackColor = const Color(0xFF5B6A80),
    this.image = '',
    this.jpg = false,
    this.top = 0,
    this.right = true,
    this.isShare = false,
    this.navChange = false,
    this.noBackGround2 = true,
    this.rightStrBtn = '',
    this.onRightStrBtnClick,
  });

  final Color navBarColor;
  final Color navTitleColor;
  final Color defNavTitleColor;
  final Color bg;
  final Color navBackColor;
  final String image;
  final bool jpg;
  final double top;
  final bool right;
  final bool isShare;
  final bool navChange;
  final String rightStrBtn;
  final bool noBackGround2;
  final VoidCallback? onRightStrBtnClick;

  final ImageLogic logic = Get.put(ImageLogic());
  final ImageState state = Get.find<ImageLogic>().state;

  @override
  Color? get navColor => navBarColor;

  @override
  Color? get titleColor => navTitleColor;

  @override
  Color? get background => bg;

  @override
  Color? get backColor => navBackColor;

  @override
  bool get isChangeNav => navChange;

  @override
  bool get noBackGround1 => noBackGround2;

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
        logic.navActionColor.value = v ? navTitleColor : Colors.black;
      };

  @override
  Widget? get titleWidget => Obx(() => BaseText(
        text: title ?? '',
        fontSize: 17.w,
        color: logic.navActionColor.value,
      ));

  @override
  Widget? get leftItem => Obx(() => Container(
        padding: EdgeInsets.symmetric(vertical: 12.w),
        child: Image(
            image: 'ic_left_back'.png3x,
            color:
            logic.navActionColor.value),
      ).withOnTap(onTap: () => Get.back()));

  @override
  List<Widget>? get rightAction => [
        right && !isShare
            ? Obx(
                () => Image(
                  image: 'ic_nav_service'.png3x,
                  width: 20.w,
                  height: 20.w,
                  color: logic.navActionColor.value,
                )
                    .withPadding(right: 20.w)
                    .withOnTap(onTap: () => Routes.mineService.push),
              )
            : const SizedBox.shrink(),
        right && isShare
            ? Obx(
                () => Image(
                  image: 'ic_nav_share'.png3x,
                  width: 20.w,
                  height: 20.w,
                  color: logic.navActionColor.value,
                ).withPadding(right: 20.w),
              )
            : const SizedBox.shrink(),
        right
            ? Obx(
                () => CommWidgetUtils.getMoreIcon(
                    icColor: logic.navActionColor.value),
              )
            : const SizedBox.shrink(),
        rightStrBtn.isNotEmpty
            ? Obx(
                () => BaseText(
                  text: rightStrBtn,
                  style: TextStyle(
                    height: 34 / 14,
                    fontSize: 14.w,
                    color: logic.navActionColor.value,
                  ),
                )
                    .withPadding(right: 18.w)
                    .withOnTap(onTap: () => onRightStrBtnClick?.call()),
              )
            : const SizedBox.shrink(),
      ];

  @override
  Widget initBody(BuildContext context) {
    logic.navActionColor.value = defNavTitleColor;
    return ListView(
      padding: EdgeInsets.only(top: top.toDouble()),
      children: [
        if (image != '')
          Image(
            image: jpg ? image.jpg3x : image.png3x,
            fit: BoxFit.fitWidth,
            width: 1.sw,
          )
      ],
    );
  }
}
