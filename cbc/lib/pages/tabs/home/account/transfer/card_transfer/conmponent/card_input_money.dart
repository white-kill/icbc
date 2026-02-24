import 'package:cbc/config/app_config.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../card_transfer_logic.dart';
import '../card_transfer_state.dart';
import 'account_transfer_widget.dart';

class CardInputMoney extends StatefulWidget {
  const CardInputMoney({super.key});

  @override
  State<CardInputMoney> createState() => _CardInputMoneyState();
}

class _CardInputMoneyState extends State<CardInputMoney>
    with WidgetsBindingObserver {
  final CardTransferLogic logic = Get.put(CardTransferLogic());
  final CardTransferState state = Get.find<CardTransferLogic>().state;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  bool showDialog = true;

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    if (bottomInset > 0 && state.moneyFocusNode.hasFocus) {
      state.moneyTextController.text = state.moneyStr;
      state.cardReq.amount = state.moneyStr;
    }
    if (bottomInset == 0) {
      if (state.moneyStr != '') {
        String money = NumberFormat("#,##0.00", "zh_CN")
            .format(double.parse(state.moneyStr));
        state.moneyTextController.text = money;
      }
      logic.update(['updateCardTransfer']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 165.w + 10.w,
      color: Colors.white,
      child: Column(
        children: [
          BaseText(
            text: "汇款金额",
            style: TextStyle(fontSize: 18.sp, color: Color(0xff333333)),
          ).withContainer(
              width: 1.sw,
              padding: EdgeInsets.only(top: 12.w, left: 15.w, bottom: 12.w)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transfer.itemCellWidget(
                  title: "¥",
                  hintText: '免手续费',
                  controller: state.moneyTextController,
                  focusNode: state.moneyFocusNode,
                  style: TextStyle(
                    fontSize: 27.sp,
                    color: BColors.blue1Color,
                  ),
                  hintColor: Color(0xff9B9B9B),
                  textColor: const Color(0xff333333),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}')),
                    _DecimalTextInputFormatter(),
                    _MaxValueInputFormatter(1000000000), // 自定义的最大值限制
                  ],
                  onSubmitted: (v) {
                    logic.update(['updateBottom']);
                  },
                  onChanged: (value) {
                    state.moneyStr = value;
                    state.cardReq.amount = value;
                    logic.update(['updateBottom']);
                  }),
              Container(
                margin: EdgeInsets.only(top: 10.w, left: 15.w),
                width: 1.sw,
                height: 1.w,
                color: const Color(0xffE7E9EB),
              ),
            ],
          )),
          Container(
            height: 50.w,
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(text: '付款卡号'),
                    SizedBox(
                      width: 12.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BaseText(
                          text: AppConfig.config.abcLogic.card(),
                          fontSize: 14.sp,
                          color: BColors.blue1Color,
                        ),
                        SizedBox(
                          height: 6.w,
                        ),
                        BaseText(
                          text: '可用${AppConfig.config.abcLogic.balance()}元',
                          fontSize: 12.sp,
                          color: Color(0xff79797B),
                        )
                      ],
                    ),
                  ],
                ),
                Image(
                  image: 'ic_jt_right'.png3x,
                  width: 25.w,
                  height: 25.w,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // 如果新值包含多个小数点，则返回旧值
    if (newValue.text.split('.').length > 2) {
      return oldValue;
    }
    return newValue;
  }
}

// 自定义 TextInputFormatter 限制最大值
class _MaxValueInputFormatter extends TextInputFormatter {
  final double maxValue;

  _MaxValueInputFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    try {
      final number = double.parse(newValue.text);
      if (number > maxValue) {
        return oldValue; // 如果超过最大值，返回旧值
      }
      return newValue;
    } catch (e) {
      return oldValue;
    }
  }
}
