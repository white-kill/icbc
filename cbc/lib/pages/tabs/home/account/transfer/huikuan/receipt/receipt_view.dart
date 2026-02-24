import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:cbc/config/abc_config/cbc_logic.dart';
import 'package:cbc/config/app_config.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:cbc/utils/long_press_five_seconds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:scroll_screenshot/scroll_screenshot.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';
import 'dart:ui' as ui;

import '../../../component/kh_wd.dart';
import 'receipt_logic.dart';
import 'receipt_state.dart';

class ReceiptPage extends BaseStateless {
  ReceiptPage({Key? key}) : super(key: key, title: '电子回单');

  final ReceiptLogic logic = Get.put(ReceiptLogic());
  final ReceiptState state = Get.find<ReceiptLogic>().state;

  @override
  Color? get background => Colors.white;

  @override
  bool get bottomInset => false;

  @override
  Widget initBody(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          height: 0.8.w,
          color: const Color(0xffE9E9E9),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: RepaintBoundary(
              key: logic.screenshotKey,
              child: Column(
                children: <Widget>[
                  WatermarkWidget(
                    watermarkImagePath: 'assets/images/gs_r1.png',
                    watermarkText:
                        '${AppConfig.config.abcLogic.realName()}   中国工商银行 ${state.time}',
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        String name = state.titleNames[index];

                        bool red =
                            name == '收款金额' || name == '手续费' || name == '合计';
                        if (name == 'top') {
                          return SizedBox(
                            height: 50.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image(
                                      image: 'ic_cbc'.png3x,
                                      width: 156.w,
                                      height: 20.w,
                                    ),
                                    BaseText(
                                      text: '境内汇款电子回单',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xFF607483),
                                      ),
                                    )
                                  ],
                                )
                                    .withPadding(left: 16.w, right: 16.w)
                                    .expanded(),
                                Container(
                                  width: 1.sw,
                                  height: 0.8.w,
                                  color: const Color(0xffE9E9E9),
                                ),
                              ],
                            ),
                          );
                        }
                        if (name == 'bottom') {
                          return Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  BaseText(
                                    text: '重要提示:本回单不作为收款方发货依据，并请勿重复记账',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xFF607483),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.w,
                                  ),
                                  BaseText(
                                    text: '手机银行跨行汇款、跨行信用卡还款免收手续费',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: BColors.mainColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.w,
                                  ),
                                  GetBuilder(
                                    builder: (ReceiptLogic c) {
                                      return logic.qrImage == null
                                          ? SizedBox(
                                              width: 120.w,
                                              height: 120.w,
                                            )
                                          : PrettyQrView(
                                              qrImage: logic.qrImage!,
                                            ).withContainer(
                                              width: 120.w, height: 120.w);
                                    },
                                    id: 'code',
                                  ),
                                  SizedBox(
                                    height: 6.w,
                                  ),
                                  BaseText(
                                    text: '使用手机银行-扫一扫功能即可轻松验证电子回单',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xFF607483),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.w,
                                  ),
                                  BaseText(
                                    text: '来自 中国工商银行手机银行',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xFF607483),
                                    ),
                                  ).withContainer(
                                      width: 1.sw,
                                      padding: EdgeInsets.only(right: 12.w),
                                      alignment: Alignment.centerRight),
                                  SizedBox(
                                    height: 60.w,
                                  ),
                                ],
                              ).withContainer(
                                  width: 1.sw,
                                  padding: EdgeInsets.only(top: 92.w)),
                              Positioned(
                                  top: 0,
                                  right: 25.w,
                                  child: Image(
                                    image: 'zdhd_z'.png,
                                    width: 110.w,
                                    height: 110.w,
                                  ))
                            ],
                          );
                        }
                        if (name == '') {
                          return Column(
                            children: [
                              Container(
                                height: 15.w,
                              ),
                              Container(
                                width: 1.sw,
                                height: 0.8.w,
                                color: const Color(0xffE9E9E9),
                              ),
                              Container(
                                height: 15.w,
                              ),
                            ],
                          );
                        }
                        return Container(
                          padding: EdgeInsets.only(
                            left: 12.w,
                            top: 6.w,
                            bottom: 8.w,
                            right: 12.w,
                          ),
                          child: Row(
                            children: [
                              BaseText(
                                text: name,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Color(0xFF607483),
                                ),
                              ).withContainer(
                                  width: 100.w,
                                  alignment: Alignment.centerRight),
                              SizedBox(
                                width: 40.w,
                              ),
                              GetBuilder(
                                builder: (ReceiptLogic c) {
                                  return LongPressFiveSeconds(
                                      child: BaseText(
                                        text: logic.valueStr(name),
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: red
                                                ? BColors.mainColor
                                                : Color(0xff333333)),
                                      ),
                                      onLongPressCompleted: () {
                                        if(name == '回单编号' || name == '指令序号'){
                                          logic.longWidget(name);
                                        }
                                      });
                                },
                                id: 'updateCard',
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: state.titleNames.length,
                    ),
                  ).withContainer(color: Colors.white)
                ],
              ),
            ),
          ),
        ),
        Container(
          width: 1.sw,
          height: 40.w,
          padding: EdgeInsets.only(left: 12.w, right: 12.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 4,
                offset: Offset(4, -1),
              ),
            ],
          ),
          child: Row(
            children: [
              GetBuilder(
                builder: (ReceiptLogic c) {
                  return Image(
                    image:
                        logic.showCard ? 'a_check'.png3x : 'a_un_check'.png3x,
                    width: 20.w,
                    height: 20.w,
                  ).withOnTap(onTap: () {
                    AlterWidget.alterWidget(builder: (context) {
                      return KhWd(
                        callBack: () {
                          SmartDialog.dismiss().then((_) async {
                            logic.showCard = !logic.showCard;
                            logic.update(['updateCard']);
                          });
                        },
                      );
                    });
                  });
                },
                id: 'updateCard',
              ),
              SizedBox(
                width: 4.w,
              ),
              BaseText(
                text: '隐藏付款户名、收付款卡号、手机号、e-mail',
                fontSize: 15.sp,
                color: Color(0xff666666),
              )
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Obx(() => Container(
                  margin: EdgeInsets.only(
                    left: 15.w,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.w)),
                      border: Border.all(
                          color: logic.selTag.value == index
                              ? BColors.mainColor
                              : Colors.white,
                          width: 2.w)),
                  child: Image(
                    image: 'dzhd$index'.png,
                  ),
                ).withOnTap(onTap: () {
                  logic.selTag.value = index;
                }));
          },
          itemCount: 5,
        )
            .withContainer(width: 1.sw, height: 80.w)
            .withContainer(color: Colors.white),
        Stack(
          children: [
            Image(image: 'dzhd_b'.png3x),
            Row(
              children: [
                Container().expanded(),
                Container().expanded(),
                Container().expanded(onTap: () async {
                  ''.showLoading1;
                  String? base64String =
                      await ScrollScreenshot.captureAndSaveScreenshot(
                          logic.screenshotKey);
                  log(base64String!);
                  String cleanedBase64 = base64String;
                  if (base64String.contains(',')) {
                    cleanedBase64 = base64String.split(',').last;
                  }
                  // 解码Base64
                  final Uint8List bytes = base64.decode(cleanedBase64);

                  logic.savePngImage(bytes).then((_) {
                    '保存成功'.showToast;
                  });
                }),
              ],
            ).withContainer(
              width: 1.sw,
              height: 80.w,
            )
          ],
        )
      ],
    );
  }
}

class WatermarkWidget extends StatefulWidget {
  final Widget child;
  final String watermarkImagePath;
  final String watermarkText;
  final double opacity;
  final double angle;

  WatermarkWidget({
    required this.child,
    required this.watermarkImagePath,
    required this.watermarkText,
    this.opacity = 0.2,
    this.angle = -45,
  });

  @override
  _WatermarkWidgetState createState() => _WatermarkWidgetState();
}

class _WatermarkWidgetState extends State<WatermarkWidget> {
  ui.Image? _watermarkImage;

  @override
  void initState() {
    super.initState();
    _loadImage(widget.watermarkImagePath).then((v) {
      setState(() {});
    }); // Load the image when the widget is created
  }

  Future<void> _loadImage(String imagePath) async {
    final ByteData data = await rootBundle.load(imagePath);
    final List<int> bytes = data.buffer.asUint8List();
    final ui.Image image = await decodeImageFromList(Uint8List.fromList(bytes));
    _watermarkImage = image;
  }

  @override
  Widget build(BuildContext context) {
    if (_watermarkImage == null) {
      return widget.child;
    }

    return Stack(
      children: [
        Container(
          width: 1.sw,
          height: 1.sh,
          child: CustomPaint(
            painter: WatermarkPainter(
              watermarkImage: _watermarkImage!,
              watermarkText: widget.watermarkText,
              angle: widget.angle,
            ),
          ),
        ),
        widget.child,
      ],
    );
  }
}

class WatermarkPainter extends CustomPainter {
  final ui.Image watermarkImage;
  final String watermarkText;
  final double angle;
  final double textMaxWidth; // 最大文字宽度

  WatermarkPainter({
    required this.watermarkImage,
    required this.watermarkText,
    required this.angle,
    this.textMaxWidth = 250.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double rotationAngle = angle * 3.1415927 / 180.0;

    // 缓存文本绘制对象
    final textPainter = TextPainter(
      maxLines: 1,
      text: TextSpan(
        text: watermarkText,
        style: TextStyle(
          fontSize: 12,
          color: BColors.mainColor.withOpacity(0.08),
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: textMaxWidth);

    final double width = watermarkImage.width * 0.5;
    final double height = watermarkImage.height * 0.5;
    final double watermarkWidth =
        width > 40.w + textMaxWidth ? width : 40.w + textMaxWidth;
    final double watermarkHeight = height + 20.w;

    // 计算网格的间距和行列数
    final double horizontalSpacing = watermarkWidth * 0.88;
    final double verticalSpacing = watermarkHeight * 1.3;
    final double extendedWidth = size.width * 4.0;
    final double extendedHeight = size.height * 6.0;
    final int rows = (extendedHeight / verticalSpacing).ceil();
    final int cols = (extendedWidth / horizontalSpacing).ceil();

    // 计算水印位置偏移量
    final double offsetX = extendedWidth * 0.25;
    final double offsetY = extendedHeight * 0.33;

    // 开始绘制前，保存画布状态，只进行一次旋转
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(rotationAngle);
    canvas.translate(-size.width / 2, -size.height / 2);

    // 批量绘制水印图片
    Paint imagePaint = Paint();
    for (int i = 0; i <= rows; i++) {
      for (int j = 0; j <= cols; j++) {
        final double x = j * horizontalSpacing - offsetX;
        final double y = i * verticalSpacing - offsetY;

        canvas.save();
        canvas.translate(x, y);

        // 只绘制图片部分，优化文字部分的绘制
        canvas.drawImageRect(
          watermarkImage,
          Rect.fromLTRB(0, 0, watermarkImage.width.toDouble(),
              watermarkImage.height.toDouble()),
          Rect.fromLTWH(0, 8.w, width, height),
          imagePaint,
        );

        canvas.restore();
      }
    }

    // 绘制文字的操作可以与图片分开，减少绘制时的复杂度
    for (int i = 0; i <= rows; i++) {
      for (int j = 0; j <= cols; j++) {
        final double x = j * horizontalSpacing - offsetX + 36.w;
        final double y = i * verticalSpacing - offsetY + 10.w;

        textPainter.paint(canvas, Offset(x, y));
      }
    }

    // 恢复画布状态
    canvas.restore();
  }

  // void paint(Canvas canvas, Size size) {
  //   final double rotationAngle = angle * 3.1415927 / 180.0;
  //
  //   final textPainter = TextPainter(
  //     maxLines: 1,
  //     text: TextSpan(
  //       text: watermarkText,
  //       style: TextStyle(
  //         fontSize: 12,
  //         color: BColors.mainColor.withOpacity(0.5),
  //       ),
  //     ),
  //     textDirection: TextDirection.ltr,
  //   );
  //   textPainter.layout(maxWidth: textMaxWidth);
  //
  //   // 计算缩放后的图片大小
  //   final double width = watermarkImage.width * 0.5;
  //   final double height = watermarkImage.height * 0.5;
  //
  //   // 计算水印单元的尺寸（包括图片和文字）
  //   final double watermarkWidth = width > 40.w + textMaxWidth ? width : 40.w +
  //       textMaxWidth;
  //   final double watermarkHeight = height + 20.w;
  //
  //   // 保存画布状态
  //   canvas.save();
  //
  //   // 在画布中心点旋转
  //   canvas.translate(size.width / 2, size.height / 2);
  //   canvas.rotate(rotationAngle);
  //   canvas.translate(-size.width / 2, -size.height / 2);
  //
  //   // 使用规整的网格排列，扩大绘制范围确保至少2个屏幕高度无空白
  //   final double horizontalSpacing = watermarkWidth * 0.88; // 水平间距
  //   final double verticalSpacing = watermarkHeight * 1.3; // 垂直间距
  //
  //   // 计算需要绘制的行列范围，确保至少覆盖2个屏幕高度
  //   final double extendedWidth = size.width * 4.0; // 扩大到2倍宽度
  //   final double extendedHeight = size.height * 6.0; // 扩大到3倍高度，确保上下都有足够覆盖
  //
  //   final int rows = (extendedHeight / verticalSpacing).ceil();
  //   final int cols = (extendedWidth / horizontalSpacing).ceil();
  //
  //   // 按照简单网格方式绘制水印，确保每行对齐
  //   for (int i = 0; i <= rows; i++) {
  //     for (int j = 0; j <= cols; j++) {
  //       // 计算水印位置，形成规整的网格，并居中显示
  //       final double x = j * horizontalSpacing - extendedWidth * 0.25;
  //       final double y = i * verticalSpacing -
  //           extendedHeight * 0.33; // 调整偏移确保上下都有足够覆盖
  //
  //       // 绘制单个水印单元
  //       canvas.save();
  //       canvas.translate(x, y);
  //
  //       // 绘制缩放后的图片
  //       canvas.drawImageRect(
  //         watermarkImage,
  //         Rect.fromLTRB(0, 0, watermarkImage.width.toDouble(),
  //             watermarkImage.height.toDouble()),
  //         Rect.fromLTWH(0, 6.w, width, height),
  //         Paint(),
  //       );
  //
  //       // 在图片上绘制文字
  //       textPainter.paint(canvas, Offset(30.w, 10.w));
  //
  //       canvas.restore();
  //     }
  //   }
  //
  //   canvas.restore();
  // }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
