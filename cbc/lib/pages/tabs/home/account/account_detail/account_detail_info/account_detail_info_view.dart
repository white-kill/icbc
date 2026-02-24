import 'package:cbc/utils/widget_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../other/fixed_nav/fixed_nav_view.dart';
import '../../component/kh_wd.dart';
import 'account_detail_info_logic.dart';
import 'account_detail_info_state.dart';

class AccountDetailInfoPage extends StatelessWidget {
  AccountDetailInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: logic.globalKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(44.w), // 设置高度
          child: AppBar(
            title:BaseText(
              text:'明细详情',
              style: TextStyle(
                  fontSize: 18.sp,
                  color: const Color(0xFF607483),
                  fontWeight: FontWeight.w400
              ),),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            titleSpacing: 0,
            titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sw),
            leading: InkWell(
                child: Padding(padding: EdgeInsets.only(left: 10.w),
                  child: Icon(Icons.navigate_before,size: 30.h,color: const Color(0xFF607483),),
                ),
                onTap: ()  => Get.back()
            ),
            actions:[
              Image(image: 'bc_xc'.png,width: 22.w,height: 22.w,).withContainer(
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: 12.w),
              ).withOnTap(onTap: (){
                logic.saveFullPageAsImage();
              })
            ],
          ),
        ),
        body:Container(
          color: const Color(0xFFF5F5F5),
          width: 1.sw,
          height: 1.sh,
          child: ListView(
            padding: EdgeInsets.only(top: 10.w),
            children: [
              Container(
                color: Colors.white,
                height: 120.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildAmountText(
                      amount: logic.amount(),
                      color: logic.model.type == '1'
                          ? const Color(0xffC34236)
                          : const Color(0xff35827D),
                      fontSize: 25.sp,
                      numFontWeight: FontWeight.w500,
                      symbolFontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 8.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseText(
                          text: '余额: ',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xff4D545E),
                              fontWeight: FontWeight.w400),
                        ),
                        buildAmountText(
                          amount: logic.model.accountBalance.bankBalance,
                          color: Colors.black,
                          fontSize: 14.sp,
                          numFontWeight: FontWeight.w500,
                          symbolFontWeight: FontWeight.w500,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              GetBuilder(builder: (AccountDetailInfoLogic c){
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    String name = logic.titleList[index];
                    if (name == '') {
                      return Column(
                        children: [
                          Container(
                            width: 1.sw,
                            height: 2.w,
                            color: Colors.white,
                          ),
                          Container(
                            width: 1.sw,
                            height: 0.5.w,
                            color: Color(0xffdedede),
                          )
                        ],
                      );
                    }
                    return Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(
                          left: 12.w, top: 6.w, bottom: 8.w, right: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BaseText(
                            text: name,
                            style:
                            TextStyle(fontSize: 13.5.sp, color: Color(0xff777777)),
                          ),
                          name == '查询完整交易卡号或账户'
                              ?Transform.scale(
                            scale: 0.88,
                            child: CupertinoSwitch(
                                value: logic.show,
                                // activeTrackColor: Color.fromARGB(255, 3, 134, 91),
                                activeColor:  Color.fromARGB(255, 3, 134, 91),
                                onChanged: (bool value) {
                                  AlterWidget.alterWidget(builder: (context) {
                                    return  KhWd(callBack: (){
                                      SmartDialog.dismiss().then((_) async {
                                        logic.show = value;
                                        logic.update(['updateList']);
                                      });
                                    },);
                                  });
                                }),
                          )
                              : BaseText(
                            text: logic.valueStr(name),
                            style: TextStyle(
                                fontSize: 13.5.sp, color: Color(0xff333333)),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: logic.titleList.length,
                );
              },id: 'updateList',),
              (logic.isMT() || logic.isZFB() || logic.isWX())? Container(
                width: 1.sw,
                height: 60.w,
                alignment: Alignment.center,
                child: BaseText(text: '对该笔订单有疑问?立即咨询',color: Colors.blue,),
              ).withOnTap(onTap: (){
                Get.to(() => FixedNavPage(),arguments: {
                  'image':'wx',
                  'title':'订单咨询',
                  'background':Color(0xffF3F3F3),
                  'right':true,
                });
              }):SizedBox.shrink()
            ],
          ),
        ),
      ),
    ) ;
  }

  final AccountDetailInfoLogic logic = Get.put(AccountDetailInfoLogic());
  final AccountDetailInfoState state = Get.find<AccountDetailInfoLogic>().state;
  //
  // @override
  // List<Widget>? get rightAction => [
  //   Image(image: 'bc_xc'.png,width: 22.w,height: 22.w,).withContainer(
  //     alignment: Alignment.center,
  //     padding: EdgeInsets.only(right: 12.w),
  //   )
  // ];

  // @override
  // Widget initBody(BuildContext context) {
  //   return ListView(
  //     padding: EdgeInsets.only(top: 10.w),
  //     children: [
  //       Container(
  //         color: Colors.white,
  //         height: 120.w,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             BaseText(
  //               text: logic.amount(),
  //               style: TextStyle(
  //                 fontSize: 25.sp,
  //                 fontWeight: FontWeight.w500,
  //                 color: logic.model.type == '1'?const Color(0xffC34236):const Color(0xff35827D),
  //               ),
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 BaseText(
  //                   text: '余额: ',
  //                   style: TextStyle(
  //                       fontSize: 14.sp,
  //                       color: Color(0xff4D545E),
  //                       fontWeight: FontWeight.w400),
  //                 ),
  //                 BaseText(
  //                   text:logic.model.accountBalance.bankBalance,
  //                   style:
  //                   TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //       GetBuilder(builder: (AccountDetailInfoLogic c){
  //         return ListView.builder(
  //           shrinkWrap: true,
  //           itemBuilder: (context, index) {
  //             String name = logic.titleList[index];
  //             if (name == '') {
  //               return Column(
  //                 children: [
  //                   Container(
  //                     width: 1.sw,
  //                     height: 2.w,
  //                     color: Colors.white,
  //                   ),
  //                   Container(
  //                     width: 1.sw,
  //                     height: 0.5.w,
  //                     color: Color(0xffdedede),
  //                   )
  //                 ],
  //               );
  //             }
  //             return Container(
  //               color: Colors.white,
  //               padding: EdgeInsets.only(
  //                   left: 12.w, top: 6.w, bottom: 8.w, right: 12.w),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   BaseText(
  //                     text: name,
  //                     style:
  //                     TextStyle(fontSize: 13.5.sp, color: Color(0xff777777)),
  //                   ),
  //                   name == '查询完整交易卡号或账户'
  //                       ?Transform.scale(
  //                     scale: 0.88,
  //                     child: CupertinoSwitch(
  //                         value: logic.show,
  //                         // activeTrackColor: Color.fromARGB(255, 3, 134, 91),
  //                         activeColor:  Color.fromARGB(255, 3, 134, 91),
  //                         onChanged: (bool value) {
  //                           AlterWidget.alterWidget(builder: (context) {
  //                             return  KhWd(callBack: (){
  //                               SmartDialog.dismiss().then((_) async {
  //                                 logic.show = value;
  //                                 logic.update(['updateList']);
  //                               });
  //                             },);
  //                           });
  //                         }),
  //                   )
  //                       : BaseText(
  //                     text: logic.valueStr(name),
  //                     style: TextStyle(
  //                         fontSize: 13.5.sp, color: Color(0xff333333)),
  //                   )
  //                 ],
  //               ),
  //             );
  //           },
  //           itemCount: logic.titleList.length,
  //         );
  //       },id: 'updateList',),
  //       (logic.isMT() || logic.isZFB() || logic.isWX())? Container(
  //         width: 1.sw,
  //         height: 60.w,
  //         alignment: Alignment.center,
  //         child: BaseText(text: '对该笔订单有疑问?立即咨询',color: Colors.blue,),
  //       ).withOnTap(onTap: (){
  //         Get.to(() => FixedNavPage(),arguments: {
  //           'image':'wx',
  //           'title':'订单咨询',
  //           'background':Color(0xffF3F3F3),
  //           'right':true,
  //         });
  //       }):SizedBox.shrink()
  //     ],
  //   );
  // }
}
