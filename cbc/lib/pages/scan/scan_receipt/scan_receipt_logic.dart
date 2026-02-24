import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../config/app_config.dart';
import '../../../config/model/transfer_page_model.dart';
import 'scan_receipt_state.dart';

class Scan_receiptLogic extends GetxController {
  final Scan_receiptState state = Scan_receiptState();

  TransferPageListBillDetail model = TransferPageListBillDetail();


  List dataList = [];

  QrImage? qrImage;
  String code = '';

  @override
  void onInit() {
    super.onInit();
    // model = Get.arguments['model'];
    code = (Get.arguments?['code']??'');
    dataList = (Get.arguments?['code']??'').split(',');
  }


  @override
  void onReady() {
    super.onReady();

    WidgetsBinding.instance.addPostFrameCallback((_){
      final qrCode = QrCode(
        8,
        QrErrorCorrectLevel.L,
      )..addData(code);

      qrImage = QrImage(qrCode);

      update(['code']);
    });
  }


  String valueStr(String name){
    if(name == '收款户名') return dataList[1];
    if(name == '收款卡号') return dataList[2].toString().maskBankCardNumber();
    if(name == '收款银行') return dataList[3];
    if(name == '收款金额') return '${double.parse(dataList[4] == ''?'0':dataList[4]).bankBalance}  元（人民币）';
    if(name == '手续费') return '免费';
    if(name == '合计') return convertToChineseRMB(model.amount.abs());
    if(name == '付款户名') return AppConfig.config.abcLogic.realName();
    if(name == '付款卡号') return  AppConfig.config.abcLogic.card();
    if(name == '付款银行') return '中国工商银行';
    if(name == '回单编号') return dataList[5];
    if(name == '指令序号') return dataList[6];
    if(name == '交易时间') return dataList[7];
    if(name == '附言') return dataList[8];
    return '';
  }



  String convertToChineseRMB(double amount) {
    if (amount == 0) return '零元整';

    // 定义中文数字
    const List<String> digits = ['零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖'];
    const List<String> units = ['', '拾', '佰', '仟'];
    const List<String> sections = ['', '万', '亿', '兆'];

    // 处理负数
    bool isNegative = amount < 0;
    amount = amount.abs();

    // 分离整数和小数部分
    int integerPart = amount.floor();
    int decimalPart = ((amount - integerPart) * 100).round();

    // 转换整数部分
    String integerStr = _convertIntegerPart(integerPart, digits, units, sections);

    // 转换小数部分
    String decimalStr = _convertDecimalPart(decimalPart, digits);

    // 组合结果
    String result = integerStr;
    if (decimalPart > 0) {
      result += decimalStr;
    } else {
      result += '整';
    }

    if (isNegative) {
      result = '负$result';
    }

    return result;
  }

  String _convertIntegerPart(int number, List<String> digits, List<String> units, List<String> sections) {
    if (number == 0) return '零';

    String result = '';
    int sectionIndex = 0;

    while (number > 0) {
      int section = number % 10000;
      if (section > 0) {
        String sectionStr = _convertSection(section, digits, units);
        result = sectionStr + sections[sectionIndex] + result;
      } else if (result.isNotEmpty && !result.startsWith('零')) {
        result = '零' + result;
      }

      number ~/= 10000;
      sectionIndex++;
    }

    // 处理连续的零
    result = result.replaceAll(RegExp('零+'), '零');
    result = result.replaceAll(RegExp('^零'), '');

    return result + '元';
  }

  String _convertSection(int section, List<String> digits, List<String> units) {
    if (section == 0) return '零';

    String result = '';
    int unitIndex = 0;

    while (section > 0) {
      int digit = section % 10;
      if (digit > 0) {
        result = digits[digit] + units[unitIndex] + result;
      } else if (result.isNotEmpty && !result.startsWith('零')) {
        result = '零' + result;
      }

      section ~/= 10;
      unitIndex++;
    }

    // 处理连续的零
    result = result.replaceAll(RegExp('零+'), '零');
    result = result.replaceAll(RegExp('^零'), '');

    return result;
  }

  String _convertDecimalPart(int decimal, List<String> digits) {
    if (decimal == 0) return '';

    String result = '';
    int jiao = decimal ~/ 10; // 角
    int fen = decimal % 10;   // 分

    if (jiao > 0) {
      result += digits[jiao] + '角';
    }

    if (fen > 0) {
      result += digits[fen] + '分';
    }

    return result;
  }

}
