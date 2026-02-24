

import 'package:cbc/config/app_config.dart';
import 'package:cbc/config/model/member_info_model.dart';


class ContactsListState {
  late MemberInfoModel infoModel;
  ContactsListState() {
    ///Initialize variables

    infoModel = AppConfig.config.abcLogic.memberInfo;
  }
}
