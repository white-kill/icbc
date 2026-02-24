import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import 'auth_sm.dart';
import 'copy_card.dart';

class AuthWay extends StatefulWidget {
  final bool ck;
  final bool fs;
  final Function callBack;
  const AuthWay({super.key, required this.ck, required this.fs, required this.callBack});

  @override
  State<AuthWay> createState() => _AuthWayState();
}

class _AuthWayState extends State<AuthWay> {


  bool selectOneTag = true;

  @override
  void initState() {
    super.initState();
    selectOneTag = widget.fs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw * 0.88,
      height: 150.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(4.w),
        ),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 20.w,
                color: Colors.grey,
              ).withContainer(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: 6.w,
                    ),
                onTap: (){
                  if(selectOneTag){
                    SmartDialog.dismiss().then((v) {
                      AlterWidget.alterWidget(builder: (context) {
                        return CopyCard(
                          ck: widget.ck,
                        );
                      });
                    });
                  }else {
                    SmartDialog.dismiss().then((v){
                      AlterWidget.alterWidget(builder: (context) {
                        return AuthSm(
                          ck: widget.ck,
                          callBack: (){

                          },
                        );
                      });
                    });
                  }
                }
                  ),
              BaseText(
                text: '选择认证方式',
                fontSize: 16.sp,
                textAlign: TextAlign.center,
              ).expanded(),
              Container(
                width: 20.w,
              ),
            ],
          ).withPadding(
            top: 12.w,
          ),
          SizedBox(
            height: 25.w,
          ),
          Row(
            children: [
              SizedBox(
                width: 6.w,
              ),
              Image(
                image:selectOneTag?'chrz1'.png3x: 'chrz2'.png3x,
                width: 18.w,
                height: 18.w,
              ),
              SizedBox(
                width: 12.w,
              ),
              Image(
                image: 'chrz_tag1'.png3x,
                width: 20.w,
                height: 20.w,
              ),
              SizedBox(
                width: 12.w,
              ),
              BaseText(text: '卡密')
            ],
          ).withOnTap(onTap: (){
            SmartDialog.dismiss().then((v) {
              AlterWidget.alterWidget(builder: (context) {
                return CopyCard(
                  ck: widget.ck,
                );
              });
            });
          }),
          SizedBox(
            height: 20.w,
          ),
          Row(
            children: [
              SizedBox(
                width: 6.w,
              ),
              Image(
                image:selectOneTag?'chrz2'.png3x: 'chrz1'.png3x,
                width: 18.w,
                height: 18.w,
              ),
              SizedBox(
                width: 12.w,
              ),
              Image(
                image: 'chrz_tag2'.png3x,
                width: 20.w,
                height: 20.w,
              ),
              SizedBox(
                width: 12.w,
              ),
              BaseText(text: '短信')
            ],
          ).withOnTap(onTap: (){
            SmartDialog.dismiss().then((v) {
              AlterWidget.alterWidget(builder: (context) {
                return AuthSm(
                  ck: widget.ck,
                  callBack: widget.callBack,
                );
              });
            });
          })
        ],
      ).withPadding(left: 15.w, right: 15.w),
    );
  }
}
