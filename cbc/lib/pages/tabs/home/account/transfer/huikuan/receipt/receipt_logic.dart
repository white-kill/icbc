import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:cbc/config/app_config.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../config/model/transfer_page_model.dart';
import 'receipt_state.dart';

class ReceiptLogic extends GetxController {
  final ReceiptState state = ReceiptState();

  TransferPageListBillDetail model = TransferPageListBillDetail();

  var selTag = 0.obs;

  bool showCard = true;


  QrImage? qrImage;
  String code = '';

  final GlobalKey screenshotKey = GlobalKey();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    model = Get.arguments['model'];


    model.certificateNo = generateSpecificNumber();
    model.serialNumber = generateSpecificCode();

    code = 'cbcCode${AppConfig.config.abcLogic.memberInfo.phone}'
        + ',' + model.oppositeName
        + ',' + model.oppositeAccount
        + ',' + model.oppositeBankName
        + ',' + model.amount.abs().toString()
        + ',' + model.certificateNo
        + ',' + model.serialNumber
        + ',' + model.transactionTime
        + ',' + model.merchantBranch;
  }


  Future savePngImage(Uint8List value) async{
    // 获取应用的临时目录
    final directory = await getTemporaryDirectory();
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    // 为图片创建文件路径
    final filePath = '${directory.path}/ccb_${timestamp.toString()}_share.png';

    // 创建文件并将 Uint8List 写入文件
    final file = File(filePath);
    await file.writeAsBytes(value);
    // 使用 gallery_saver 插件将图片保存到相册
    await SmartDialog.dismiss(status: SmartStatus.loading);
    return GallerySaver.saveImage(filePath);
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
    if(name == '收款户名') return model.oppositeName;
    if(name == '收款卡号') return showCard?model.oppositeAccount.maskBankCardNumber():model.oppositeAccount;
    if(name == '收款银行') return model.oppositeBankName;
    if(name == '收款金额') return '${model.amount.abs().bankBalance}  元（人民币）';
    if(name == '手续费') return '免费';
    if(name == '合计') return convertToChineseRMB(model.amount.abs());
    if(name == '付款户名') return showCard?AppConfig.config.abcLogic.realName():AppConfig.config.abcLogic.memberInfo.realName;
    if(name == '付款卡号') return  showCard?model.bankCard.maskBankCardNumber():model.bankCard;
    if(name == '付款银行') return model.bankName;
    if(name == '回单编号') return model.serialNumber;
    if(name == '指令序号') return model.certificateNo;
    if(name == '交易时间') return formatTransactionTime(model.transactionTime);
    if(name == '附言') return model.merchantBranch;
    return '';
  }

  /// 将交易时间从“2026-02-21 21:00:00”格式化为“2026/02/21 21:00”
  String formatTransactionTime(String time) {
    if (time.isEmpty) return time;
    try {
      final dateTime = DateTime.parse(time);
      return DateFormat('yyyy/MM/dd HH:mm').format(dateTime);
    } catch (_) {
      // 兜底处理：简单替换日期分隔符并去掉秒位
      final safe = time.replaceAll('-', '/');
      return safe.length >= 16 ? safe.substring(0, 16) : safe;
    }
  }

  TextEditingController textController = TextEditingController();
  void longWidget(String name){
    AlterWidget.alterWidget(clickMaskDismiss: true,builder: (context) {
      return Container(
        width: 1.sw * 0.8,
        height: 150.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(6.w))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 12.w,),
            BaseText(text: name,style: TextStyle(
                fontSize: 15.w
            ),),
            SizedBox(height: 8.w,),
            TextFieldWidget(
              hintText: '请输入',
              controller: textController,
              keyboardType:TextInputType.number ,
            ).withContainer(
                margin: EdgeInsets.only(left: 12.w,right: 12.w),
                padding: EdgeInsets.only(left: 12.w),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xffdedede),
                        width: 0.5.w
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(4.w))
                )
            ),
            SizedBox(height: 10.w,),
            Container(
              width: 1.sw * 0.88,
              height: 0.5.w,
              color: const Color(0xffbbbbab),
            ),
            SizedBox(
              height: 46.w,
              width: 1.sw * 0.8,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: BaseText(
                          text: '取消',
                          fontSize: 16.sp,
                          color: Color(0xFF666666),
                        ),
                      ).withOnTap(onTap: () {
                        SmartDialog.dismiss();
                      })),
                  Container(
                    width: 0.5.w,
                    height: 42.w,
                    color: const Color(0xffbbbbab),
                  ),
                  Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: BaseText(
                          text: '确定',
                          fontSize: 16.sp,
                          color: Color(0xFF666666),
                        ),
                      ).withOnTap(onTap: () {
                        if(name == '回单编号'){
                          model.certificateNo = textController.text;
                        }
                        if(name == '指令序号') {
                          model.serialNumber = textController.text;
                        }
                        textController.text = '';
                        update(['updateCard']);
                        SmartDialog.dismiss();
                      })),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  String replaceFirstChar(String input) {
    if (input.isEmpty) return input;
    return input.replaceFirst(input[0], '*');
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

  String generateSpecificNumber() {
    final random = DateTime.now().microsecondsSinceEpoch;
    final buffer = StringBuffer();

    // 使用当前时间作为随机种子
    int seed = random;

    // 生成24位数字（与示例数字长度相同）
    for (int i = 0; i < 24; i++) {
      // 使用简单的伪随机算法
      seed = (seed * 1103515245 + 12345) % 1000000000;
      final digit = seed % 10;
      buffer.write(digit.toString());
    }

    return buffer.toString();
  }


  // 生成类似"ZZHK-0008-9168-3859-0196"的代码
  String generateSpecificCode() {
    final random = DateTime.now().microsecondsSinceEpoch;
    final buffer = StringBuffer();

    // 添加前缀
    buffer.write('ZZHK-');

    // 使用当前时间作为随机种子
    int seed = random;

    // 生成4组4位数字
    for (int i = 0; i < 4; i++) {
      // 使用简单的伪随机算法
      seed = (seed * 1103515245 + 12345) % 1000000000;

      // 生成4位数字，确保第一位不是0
      int groupValue;
      if (i == 0) {
        // 第一组可以包含前导零
        groupValue = seed % 10000;
      } else {
        // 其他组也可以包含前导零
        groupValue = seed % 10000;
      }

      // 格式化为4位数字，不足补零
      buffer.write(groupValue.toString().padLeft(4, '0'));

      // 添加分隔符（除了最后一组）
      if (i < 3) {
        buffer.write('-');
      }
    }

    return buffer.toString();
  }

}
