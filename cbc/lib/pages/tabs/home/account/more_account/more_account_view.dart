import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../utils/comm_widget_utils.dart';
import '../../../../other/fixed_nav/fixed_nav_view.dart';
import '../add_bank_card/add_bank_card_view.dart';
import '../transfer/receipt_verify/receipt_verify_view.dart';
import 'more_account_logic.dart';
import 'more_account_state.dart';

class MoreAccountPage extends BaseStateless {
  MoreAccountPage({Key? key}) : super(key: key,title: '账户');

  final MoreAccountLogic logic = Get.put(MoreAccountLogic());
  final MoreAccountState state = Get.find<MoreAccountLogic>().state;


  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'ic_nav_service'.png3x,
      width: 20.w,
      height: 20.w,
      color: const Color(0xFF607483),
    )
        .withPadding(right: 20.w)
        .withOnTap(onTap: () => Routes.mineService.push),
    CommWidgetUtils.getMoreIcon(icColor: const Color(0xFF607483)),
  ];



  void jumpPage(int index){
    if(index == 0){
      Routes.printPage.push;
    }
    if(index == 1){
      Get.to(() => AddBankCardPage());
    }
    if(index == 11){
      Get.to(() => ReceiptVerifyPage());
    }
    if(index == 2){
      Get.to(() => FixedNavPage(), arguments: {
        'image': 'zh_zxzm',
        'title': '资信证明',
        'right': true
      });
    }
  }

  @override
  Widget initBody(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.only(top: 8.w),
        itemBuilder: (context, index) {
          if(state.titleList[index] == 'bottom'){

            return Column(
              children: [
                Container(width: 1.sw,height: 12.w,),
                
                Container(
                  width: 1.sw,
                  height: 45.w,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 12.w,right: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.more_horiz,color: Color(0xff333333),),
                          BaseText(text: '更多'),
                        ],
                      ),

                      Image(
                        image: 'ic_jt_right'.png3x,
                        width: 23.w,
                        height: 23.w,
                      )
                    ],
                  ),
                ),

                Container(width: 1.sw,height: 35.w,),
              ],
            );
          }
          return Container(
            height: 60.w,
            color: Colors.white,
            padding: EdgeInsets.only(left: 15.w, right: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BaseText(
                      text: state.titleList[index],
                      fontSize: 15.sp,color: Color(0xff333333),
                    ),
                    state.contentList[index] == ''
                        ? SizedBox.shrink()
                        : SizedBox(
                            height: 4.w,
                          ),
                    state.contentList[index] == ''
                        ? SizedBox.shrink()
                        : BaseText(
                            text: state.contentList[index],
                            fontSize: 12.sp,color: Color(0xff333333),
                          ),
                  ],
                ),
                Image(
                  image: 'ic_jt_right'.png3x,
                  width: 23.w,
                  height: 23.w,
                )
              ],
            ),
          ).withOnTap(onTap: () {
            jumpPage(index);
          });
        },
        separatorBuilder: (context, index) {
          return Container(
            width: 1.sw,
            height: 0.8.w,
            color: const Color(0xffE9E9E9),
          );
        },
        itemCount: state.titleList.length);
  }
}
