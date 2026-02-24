import 'package:cbc/config/abc_config/cbc_logic.dart';
import 'package:cbc/config/model/contacts_model.dart';
import 'package:cbc/pages/tabs/home/account/transfer/fast_transfer/fast_transfer_view.dart';
import 'package:cbc/utils/widget_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../config/dio/network.dart';
import '../../../../../../config/net_config/apis.dart';
import '../contacts_list/contants_list_view.dart';

class TransferContactsWidget extends StatefulWidget {
  const TransferContactsWidget({super.key});

  @override
  State<TransferContactsWidget> createState() => _TransferContactsWidgetState();
}

class _TransferContactsWidgetState extends State<TransferContactsWidget> {
  List<ContactsModel> contactList = [];

  @override
  void initState() {
    super.initState();

    Http.get(Apis.contactsList).then((v) {
      if (v is List) {
        contactList = v.map((e) => ContactsModel.fromJson(e)).toList();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.w, left: 15.w, right: 15.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.w))),
      child: Column(
        children: [
          Container(
            height: 46.w,
            padding: EdgeInsets.only(left: 10.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BaseText(
                      text: "快速转账",
                      style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 4.w,),
                    Image(image: 'lxr_tag'.png,width: 65,height: 15.w,)
                  ],
                ),
                BaseText(
                  text: "更多",
                  color: Color(0xff666666),
                  fontSize: 14.sp,
                ).withOnTap(onTap: () {
                  Get.to(() => ContactsListPage());
                }),
              ],
            ),
          ),
          Container(
            height: 3.w,
            color: Color(0xffF8F9FA),
          ),
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              ContactsModel model = contactList[index];
              return Container(
                height: 75.w,
                margin: EdgeInsets.only(left: 17.w),
                child: Row(
                  children: [
                    netImage(url: model.icon, width: 32.w, height: 32.w),
                    SizedBox(width: 8.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            BaseText(
                              text: model.name,
                              color: Color(0xff666666),
                              fontSize: 16.sp,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Image(
                              image: 'lxr_tag'.png3x,
                              width: 40.w,
                              height: 15.w,
                            )
                          ],
                        ).withContainer(width: 268.w),
                        SizedBox(height: 10.w),
                        BaseText(
                          text:
                              '${model.bankCard.maskBankCardNumber()} ${model.bankName}',
                          color: Color(0xff666666),
                        ),
                      ],
                    ),
                  ],
                ),
              ).withOnTap(onTap: (){
                Get.to(() => FastTransferPage(),arguments: {
                  'model':model
                });
              });
            },
            separatorBuilder: (context, index) {
              return Container(
                color: Color(0xffE5E5E5),
                width: 358.w,
                height: 1.w,
                margin: EdgeInsets.only(left: 12.w, right: 12.w),
              );
            },
            itemCount: contactList.length,
          ),
        ],
      ),
    );
  }
}
