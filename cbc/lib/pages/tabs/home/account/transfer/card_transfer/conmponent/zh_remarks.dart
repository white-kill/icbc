import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../utils/color_util.dart';
import '../card_transfer_logic.dart';
import '../card_transfer_state.dart';
import 'account_transfer_widget.dart';

class ZhRemarks extends StatefulWidget {
  const ZhRemarks({super.key});

  @override
  State<ZhRemarks> createState() => _ZhRemarksState();
}

class _ZhRemarksState extends State<ZhRemarks> {
  final CardTransferLogic logic = Get.put(CardTransferLogic());
  final CardTransferState state = Get.find<CardTransferLogic>().state;

  List transferTime = [

    {
      'title':'实时汇款',
      'content':'实时汇出，不可微销'
    },

    {
      'title':'普通汇款',
      'content':'2小时后汇出，期间可撤销'
    },

    {
      'title':'次日汇款',
      'content':'次日凌晨汇出，当日可撤销'
    },
  ];

  String transferTimeName = '实时汇款';
  List titleNames = [];

  bool showTag = false;

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 44.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BaseText(
                      text: '汇款方式',
                      fontSize: 14.sp,
                    ).withContainer(
                      width: 100.w,
                      padding: EdgeInsets.only(left: 15.w),
                    ),
                    BaseText(text: transferTimeName,color: BColors.blue1Color,),
                  ],
                ),
                Image(
                  image: 'ic_jt_right'.png3x,
                  width: 25.w,
                  height: 25.w,
                ).withPadding(right: 15.w),
              ],
            ),
          ).withOnTap(onTap: (){
            FocusScope.of(context).unfocus();
            focusNode2.unfocus();
            focusNode1.unfocus();
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context:context,
              builder: (context) {
                return Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        Map data = transferTime[index];
                        return Container(
                          width: 1.sw,
                          height: 55.w,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 15.w,right: 15.w),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BaseText(text: data['title'],color: BColors.blue1Color,),
                              SizedBox(height: 6.w,),
                              BaseText(text: data['content'],fontSize: 12.sp,color: Color(0xff666666),),
                            ],
                          ),
                        ).withOnTap(onTap: (){
                          transferTimeName = data['title'];
                          setState(() {});
                          Get.back();
                        });
                      },
                      itemCount: transferTime.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 1.sw,
                          height: 0.5.w,
                          color: const Color(0xffEFEFEF),
                        );
                      }, //state.list.length,
                    ).withContainer(
                      margin: EdgeInsets.only(left: 15.w,right: 15.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(6.w))
                      ),
                    ),

                    SizedBox(height: 16.w,),
                    Container(
                      width: 1.sw,
                      height: 45.w,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 15.w,right: 15.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(6.w))
                      ),
                      child: BaseText(text: '取消'),
                    ).withOnTap(onTap:(){
                      Get.back();
                    })
                  ],
                ).withContainer(
                    height: 260.w,
                    color: Colors.transparent
                );
              },
            );
          }),
          Container(
            width: 1.sw,
            height: 1.w,
            margin: EdgeInsets.only(left: 15.w),
            color: const Color(0xffE7E9EB),
          ),
          Transfer.itemCellWidget(
              title: "附言",
              hintText: '选填',
              focusNode: focusNode1,
              style: TextStyle(
                fontSize: 14.sp,
              ),
              controller: state.remarksTextController,
              // textAlign: TextAlign.right,
              onChanged: (text) {
                state.cardReq.purpose = text;
              },
              onTap: () {
                setState(() {});
              }),
          Container(
            width: 1.sw,
            height: 1.w,
            margin: EdgeInsets.only(left: 15.w),
            color: const Color(0xffE7E9EB),
          ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Transfer.itemCellWidget(
                 title: "短信通知",
                 focusNode: focusNode2,
                 hintText: '选填',
                 style: TextStyle(
                   fontSize: 14.sp,
                 ),
                 controller: state.dxTextController,
                 // textAlign: TextAlign.right,
                 onChanged: (text) {},
                 onTap: () {}),
             Image(
               image: 'ic_t_dx'.png3x,
               width: 24.w,
               height: 24.w,
             ).withPadding(right: 16.w),
           ],
         )
        ],
      ),
    );
  }
}
