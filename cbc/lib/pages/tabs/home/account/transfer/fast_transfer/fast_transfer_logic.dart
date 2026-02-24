import 'package:get/get.dart';

import '../../../../../../config/model/contacts_model.dart';
import 'fast_transfer_state.dart';

class FastTransferLogic extends GetxController {
  final FastTransferState state = FastTransferState();

  ContactsModel model = ContactsModel();

  var transferTimeName = '实时汇款'.obs;

  @override
  void onInit() {
    super.onInit();

    model = Get.arguments['model']??ContactsModel();
    state.fastReq.bankName = model.bankName;
    state.fastReq.bankId = model.bankId;
    state.fastReq.cardNo = model.bankCard;
    state.fastReq.realName = model.name;
    print(state.fastReq.toJson());
  }
}