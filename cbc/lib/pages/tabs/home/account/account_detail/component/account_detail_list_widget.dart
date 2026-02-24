import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountDetailListWidget extends StatefulWidget {
  const AccountDetailListWidget({super.key});

  @override
  State<AccountDetailListWidget> createState() => _AccountDetailListWidgetState();
}

class _AccountDetailListWidgetState extends State<AccountDetailListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
      return Container(
        height:(80*3).w,
        child: Row(
          children: [
            Container(
              width: 38.w,
              height: (80*3).w,
              color: Color(0xffFAFAFA),
            ),
            Expanded(child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
              return Container(
                height: 80.w,
                color: Colors.white,
              );
            }, separatorBuilder: (context,index){
              return Container(
                width: 345.w,
                height: 0.8.w,
                color: const Color(0xffE9E9E9),
              );
            }, itemCount: 3))
          ],
        ),
      );
    },
      separatorBuilder: (BuildContext context, int index) {
      return Container(
        width: 345.w,
        height: 0.8.w,
        color: const Color(0xffE9E9E9),
      );
    }, itemCount: 10,);
  }
}
