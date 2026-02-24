import 'package:cbc/config/abc_config/cbc_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../../../../config/model/bill_item_model.dart';
import 'account_detail_info_state.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class AccountDetailInfoLogic extends GetxController {
  final AccountDetailInfoState state = AccountDetailInfoState();

  BillItemListBillDetail model = BillItemListBillDetail();

  bool show = false;

  List titleList = [];


  GlobalKey globalKey = GlobalKey();


  // 保存整个页面为图片
  Future<void> saveFullPageAsImage() async {


     try {
       // 等待一帧确保界面完全渲染
       await Future.delayed(Duration(milliseconds: 100));

       // 获取 RenderObject
       RenderRepaintBoundary boundary = globalKey.currentContext!
           .findRenderObject() as RenderRepaintBoundary;

       // 转换为图片（提高像素比获得更清晰的图片）
       ui.Image image = await boundary.toImage(pixelRatio: 3.0);

       // 转换为字节数据
       ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
       Uint8List pngBytes = byteData!.buffer.asUint8List();
       savePngImage(pngBytes).then((v){
         '保存成功'.showToast;
       });

     } catch (e) {

    }
  }

  Future savePngImage(Uint8List value) async{
    // 获取应用的临时目录
    final directory = await getTemporaryDirectory();
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    // 为图片创建文件路径
    final filePath = '${directory.path}/ccb_${timestamp.toString()}_${DateTime.now().millisecondsSinceEpoch}.png';

    // 创建文件并将 Uint8List 写入文件
    final file = File(filePath);
    await file.writeAsBytes(value);
    // 使用 gallery_saver 插件将图片保存到相册
    return GallerySaver.saveImage(filePath);
  }

  @override
  void onInit() {
    super.onInit();
    model = Get.arguments['model'];

    if( model.excerpt.contains('利息')){
      titleList = state.titleNameList1;
    }else {
      titleList = state.titleNameList;
    }
    if(model.oppositeAccount == ''){
      titleList.remove('对方账户');
    }
    if(model.oppositeName == ''){
      titleList.remove('对方户名');
    }
    if(model.oppositeBankName == ''){
      titleList.remove('对方账户行别');
    }


    if(model.excerpt == ''){
      titleList.remove('业务摘要');
    }

    if(model.merchantBranch == ''){
      titleList.remove('交易场所');
    }

    if(model.oppositeAccount == '' && model.oppositeName == '' && model.oppositeBankName == ''){
      titleList.removeAt(titleList.length -3);
    }

    update(['updateList']);
  }

  String valueStr(String name){
    if(name == '交易时间'){return model.transactionTime.substring(0, 16);}
    if(name == '交易卡号'){return show?model.bankCard:model.bankCard.maskBankCardNumber();}
    if(name == '业务摘要'){return model.excerpt;}
    if(name == '交易国家或地区简称'){return 'CHN';}
    if(name == '交易场所'){return  model.merchantBranch;}
    if(name == '交易金额'){return model.amount.bankBalance;}
    if(name == '记账金额'){return model.amount.bankBalance;}
    if(name == '记账币种'){return model.transactionCurrency;}
    if(name == '交易卡余额'){return model.accountBalance.bankBalance;}
    if(name == '对方账户'){return show?model.oppositeAccount:model.oppositeAccount.maskBankCardNumber();}
    if(name == '对方户名'){return model.oppositeName;}
    if(name == '对方账户行别'){return model.oppositeBankName;}

    return '';
  }

  bool isMT(){
    if(model.oppositeBankName.contains('美团')) return true;
    if(model.merchantBranch.contains('美团')) return true;
    return false;
  }

  bool isWX(){
    if(model.oppositeBankName.contains('财付通') || model.oppositeBankName.contains('微信')) return true;
    if(model.merchantBranch .contains('财付通') || model.merchantBranch.contains('微信')) return true;
    return false;
  }

  bool isZFB(){
    if(model.oppositeBankName.contains('支付宝')) return true;
    if(model.merchantBranch.contains('支付宝')) return true;
    return false;
  }

  String zxImage(){
    if(isMT()) return 'mt';
    if(isWX()) return 'wx';
    if(isZFB()) return 'zfb';
    return '';
  }

  String amount(){
    String p = model.amount.bankBalance.replaceAll('-', '');
    String fh = model.type == '2'?'-':'+';
    return fh + p;
  }
}
