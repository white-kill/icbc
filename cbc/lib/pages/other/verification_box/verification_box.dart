import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'verification_box_item.dart';

///
/// 验证码输入框
///
class VerificationBox extends StatefulWidget {
  const VerificationBox(
      {super.key,
      this.count = 6,
      this.itemWidth = 45,
      this.itemHeight = 45,
      this.onSubmitted,
      this.type = VerificationBoxItemType.box,
      this.verificationController,
      this.decoration,
      this.borderWidth = 1.0,
      this.borderRadius = 4.0,
      this.textStyle,
      this.focusBorderColor,
      this.borderColor,
      this.unfocus = true,
      this.autoFocus = true,
      this.showCursor = false,
      this.isSpacing = false,
      this.customKeyBoard = false,
      this.obscureText = false,
      this.cursorWidth = 2,
      this.cursorColor,
      this.cursorIndent = 10,
      this.cursorEndIndent = 10});

  ///
  /// 是否是密文
  ///
  final bool obscureText;

  ///
  /// 是否使用自定义键盘
  ///
  final bool customKeyBoard;

  ///
  /// 是否是没有间隙的
  ///
  final bool isSpacing;

  ///
  /// 几位验证码，一般6位，还有4位的
  ///
  final int count;

  ///
  /// 没一个item的宽
  ///
  final double itemWidth;

  ///
  /// 没一个item的高
  ///
  final double itemHeight;

  ///
  /// 输入完成回调
  ///
  final ValueChanged? onSubmitted;

  ///
  /// 每个item的装饰类型，[VerificationBoxItemType]
  ///
  final VerificationBoxItemType type;

  ///
  /// 每个item的样式
  ///
  final Decoration? decoration;

  ///
  /// 边框宽度
  ///
  final double borderWidth;

  ///
  /// 边框颜色
  ///
  final Color? borderColor;

  ///
  /// 获取焦点边框的颜色
  ///
  final Color? focusBorderColor;

  ///
  /// [VerificationBoxItemType.box] 边框圆角
  ///
  final double borderRadius;

  ///
  /// 文本样式
  ///
  final TextStyle? textStyle;

  ///
  /// 输入完成后是否失去焦点，默认true，失去焦点后，软键盘消失
  ///
  final bool unfocus;

  ///
  /// 是否自动获取焦点
  ///
  final bool autoFocus;

  ///
  /// 是否显示光标
  ///
  final bool showCursor;

  ///
  /// 光标颜色
  ///
  final Color? cursorColor;

  ///
  /// 光标宽度
  ///
  final double cursorWidth;

  ///
  /// 光标距离顶部距离
  ///
  final double cursorIndent;

  ///
  /// 光标距离底部距离
  ///
  final double cursorEndIndent;

  final VerificationController? verificationController;

  @override
  State<StatefulWidget> createState() => _VerificationBox();
}

class _VerificationBox extends State<VerificationBox> {
  late TextEditingController _controller;

  late FocusNode _focusNode;

  final List _contentList = [];

  final List _obscureTextList = [];

  @override
  void initState() {
    List.generate(widget.count, (index) {
      _contentList.add('');
      _obscureTextList.add('');
    });
    _controller = TextEditingController();
    _focusNode = FocusNode();
    super.initState();

    if (widget.verificationController != null) {
      widget.verificationController?.addListener(_onController);
    }
  }

  _onController() {
    if (mounted) {
      if (widget.verificationController!.clean == true) {
        _contentList.clear();
        _obscureTextList.clear();
        _controller.clear();
        if (!mounted) return;
        setState(() {
          List.generate(widget.count, (index) {
            _contentList.add('');
            _obscureTextList.add('');
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_focusNode);
      },
      child: Stack(
        children: <Widget>[
          Positioned(
              child: Container(
            decoration: widget.isSpacing == true
                ? const BoxDecoration()
                : widget.decoration ??
                    BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        border: Border.all(
                            color:
                                widget.borderColor ?? const Color(0xFFC5C5C5),
                            width: widget.borderWidth)),
            child: SizedBox(
              height: widget.itemHeight,
              width:
                  widget.count * widget.itemWidth + widget.count.toDouble() - 1,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(widget.count, (index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: widget.itemWidth,
                        height: widget.itemHeight,
                        child: VerificationBoxItem(
                          data: widget.obscureText
                              ? _obscureTextList[index]
                              : _contentList[index],
                          textStyle: widget.textStyle ??
                              TextStyle(
                                height: 1,
                                fontSize: 14.w,
                                color: const Color(0xFF111111),
                              ),
                          type: widget.type,
                          decoration: widget.decoration,
                          borderRadius: widget.borderRadius,
                          borderWidth: widget.borderWidth,
                          borderColor: widget.isSpacing == false
                              ? Colors.transparent
                              : (_controller.text.length == index
                                      ? widget.focusBorderColor
                                      : widget.borderColor) ??
                                  widget.borderColor,
                          showCursor: widget.showCursor &&
                              _controller.text.length == index,
                          cursorColor: widget.cursorColor,
                          cursorWidth: widget.cursorWidth,
                          cursorIndent: widget.cursorIndent,
                          cursorEndIndent: widget.cursorEndIndent,
                        ),
                      ),
                      (index != widget.count - 1)
                          ? Container(
                              width: 1,
                              height: widget.itemHeight,
                              color:
                                  widget.borderColor ?? const Color(0xFFC5C5C5),
                            )
                          : Container()
                    ],
                  );
                }),
              ),
            ),
          )),
          SizedBox(
            width:
                widget.count * widget.itemWidth + widget.count.toDouble() + 1,
            child: _buildTextField(),
          ),
        ],
      ),
    );
  }

  ///
  /// 构建TextField
  ///
  _buildTextField() {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
      ),
      cursorWidth: 0,
      autofocus: widget.autoFocus,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ],
      maxLength: widget.count,
      buildCounter: (
        BuildContext context, {
        required int currentLength,
        required bool isFocused,
        required int? maxLength,
      }) {
        return const BaseText(text: '');
      },
      keyboardType:TextInputType.number,
      style: TextStyle(
        color: Colors.transparent,
        fontSize: 24.w,
        height: 1,
      ),
      onChanged: _onValueChange,
    );
  }

  _onValueChange(value) {
    for (int i = 0; i < widget.count; i++) {
      if (i < value.length) {
        _contentList[i] = value.substring(i, i + 1);
        _obscureTextList[i] = "●";
      } else {
        _contentList[i] = '';
        _obscureTextList[i] = "";
      }
    }
    if (!mounted) return;
    setState(() {});

    if (value.length == widget.count) {
      if (widget.unfocus) {
        _focusNode.unfocus();
      }
      widget.onSubmitted?.call(value);
    }
  }
}

class VerificationController extends ChangeNotifier {
  bool clean = false;

  void cleanVerification(bool value) {
    clean = value;
    notifyListeners();
  }
}
