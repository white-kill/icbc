import 'package:flutter/material.dart';
import '../../../../../../config/model/transfer_page_model.dart';

class ContractDetailState {
  // 控制器
  late TextEditingController nameController;
  late TextEditingController bankCardController;
  late TextEditingController bankNameController;

  // 从上一页传递过来的数据
  String icon = '';
  String bankId = '';
  String name = '';
  String bankName = '';
  String bankCard = '';

  // 交易记录列表
  List<TransferPageList> list = [];
  ScrollController controller = ScrollController();

  ContractDetailState() {
    nameController = TextEditingController();
    bankCardController = TextEditingController();
    bankNameController = TextEditingController();
  }

  void dispose() {
    nameController.dispose();
    bankCardController.dispose();
    bankNameController.dispose();
    controller.dispose();
  }
}

