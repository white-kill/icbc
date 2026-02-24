import 'package:get/get.dart';
import '../../../../../../config/dio/network.dart';
import '../../../../../../config/model/transfer_page_model.dart';
import '../../../../../../config/net_config/apis.dart';
import 'contract_detail_state.dart';

class ContractDetailLogic extends GetxController {
  final ContractDetailState state = ContractDetailState();

  @override
  void onInit() {
    super.onInit();
    // 接收传递过来的参数
    final args = Get.arguments;
    if (args != null) {
      state.icon = args['icon'] ?? '';
      state.bankId = args['id'] ?? '';
      state.name = args['name'] ?? '';
      state.bankCard = args['bankCard'] ?? '';
      state.bankName = args['bankName'] ?? '';
    }
    // 获取联系人的交易记录
    if (state.bankId.isNotEmpty) {
      getData();
    }
  }

  @override
  void onClose() {
    state.dispose();
    super.onClose();
  }

  // 获取当前联系人的交易记录（最多10条）
  Future getData() async {
    await Http.get(
      Apis.transferPage,
      queryParameters: {
        'pageNum': 1,
        'pageSize': 10,
        'keyword': state.name, // 根据银行卡号搜索联系人记录
      },
      isLoading: true
    ).then((v) {
      if (v == null) return;
      TransferPageModel pageMode = TransferPageModel.fromJson(v);
      state.list = pageMode.list;
      update(['updateList']);
    });
  }

  // 确认按钮点击
  void onConfirm() {
    // 返回数据给上一页
    Get.back(result: {
      'icon': state.icon,
      'bankName': state.bankNameController.text,
      'id': state.bankId,
      'name': state.nameController.text,
      'bankCard': state.bankCardController.text,
    });
  }
}

