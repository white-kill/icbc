import 'package:cbc/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class SettingNick extends StatefulWidget {
  final Function callback;

  const SettingNick({super.key, required this.callback});

  @override
  State<SettingNick> createState() => _SettingNickState();
}

class _SettingNickState extends State<SettingNick> {
  List titleNames = [
    '消费卡',
    '公积金卡',
    '车贷卡',
    '理财卡',
    '房贷卡',
    '网购卡',
    '工资卡',
  ];

  Color selectColor(
    String name, {
    bool bg = false,
  }) {
    if (bg) {
      if (name == temSelect) return const Color(0xffF35855).withOpacity(0.88);
      return const Color(0xffF2F2F2);
    } else {
      if (name == temSelect) return Colors.white;
      return Colors.black;
    }
  }

  String temSelect = '';

  @override
  void initState() {
    super.initState();
    temSelect = nickNameValue;
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          hintText: '10位汉字、字母、数字组合',
          controller: controller,
          onChanged: (v){
            temSelect = v;
            setState(() {});
            widget.callback(v);
          },
        ).withPadding(left: 15.w, right: 15.w),
        SizedBox(
          height: 6.w,
        ),
        Container(
          width: 345.w,
          height: 0.8.w,
          color: const Color(0xffE9E9E9),
        ),
        SizedBox(
          height: 12.w,
        ),
        VerticalGridView(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          widgetBuilder: (_, index) {
            return Container(
              decoration: BoxDecoration(
                  color: selectColor(titleNames[index], bg: true),
                  borderRadius: BorderRadius.all(Radius.circular(4.w))),
              alignment: Alignment.center,
              child: BaseText(
                text: titleNames[index],
                style: TextStyle(
                  color: selectColor(titleNames[index]),
                  fontSize: 12.sp,
                ),
              ),
            ).withOnTap(onTap: () {
              temSelect = titleNames[index];
              controller.text = temSelect;
              widget.callback(temSelect);
              setState(() {});
            });
          },
          itemCount: titleNames.length,
          crossCount: 4,
          mainHeight: 28.w,
          spacing: 10.w,
          crossSpacing: 15.w,
        ),
        SizedBox(
          height: 25.w,
        ),
      ],
    );
  }
}
