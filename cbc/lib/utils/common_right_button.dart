import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../pages/mine_service/mine_service_view.dart';
import '../pages/message_center/message_center_view.dart';
import '../routes/app_pages.dart';
import 'scale_point_widget.dart';

/// 右边按钮类型枚举
enum RightButtonType {
  /// 更多按钮（三个点）
  more,

  /// 关闭按钮（X）
  close,

  /// 搜索按钮
  search,

  /// 客服按钮
  customer,

  /// 消息按钮
  message,

  /// 设置按钮
  setting,

  /// 版本按钮
  version,

  /// 导出按钮
  export,

  /// 分享按钮
  share,

  /// 带标题的图标按钮（图标+文字）
  iconWithTitle,

  /// 自定义按钮
  custom,
}

/// 右边按钮配置类
class RightButtonConfig {
  /// 按钮类型
  final RightButtonType type;

  /// 图标颜色
  final Color? iconColor;

  /// 点击回调
  final VoidCallback? onTap;

  /// 自定义图标路径
  final String? iconPath;

  /// 图标标题（用于iconWithTitle类型）
  final String? title;

  /// 自定义图标尺寸
  final double? iconWidth;
  final double? iconHeight;

  /// 边距
  final double? rightPadding;
  final double? leftPadding;

  /// 更多按钮特有：弹出内容
  final Widget? popupContent;
  final double? popupLeft;
  final double? popupDx;
  final double? popupDy;
  final double? popupWidth;

  /// 自定义按钮widget
  final Widget? customButton;

  /// 跳转路由名称
  final String? routeName;

  /// 路由参数
  final Map<String, dynamic>? routeArguments;

  /// 是否显示标题
  final bool showTitle;

  /// 是否使用 .png 格式（默认使用 .png3x）
  final bool usePng;

  RightButtonConfig({
    required this.type,
    this.iconColor,
    this.onTap,
    this.iconPath,
    this.title,
    this.iconWidth,
    this.iconHeight,
    this.rightPadding,
    this.leftPadding,
    this.popupContent,
    this.popupLeft,
    this.popupDx,
    this.popupDy,
    this.popupWidth,
    this.customButton,
    this.routeName,
    this.routeArguments,
    this.showTitle = true,
    this.usePng = false,
  });
}

/// 通用右边按钮构建器
class CommonRightButton {
  /// 根据配置列表构建右边按钮组
  static List<Widget> build(List<RightButtonConfig> configs) {
    List<Widget> buttons = [];

    for (var config in configs) {
      Widget? button = _buildButton(config);
      if (button != null) {
        buttons.add(button);
      }
    }

    return buttons;
  }

  /// 构建单个按钮
  static Widget? _buildButton(RightButtonConfig config) {
    switch (config.type) {
      case RightButtonType.more:
        return _buildMoreButton(config);
      case RightButtonType.close:
        return _buildCloseButton(config);
      case RightButtonType.search:
        return _buildSearchButton(config);
      case RightButtonType.customer:
        return _buildCustomerButton(config);
      case RightButtonType.message:
        return _buildMessageButton(config);
      case RightButtonType.setting:
        return _buildSettingButton(config);
      case RightButtonType.version:
        return _buildVersionButton(config);
      case RightButtonType.export:
        return _buildExportButton(config);
      case RightButtonType.share:
        return _buildShareButton(config);
      case RightButtonType.iconWithTitle:
        return _buildIconWithTitleButton(config);
      case RightButtonType.custom:
        return _buildCustomButton(config);
    }
  }

  /// 构建更多按钮（三个点）
  static Widget _buildMoreButton(RightButtonConfig config) {
    return ScalePointWidget(
      icColor: config.iconColor ?? const Color(0xFF607483),
      content: config.popupContent,
      left: config.popupLeft,
      dx: config.popupDx,
      dy: config.popupDy,
      width: config.popupWidth,
      image: config.iconPath,
      text: config.showTitle ? config.title : null,
    ).withPadding(
      right: config.rightPadding ?? 6.w,
      left: config.leftPadding ?? 0,
    );
  }

  /// 构建关闭按钮（X）
  static Widget _buildCloseButton(RightButtonConfig config) {
    return Icon(
      Icons.clear,
      color: config.iconColor ?? const Color(0xFF607483),
      size: config.iconWidth ?? 24.w,
    ).withOnTap(onTap: config.onTap ?? () {
      Get.back();
    }).withPadding(
      right: config.rightPadding ?? 16.w,
      left: config.leftPadding ?? 0,
    );
  }

  /// 构建搜索按钮
  static Widget _buildSearchButton(RightButtonConfig config) {
    return Image(
      image: (config.iconPath ?? 'ic_nav_search').png3x,
      width: config.iconWidth ?? 22.w,
      height: config.iconHeight ?? 22.w,
      color: config.iconColor,
    ).withOnTap(
      onTap: config.onTap ?? () {
        if (config.routeName != null) {
          Get.toNamed(config.routeName!, arguments: config.routeArguments);
        } else {
          Routes.searchPage.push;
        }
      },
    ).withPadding(
      right: config.rightPadding ?? 12.w,
      left: config.leftPadding ?? 0,
    );
  }

  /// 构建客服按钮
  static Widget _buildCustomerButton(RightButtonConfig config) {
    return Image(
      image: (config.iconPath ?? 'ic_nav_service').png3x,
      width: config.iconWidth ?? 20.w,
      height: config.iconHeight ?? 20.w,
      color: config.iconColor,
    ).withOnTap(
      onTap: config.onTap ?? () {
        Get.to(() => MineServicePage());
      },
    ).withPadding(
      right: config.rightPadding ?? 20.w,
      left: config.leftPadding ?? 0,
    );
  }

  /// 构建消息按钮
  static Widget _buildMessageButton(RightButtonConfig config) {
    return Image(
      image: (config.iconPath ?? 'right_message').png3x,
      width: config.iconWidth ?? 22.w,
      height: config.iconHeight ?? 22.w,
      color: config.iconColor,
    ).withOnTap(
      onTap: config.onTap ?? () {
        Get.to(() => MessageCenterPage());
      },
    ).withPadding(
      right: config.rightPadding ?? 10.w,
      left: config.leftPadding ?? 0,
    );
  }

  /// 构建设置按钮
  static Widget _buildSettingButton(RightButtonConfig config) {
    return Image(
      image: (config.iconPath ?? 'ic_sz').png3x,
      width: config.iconWidth ?? 20.w,
      height: config.iconHeight ?? 20.w,
      color: config.iconColor,
    ).withOnTap(
      onTap: config.onTap ?? () {
        Routes.setting.push;
      },
    ).withPadding(
      right: config.rightPadding ?? 16.w,
      left: config.leftPadding ?? 0,
    );
  }

  /// 构建版本按钮
  static Widget _buildVersionButton(RightButtonConfig config) {
    return Image(
      image: (config.iconPath ?? 'ic_bbqh').png3x,
      width: config.iconWidth ?? 22.w,
      height: config.iconHeight ?? 22.w,
      color: config.iconColor,
    ).withOnTap(
      onTap: config.onTap ?? () {
        Routes.versionChange.push;
      },
    ).withPadding(
      right: config.rightPadding ?? 10.w,
      left: config.leftPadding ?? 0,
    );
  }

  /// 构建导出按钮
  static Widget _buildExportButton(RightButtonConfig config) {
    return Image(
      image: (config.iconPath ?? 'ic_lsmxdy').png3x,
      width: config.iconWidth ?? 20.w,
      height: config.iconHeight ?? 20.w,
      color: config.iconColor,
    ).withOnTap(
      onTap: config.onTap ?? () {
        if (config.routeName != null) {
          Get.toNamed(config.routeName!, arguments: config.routeArguments);
        }
      },
    ).withPadding(
      right: config.rightPadding ?? 16.w,
      left: config.leftPadding ?? 0,
      top: 2.w,
    );
  }

  /// 构建分享按钮
  static Widget _buildShareButton(RightButtonConfig config) {
    return Image(
      image: (config.iconPath ?? 'ic_nav_share').png3x,
      width: config.iconWidth ?? 20.w,
      height: config.iconHeight ?? 20.w,
      color: config.iconColor,
    ).withOnTap(
      onTap: config.onTap ?? () {},
    ).withPadding(
      right: config.rightPadding ?? 20.w,
      left: config.leftPadding ?? 0,
    );
  }

  /// 构建带标题的图标按钮（图标+文字）
  static Widget _buildIconWithTitleButton(RightButtonConfig config) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (config.showTitle) SizedBox(height: 12.w),
        Image(
          image: (config.iconPath ?? 'ic_nav_search').png3x,
          width: config.iconWidth ?? 22.w,
          height: config.iconHeight ?? 22.w,
          color: config.iconColor,
        ),
        if (config.showTitle && config.title != null)
          BaseText(
            text: config.title!,
            style: TextStyle(
              fontSize: 12.sp,
              color: config.iconColor ?? const Color(0xFF607483),
            ),
          ),
      ],
    ).withOnTap(
      onTap: config.onTap ?? () {
        if (config.routeName != null) {
          Get.toNamed(config.routeName!, arguments: config.routeArguments);
        }
      },
    ).withPadding(
      right: config.rightPadding ?? 10.w,
      left: config.leftPadding ?? 0,
    );
  }

  /// 构建自定义按钮
  static Widget _buildCustomButton(RightButtonConfig config) {
    if (config.customButton != null) {
      return config.customButton!;
    }

    if (config.iconPath != null) {
      return Image(
        image: config.usePng ? config.iconPath!.png : config.iconPath!.png3x,
        width: config.iconWidth ?? 20.w,
        height: config.iconHeight ?? 20.w,
        color: config.iconColor,
      ).withOnTap(
        onTap: config.onTap ?? () {},
      ).withPadding(
        right: config.rightPadding ?? 16.w,
        left: config.leftPadding ?? 0,
      );
    }

    return const SizedBox.shrink();
  }

  // ============ 快捷构建方法 ============

  /// 快捷构建关闭按钮
  static Widget closeButton({
    Color? color,
    VoidCallback? onTap,
    double? rightPadding,
  }) {
    return _buildCloseButton(RightButtonConfig(
      type: RightButtonType.close,
      iconColor: color,
      onTap: onTap,
      rightPadding: rightPadding,
    ));
  }

  /// 快捷构建更多按钮（三条横线）
  static Widget moreButton({
    Color? color,
    Widget? popupContent,
    double? popupLeft,
    double? popupDx,
    double? popupDy,
    double? popupWidth,
    double? rightPadding,
  }) {
    return _buildMoreButton(RightButtonConfig(
      type: RightButtonType.more,
      iconColor: color,
      popupContent: popupContent,
      popupLeft: popupLeft,
      popupDx: popupDx,
      popupDy: popupDy,
      popupWidth: popupWidth,
      rightPadding: rightPadding,
    ));
  }

  /// 快捷构建更多按钮（三个点）
  static Widget moreDotsButton({
    Color? color,
    Widget? popupContent,
    double? popupLeft,
    double? popupDx,
    double? popupDy,
    double? popupWidth,
    double? rightPadding,
  }) {
    return _buildMoreButton(RightButtonConfig(
      type: RightButtonType.more,
      iconColor: color,
      iconPath: 'ic_nav_more',
      popupContent: popupContent,
      popupLeft: popupLeft ?? 112.w,
      popupDx: popupDx ?? 48.w,
      popupDy: popupDy ?? -6.w,
      popupWidth: popupWidth ?? 132.w,
      rightPadding: rightPadding,
    ));
  }

  /// 快捷构建搜索按钮
  static Widget searchButton({
    Color? color,
    VoidCallback? onTap,
    String? routeName,
    double? rightPadding,
  }) {
    return _buildSearchButton(RightButtonConfig(
      type: RightButtonType.search,
      iconColor: color,
      onTap: onTap,
      routeName: routeName,
      rightPadding: rightPadding,
    ));
  }

  /// 快捷构建客服按钮
  static Widget customerButton({
    Color? color,
    VoidCallback? onTap,
    double? rightPadding,
  }) {
    return _buildCustomerButton(RightButtonConfig(
      type: RightButtonType.customer,
      iconColor: color,
      onTap: onTap,
      rightPadding: rightPadding,
    ));
  }

  /// 快捷构建消息按钮
  static Widget messageButton({
    Color? color,
    VoidCallback? onTap,
    double? rightPadding,
  }) {
    return _buildMessageButton(RightButtonConfig(
      type: RightButtonType.message,
      iconColor: color,
      onTap: onTap,
      rightPadding: rightPadding,
    ));
  }

  /// 快捷构建设置按钮
  static Widget settingButton({
    Color? color,
    VoidCallback? onTap,
    double? rightPadding,
  }) {
    return _buildSettingButton(RightButtonConfig(
      type: RightButtonType.setting,
      iconColor: color,
      onTap: onTap,
      rightPadding: rightPadding,
    ));
  }

  /// 快捷构建版本按钮
  static Widget versionButton({
    Color? color,
    VoidCallback? onTap,
    Map<String, dynamic>? routeArguments,
    double? rightPadding,
  }) {
    return _buildVersionButton(RightButtonConfig(
      type: RightButtonType.version,
      iconColor: color,
      onTap: onTap,
      routeArguments: routeArguments,
      rightPadding: rightPadding,
    ));
  }

  /// 快捷构建导出按钮
  static Widget exportButton({
    Color? color,
    VoidCallback? onTap,
    String? routeName,
    double? rightPadding,
  }) {
    return _buildExportButton(RightButtonConfig(
      type: RightButtonType.export,
      iconColor: color,
      onTap: onTap,
      routeName: routeName,
      rightPadding: rightPadding,
    ));
  }

  /// 快捷构建分享按钮
  static Widget shareButton({
    Color? color,
    VoidCallback? onTap,
    double? rightPadding,
  }) {
    return _buildShareButton(RightButtonConfig(
      type: RightButtonType.share,
      iconColor: color,
      onTap: onTap,
      rightPadding: rightPadding,
    ));
  }

  /// 快捷构建带标题的图标按钮
  static Widget iconWithTitleButton({
    required String iconPath,
    required String title,
    Color? color,
    VoidCallback? onTap,
    String? routeName,
    double? rightPadding,
    bool showTitle = true,
  }) {
    return _buildIconWithTitleButton(RightButtonConfig(
      type: RightButtonType.iconWithTitle,
      iconPath: iconPath,
      title: title,
      iconColor: color,
      onTap: onTap,
      routeName: routeName,
      rightPadding: rightPadding,
      showTitle: showTitle,
    ));
  }
}

