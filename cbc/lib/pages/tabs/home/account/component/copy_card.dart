import 'package:cbc/config/app_config.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../other/verification_box/verification_box.dart';
import 'auth_way.dart';

class CopyCard extends StatefulWidget {
  final bool ck;
  const CopyCard({super.key, this.ck = false, this.show});
  final Function? show;

  @override
  State<CopyCard> createState() => _CopyCardState();
}

class _CopyCardState extends State<CopyCard> {
  // Future<void> copyToClipboard(String text) async {
  //   await Clipboard.setData(ClipboardData(text: text));
  //   '复制成功'.showToast;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw * 0.88,
      height: 150.w + 70.w,
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
                Icons.clear,
                size: 24.w,
                color: Colors.grey,
              )
                  .withOnTap(onTap: () {
                    SmartDialog.dismiss();
                  })
                  .withContainer(alignment: Alignment.centerLeft)
                  .expanded(),
              BaseText(
                text: '卡密认证',
                fontSize: 16.sp,
                textAlign: TextAlign.center,
              ).expanded(),
              BaseText(
                text: '切换认证方式',
                fontSize: 12.sp,
                color: BColors.blueColor,
              ).withContainer(
                  alignment: Alignment.centerRight,
                onTap: (){
                  SmartDialog.dismiss().then((v){
                    AlterWidget.alterWidget(builder: (context) {
                      return  AuthWay(ck:widget.ck,fs: true,callBack: (){
                        if(widget.ck){
                          SmartDialog.dismiss().then((_) async {
                            await Clipboard.setData(
                                ClipboardData(text: AppConfig.config.abcLogic.card1()));
                            AlterWidget.alterWidget(builder: (context) {
                              return Container(
                                width: 1.sw * 0.75,
                                height: 160.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10.w))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              BaseText(
                                                text: '完整卡号',
                                                style: TextStyle(
                                                    fontSize: 16.sp, fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 12.w,
                                              ),
                                              BaseText(text: AppConfig.config.abcLogic.card1()),
                                              SizedBox(
                                                height: 6.w,
                                              ),
                                            ],
                                          ),
                                        )),
                                    Container(
                                      width: 1.sw,
                                      height: 1.w,
                                      color: const Color(0xffE7E9EB),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 45.w,
                                          width: (1.sw * 0.75)/2,
                                          alignment: Alignment.center,
                                          child: BaseText(
                                            text: '取消',
                                            color: Color(0xff666666),
                                            fontSize: 15.sp,
                                          ),
                                        ).withOnTap(onTap: (){
                                          SmartDialog.dismiss();
                                        }),

                                        Container(
                                          height: 45.w,
                                          width: (1.sw * 0.75)/2,
                                          alignment: Alignment.center,
                                          child: BaseText(
                                            text: '复制卡号',
                                            color: BColors.mainColor,
                                            fontSize: 15.sp,
                                          ),
                                        ).withOnTap(onTap: (){
                                          ClipboardData(text: AppConfig.config.abcLogic.card1());
                                          '复制成功'.showToast;
                                          SmartDialog.dismiss();
                                        }),
                                      ],
                                    )
                                  ],
                                ),
                              ).withOnTap(onTap: () {
                                SmartDialog.dismiss();
                              });
                            });
                          });
                        }
                        else {
                          SmartDialog.dismiss().then((_) async {
                            await Clipboard.setData(
                                ClipboardData(text: AppConfig.config.abcLogic.card1()));
                            AlterWidget.alterWidget(builder: (context) {
                              return Container(
                                width: 1.sw * 0.75,
                                height: 160.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10.w))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              BaseText(
                                                text: '卡号已复制',
                                                style: TextStyle(
                                                    fontSize: 16.sp, fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 6.w,
                                              ),
                                              BaseText(text: AppConfig.config.abcLogic.card1()),
                                              SizedBox(
                                                height: 6.w,
                                              ),
                                              BaseText(
                                                text: '已复制到剪贴板',
                                                fontSize: 13.sp,
                                              ),
                                            ],
                                          ),
                                        )),
                                    Container(
                                      width: 1.sw,
                                      height: 1.w,
                                      color: const Color(0xffE7E9EB),
                                    ),
                                    Container(
                                      height: 45.w,
                                      alignment: Alignment.center,
                                      child: BaseText(
                                        text: '确定',
                                        color: BColors.mainColor,
                                      ),
                                    )
                                  ],
                                ),
                              ).withOnTap(onTap: () {
                                SmartDialog.dismiss();
                              });
                            });
                          });
                        }
                      },);
                    });
                  });
                }
              ).expanded(),
            ],
          ).withPadding(
            top: 12.w,
          ),
          SizedBox(
            height: 20.w,
          ),
          BaseText(
            text: '请输入卡（${AppConfig.config.abcLogic.cardFour()}）的取款密码',
            fontSize: 12.sp,
            color: Color(0xff666666),
          ).withContainer(width: 1.sw, padding: EdgeInsets.only(left: 12.w)),
          SizedBox(
            height: 12.w,
          ),
          VerificationBox(
            count: 6,
            borderColor: Colors.grey,
            itemWidth: 45.w,
            itemHeight: 45.w,
            obscureText: true,
            // onSubmitted: (value) {
            //   SmartDialog.dismiss();
            // },
          ),
          Container(
            width: double.infinity,
            height: 45.w,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 12.w, right: 12.w),
            decoration: BoxDecoration(
              color: Color(0xffCF0000),
              borderRadius: BorderRadius.all(Radius.circular(6.w)),
            ),
            child: BaseText(text: "下一步", color: Colors.white, fontSize: 14.sp),
          ).withOnTap(onTap: () {

            if(widget.ck){
              widget.show?.call();
              SmartDialog.dismiss().then((_) async {
                await Clipboard.setData(
                    ClipboardData(text: AppConfig.config.abcLogic.card1()));
                AlterWidget.alterWidget(builder: (context) {
                  return Container(
                    width: 1.sw * 0.75,
                    height: 160.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.w))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BaseText(
                                    text: '完整卡号',
                                    style: TextStyle(
                                        fontSize: 16.sp, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 12.w,
                                  ),
                                  BaseText(text: AppConfig.config.abcLogic.card1()),
                                  SizedBox(
                                    height: 6.w,
                                  ),
                                ],
                              ),
                            )),
                        Container(
                          width: 1.sw,
                          height: 1.w,
                          color: const Color(0xffE7E9EB),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 45.w,
                              width: (1.sw * 0.75)/2,
                              alignment: Alignment.center,
                              child: BaseText(
                                text: '取消',
                                color: Color(0xff666666),
                                fontSize: 15.sp,
                              ),
                            ).withOnTap(onTap: (){
                              SmartDialog.dismiss();
                            }),

                            Container(
                              height: 45.w,
                              width: (1.sw * 0.75)/2,
                              alignment: Alignment.center,
                              child: BaseText(
                                text: '复制卡号',
                                color: BColors.mainColor,
                                fontSize: 15.sp,
                              ),
                            ).withOnTap(onTap: (){
                              ClipboardData(text: AppConfig.config.abcLogic.card1());
                              '复制成功'.showToast;
                              SmartDialog.dismiss();
                            }),
                          ],
                        )
                      ],
                    ),
                  ).withOnTap(onTap: () {
                    SmartDialog.dismiss();
                  });
                });
              });
            }
            else {
              SmartDialog.dismiss().then((_) async {
                await Clipboard.setData(
                    ClipboardData(text: AppConfig.config.abcLogic.card1()));
                AlterWidget.alterWidget(builder: (context) {
                  return Container(
                    width: 1.sw * 0.75,
                    height: 160.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.w))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BaseText(
                                    text: '卡号已复制',
                                    style: TextStyle(
                                        fontSize: 16.sp, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 6.w,
                                  ),
                                  BaseText(text: AppConfig.config.abcLogic.card1()),
                                  SizedBox(
                                    height: 6.w,
                                  ),
                                  BaseText(
                                    text: '已复制到剪贴板',
                                    fontSize: 13.sp,
                                  ),
                                ],
                              ),
                            )),
                        Container(
                          width: 1.sw,
                          height: 1.w,
                          color: const Color(0xffE7E9EB),
                        ),
                        Container(
                          height: 45.w,
                          alignment: Alignment.center,
                          child: BaseText(
                            text: '确定',
                            color: BColors.mainColor,
                          ),
                        )
                      ],
                    ),
                  ).withOnTap(onTap: () {
                    SmartDialog.dismiss();
                  });
                });
              });
            }
            // SmartDialog.dismiss().then((_) async {
            //   await Clipboard.setData(
            //       ClipboardData(text: AppConfig.config.abcLogic.card1()));
            //   AlterWidget.alterWidget(builder: (context) {
            //     return Container(
            //       width: 1.sw * 0.75,
            //       height: 160.w,
            //       decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.all(Radius.circular(10.w))),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Expanded(
            //               child: Container(
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 BaseText(
            //                   text: '卡号已复制',
            //                   style: TextStyle(
            //                       fontSize: 16.sp, fontWeight: FontWeight.bold),
            //                 ),
            //                 SizedBox(
            //                   height: 6.w,
            //                 ),
            //                 BaseText(text: AppConfig.config.abcLogic.card1()),
            //                 SizedBox(
            //                   height: 6.w,
            //                 ),
            //                 BaseText(
            //                   text: '已复制到剪贴板',
            //                   fontSize: 13.sp,
            //                 ),
            //               ],
            //             ),
            //           )),
            //           Container(
            //             width: 1.sw,
            //             height: 1.w,
            //             color: const Color(0xffE7E9EB),
            //           ),
            //           Container(
            //             height: 45.w,
            //             alignment: Alignment.center,
            //             child: BaseText(
            //               text: '确定',
            //               color: BColors.mainColor,
            //             ),
            //           )
            //         ],
            //       ),
            //     ).withOnTap(onTap: () {
            //       SmartDialog.dismiss();
            //     });
            //   });
            // });
          })
        ],
      ).withPadding(left: 15.w, right: 15.w),
    );
  }
}
