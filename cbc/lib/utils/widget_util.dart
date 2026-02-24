import 'package:cached_network_image/cached_network_image.dart';
import 'package:cbc/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

BoxDecoration decorationImage(String imageName,{BoxFit? fit}) {
  return BoxDecoration(
    image: DecorationImage(
      image: imageName.png3x,
      fit: fit??BoxFit.fitWidth,
    ),
  );
}

BoxDecoration decorationRadius(
  double radius, {
  Color color = Colors.white,
}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: color,
  );
}

BoxDecoration decorationOnlyRadius({
  Color color = Colors.white,
  double topRight = 0,
  double topLeft = 0,
  double bottomRight = 0,
  double bottomLeft = 0,
  BoxBorder? border,
  double? radius,
}) {
  return BoxDecoration(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(radius??topRight),
        topLeft: Radius.circular(radius??topLeft),
        bottomRight: Radius.circular(radius??bottomRight),
        bottomLeft: Radius.circular(radius??bottomLeft),
      ),
      border: border,
      color: color);
}

InputDecoration normalDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    filled: true,
    fillColor: Colors.white,
    border: InputBorder.none,
  );
}

///设置横线
class HorizontalLine extends StatelessWidget {
  final double dashedWidth;
  final double dashedHeight;
  final Color color;
  final double edgeSize;

  const HorizontalLine(
      {super.key,
      this.dashedHeight = 1,
      this.dashedWidth = double.infinity,
      this.color = const Color(0xfff6f6f6),
      this.edgeSize = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: edgeSize, right: edgeSize),
      child: Container(width: dashedWidth, height: dashedHeight, color: color),
    );
  }
}

Widget bottomWidget(child, {double height = 40, Color? color}) {
  return Container(
    color: color,
    padding: EdgeInsets.only(
      top: 15,
      bottom: 15 + bottomBarHeight,
      left: 15,
      right: 15,
    ),
    child: child,
  );
}

Widget netImage({
  required String url,
  BoxFit fit = BoxFit.cover,
  double width = double.infinity,
  double height = double.infinity,
  double radius = 0
}) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    child: CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url,
      fit: fit,
      placeholder: (_,__){
        return Container(
          alignment: Alignment.center,
          width: 45.h,
          height: 45.h,
          child: CircularProgressIndicator(
            strokeWidth: 2.0.w,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      },
      errorWidget: (context, url, error) =>Container(
        decoration: decorationOnlyRadius(
            color: Colors.white,
            radius: 4.w
        ),
      ),
    ),
  );
}

void changeKeyboardType(BuildContext context, FocusNode focusNode) {
  FocusScopeNode focusScopeNode = FocusScope.of(context);
  if (!focusScopeNode.hasPrimaryFocus && focusScopeNode.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
  Future.delayed(const Duration(microseconds: 100), () {
    focusNode.requestFocus();
  });
}

/// 格式化银行卡号：如果末尾数字超过4位，则只保留最后4位数字
/// 例：中国银行123456 -> 中国银行3456
String formatBankCard(String bankCard) {
  final match = RegExp(r'^(.*?\D)(\d+)$').firstMatch(bankCard);
  if (match != null && match.group(2)!.length > 4) {
    return match.group(1)! +
        match.group(2)!.substring(match.group(2)!.length - 4);
  }
  return bankCard;
}

/// 构建金额文本，数字使用 cbc-num 字体，符号使用 cbc-num-dot 字体
/// [amount] 金额字符串
/// [color] 文字颜色
/// [fontSize] 字体大小
/// [numFontWeight] 数字字体粗细，默认 FontWeight.bold
/// [symbolFontWeight] 符号字体粗细，默认 FontWeight.w500
Widget buildAmountText({
  required String amount,
  required Color color,
  double? fontSize,
  double? height,
  FontWeight? numFontWeight,
  FontWeight? symbolFontWeight,
}) {
  final double textSize = fontSize ?? 25.sp;
  final FontWeight numWeight = numFontWeight ?? FontWeight.w500;
  final FontWeight symbolWeight = symbolFontWeight ?? FontWeight.w500;

  List<TextSpan> spans = [];
  for (int i = 0; i < amount.length; i++) {
    String char = amount[i];
    bool isNumOrSep = RegExp(r'[0-9.,]').hasMatch(char);
    
    spans.add(TextSpan(
      text: char,
      style: TextStyle(
        height: height,
        fontSize: textSize,
        fontFamily: isNumOrSep ? 'cbc-num' : null,
        color: color,
        fontWeight: isNumOrSep ? numWeight : symbolWeight,
      ),
    ));
  }

  return RichText(
    text: TextSpan(children: spans),
  );
}