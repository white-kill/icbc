import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../other/sheet_widget/picker_widget.dart';
import '../../../../../other/sheet_widget/sheet_bottom.dart';
import '../bill_analyze_logic.dart';
import '../bill_analyze_state.dart';
import 'chat_widget.dart';

class YearWidget extends StatefulWidget {
  const YearWidget({super.key});

  @override
  State<YearWidget> createState() => _YearWidgetState();
}

class _YearWidgetState extends State<YearWidget> {

  final BillAnalyzeLogic logic = Get.put(BillAnalyzeLogic());
  final BillAnalyzeState state = Get.find<BillAnalyzeLogic>().state;

  String temYearStr = '';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        GetBuilder(builder: (BillAnalyzeLogic c){
          return Container(
            width: 80.w,
            height: 28.w,
            padding: EdgeInsets.all(4.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.w))
            ),
            child: BaseText(text: state.yearStr,style: TextStyle(
              height: 1,
            ),),
          );
        },id: 'updateTag',).withContainer(
          padding: EdgeInsets.only(top: 10.w,left: 12.w),
          alignment: Alignment.centerLeft,
          onTap: (){
            SheetBottom.show(
              title: '筛选',
              // topWidget: const SizedBox.shrink(),
              leftWidget: BaseText(text: '取消',color: Colors.blueAccent,).withOnTap(onTap: ()=> Get.back()),
              rightWidget: BaseText(text: '完成',color: Colors.blueAccent,).withOnTap(onTap: (){
                state.yearStr = temYearStr;
                logic.update(['updateTag']);
                logic.getData(time: temYearStr.replaceAll('年', ''),type: '1');
                Get.back();
              }),
              child: Container(
                height: 200.w,
                child:  DateTimePicker(
                  // dateTimePickerNotifier: state.mPickerNotifier,
                  lastYear: 4,
                  showDay:false,
                  showMonth: false,
                  onDateTimeChanged:(DateTime date){
                    temYearStr = DateFormat('yyyy年').format(date);
                  },
                ),
              ),
            );
          }
        ),

        ChatWidget(),
      ],
    );
  }
}
