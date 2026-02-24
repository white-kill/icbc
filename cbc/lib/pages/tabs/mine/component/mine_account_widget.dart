import 'package:cbc/config/app_config.dart';
import 'package:cbc/pages/other/fixed_nav/fixed_nav_view.dart';
import 'package:cbc/utils/abc_button.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/component/rotate_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';
import '../diagnosis/diagnosis_view.dart';
import 'alter_tip.dart';

class MineAccountWidget extends StatefulWidget {
  const MineAccountWidget({super.key});

  @override
  State<MineAccountWidget> createState() => _MineAccountWidgetState();
}

class _MineAccountWidgetState extends State<MineAccountWidget> {

  bool isOpen = false;

  bool isMore = false;

  bool isFz = false;

  String time = '';

  @override
  void initState() {
    super.initState();
    time =  DateUtil.formatDate(DateTime.now(), format:DateFormats.full);
  }


  @override
  Widget build(BuildContext context) {
    return isMore
        ? Container(
            margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 6.w),
            child: isFz
                ? Stack(
                    children: [
                      Image(image: 'mine_a_1'.png3x),
                      Positioned(
                          top: 8.w,
                          left: 12.w,
                          child: Row(
                            children: [
                              BaseText(
                                text: '时间 $time',
                                fontSize: 11.sp,
                                color: Color(0xff646465),
                              ),
                              SizedBox(width: 6.w,),
                              if (isOpen)
                                RotatingWidget(
                                image: 'ic_home_ref'.png3x,
                                color: Colors.grey,
                                disCallBack: (){
                                  time = DateUtil.formatDate(DateTime.now(), format:DateFormats.full);
                                  setState(() {});
                                },
                              )
                            ],
                          )),
                      Positioned(
                          top: 42.w,
                          left: 12.w,
                          right: 12.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  BaseText(
                                    text: '我的资产负债',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.only(left: 8.w, right:8.w),
                                    child:Image(
                                      image: 'ic_tag_w'.png3x,
                                      width: 15.w,
                                      height: 15.w,
                                    )

                                  ).withOnTap(onTap: (){
                                    showDialog(context: context, builder: (context) {
                                      return const AlterTip2();
                                    });
                                  }),

                                  Image(
                                    image: isOpen
                                        ? 'ic_eye_open'.png3x
                                        : 'ic_eye_close'.png3x,
                                    width: 18.w,
                                    height: 18.w,
                                  ).withOnTap(onTap: () {
                                    isOpen = !isOpen;
                                    setState(() {});
                                  }),
                                ],
                              ),
                              BaseText(
                                text: '详情',
                                fontSize: 12.sp,
                                color: Color(0xff6F6F6F),
                              ).withOnTap(onTap: () => Routes.mineAssets.push)
                            ],
                          ).withContainer(
                            width: 1.sw,
                          )),
                      Positioned(
                          top: 70.w,
                          left: 12.w,
                          right: 12.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 12.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BaseText(
                                        text: '总资产(元)',
                                        color: Color(0xff646465),
                                        fontSize: 12.sp,
                                      ),
                                      SizedBox(
                                        height: 6.w,
                                      ),
                                      BaseText(
                                        text: isOpen
                                            ? AppConfig.config.abcLogic
                                                .balance()
                                            : "****",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ).withOnTap(onTap: () {
                                  isMore = true;
                                  setState(() {});
                                }),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(right: 12.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      BaseText(
                                        text: '总负债(元)',
                                        color: Color(0xff646465),
                                        fontSize: 12.sp,
                                      ),
                                      SizedBox(
                                        height: 6.w,
                                      ),
                                      BaseText(
                                        text: isOpen ? '0.00' : '****',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ).withOnTap(onTap: () {
                                  isFz = true;
                                  isMore = true;
                                  setState(() {

                                  });
                                }),
                              ),
                            ],
                          ).withContainer(
                            height: 80.w,
                            width: 1.sw,
                          )),
                      Positioned(
                          top: 90.w + 120.w,
                          left: 24.w,
                          right: 24.w,
                          child: Container(
                            width: 1.sw,
                            height: 25.w,
                          ).withOnTap(onTap: () {
                            isMore = false;
                            isFz = false;
                            setState(() {});
                          })),
                      Positioned(
                        top: 90.w + 70.w,
                        left: 24.w,
                        right: 24.w,
                        child: BaseText(
                          text: '您在我行暂无负债',
                          fontSize: 12.sp,
                          color: Color(0xff666666),
                        ).withContainer(
                            width: 1.sw, alignment: Alignment.center),
                      ),
                      Positioned(
                          top: 78.w,
                          left: 12.w,
                          right: 12.w,
                          child: Container(
                            height: 55.w,
                            width: 1.sw,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container().withOnTap(onTap: () {
                                  isFz = false;
                                  setState(() {});
                                })),
                                Expanded(
                                    child: Container().withOnTap(onTap: () {
                                  isFz = true;
                                  setState(() {});
                                })),
                              ],
                            ),
                          ))
                    ],
                  )
                : Stack(
                    children: [
                      Image(image: 'mine_a_2'.png3x),
                      Positioned(
                          top: 8.w,
                          left: 12.w,
                          child: Row(
                            children: [
                              BaseText(
                                text: '时间 $time',
                                fontSize: 11.sp,
                                color: Color(0xff646465),
                              ),
                              SizedBox(width: 6.w,),
                              if (isOpen)
                              RotatingWidget(
                                image: 'ic_home_ref'.png3x,
                                color: Colors.grey,
                                disCallBack: (){
                                  time = DateUtil.formatDate(DateTime.now(), format:DateFormats.full);
                                  setState(() {});
                                },
                              )
                            ],
                          )),
                      Positioned(
                          top: 42.w,
                          left: 12.w,
                          right: 12.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  BaseText(
                                    text: '我的资产负债',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(left: 8.w, right:8.w),
                                      child:Image(
                                        image: 'ic_tag_w'.png3x,
                                        width: 15.w,
                                        height: 15.w,
                                      )

                                  ).withOnTap(onTap: (){
                                    showDialog(context: context, builder: (context) {
                                      return const AlterTip2();
                                    });
                                  }),
                                  Image(
                                    image: isOpen
                                        ? 'ic_eye_open'.png3x
                                        : 'ic_eye_close'.png3x,
                                    width: 18.w,
                                    height: 18.w,
                                  ).withOnTap(onTap: () {
                                    isOpen = !isOpen;
                                    setState(() {});
                                  }),
                                ],
                              ),
                              BaseText(
                                text: '详情',
                                fontSize: 12.sp,
                                color: Color(0xff6F6F6F),
                              ).withOnTap(onTap: () => Routes.mineAssets.push)
                            ],
                          ).withContainer(
                            width: 1.sw,
                          )),
                      Positioned(
                          top: 70.w,
                          left: 12.w,
                          right: 12.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 12.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BaseText(
                                        text: '总资产(元)',
                                        color: Color(0xff646465),
                                        fontSize: 12.sp,
                                      ),
                                      SizedBox(
                                        height: 6.w,
                                      ),
                                      BaseText(
                                        text: isOpen
                                            ? AppConfig.config.abcLogic
                                                .balance()
                                            : "****",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ).withOnTap(onTap: () {
                                  isMore = true;
                                  setState(() {});
                                }),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(right: 12.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      BaseText(
                                        text: '总负债(元)',
                                        color: Color(0xff646465),
                                        fontSize: 12.sp,
                                      ),
                                      SizedBox(
                                        height: 6.w,
                                      ),
                                      BaseText(
                                        text: isOpen ? '0.00' : '****',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ).withOnTap(onTap: () {
                                  isFz = true;
                                  isMore = true;
                                  setState(() {

                                  });
                                }),
                              ),
                            ],
                          ).withContainer(
                            height: 80.w,
                            width: 1.sw,
                          )),
                      () {
                        final balance = AppConfig.config.abcLogic.memberInfo.accountBalance;
                        if (balance >= 1000 && isOpen) {
                          return Positioned(
                            top: 135.w,
                            left: 25.w,
                            child: Container(
                              margin: EdgeInsets.only(top: 2.w),
                              padding: EdgeInsets.only(
                                  left: 4.w,
                                  right: 4.w,
                                  top: 3.w,
                                  bottom: 2.w),
                              constraints: BoxConstraints(
                                minWidth: 25.w,
                                minHeight: 22.w,
                              ),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: 'tag02'.png,
                                      fit: BoxFit.fill
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(2.w))),
                              child: BaseText(
                                text: getChineseUnitSimple(balance),
                                color: BColors.mainColor,
                                fontSize: 12.sp,
                                textAlign: TextAlign.center,
                              ),
                            ));
                        }
                        return SizedBox.shrink();
                      }(),
                      Positioned(
                          top: 72.w + 90.w + 20.w,
                          left: 12.w,
                          right: 12.w,
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BaseText(
                                      text: '存款',
                                      fontSize: 12.sp,
                                    ),
                                    Row(
                                      children: [
                                        BaseText(
                                          text: isOpen ? AppConfig.config.abcLogic
                                              .balance() : '****',
                                          fontSize: 12.sp,
                                        ),
                                        Image(
                                          image: 'ic_jt_right'.png3x,
                                          width: 16.w,
                                          height: 16.w,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    BaseText(
                                      text: isOpen ? '100.00%' : '****',
                                      fontSize: 10.sp,
                                      color: BColors.mainColor,
                                    ),
                                    Expanded(
                                        child: Container(
                                      height: 2.w,
                                      margin: EdgeInsets.only(
                                          right: 8.w, left: isOpen ? 2.w : 20.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.w)),
                                        color: isOpen ? BColors.mainColor : Color(0xFFE1E2E4),
                                      ),
                                    ))
                                  ],
                                )
                              ],
                            ),
                          )),
                      Positioned(
                          top: 72.w + 90.w + 70.w,
                          left: 12.w,
                          right: 12.w,
                          child: Container(
                            width: 1.sw,
                            height: 0.5,
                            color: Color(0xffdedede),
                          )),
                      Positioned(
                          top: 72.w + 100.w + 70.w,
                          left: 24.w,
                          right: 24.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image: 'ic_mine_l'.png,
                                    width: 22.w,
                                    height: 22.w,
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  BaseText(
                                    text: '给资产做个诊断，实现财富增值',
                                    fontSize: 12.sp,
                                    color: Color(0xff666666),
                                  ),
                                ],
                              ),
                              AbcButton(
                                title: '去诊断',
                                width: 55.w,
                                height: 28.w,
                                border: Border.all(
                                    width: 0.5, color: BColors.mainColor),
                                radius: 25.w,
                                bgColor: Colors.white,
                                titleColor: BColors.mainColor,
                                fontSize: 10.sp,
                                onTap: () {
                                  Get.to(() => FixedNavPage(), arguments: {
                                    'imageList': ['zczd'],
                                    'title': '资产诊断',
                                    'right': true
                                  });
                                },
                              ),
                            ],
                          )),
                      Positioned(
                          top: 90.w + 120.w + 70.w,
                          left: 24.w,
                          right: 24.w,
                          child: Container(
                            width: 1.sw,
                            height: 25.w,
                          ).withOnTap(onTap: () {
                            isMore = false;
                            isFz = false;
                            setState(() {});
                          })),
                      Positioned(
                          top: 78.w,
                          left: 12.w,
                          right: 12.w,
                          child: Container(
                            height: 55.w,
                            width: 1.sw,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container().withOnTap(onTap: () {
                                  isFz = false;
                                  setState(() {});
                                })),
                                Expanded(
                                    child: Container().withOnTap(onTap: () {
                                  isFz = true;
                                  setState(() {});
                                })),
                              ],
                            ),
                          ))
                    ],
                  ),
          )
        : Container(
            margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 6.w),
            child: Stack(
              children: [
                Image(image: 'mine_a_0'.png3x),
                Positioned(
                    top: 8.w,
                    left: 12.w,
                    child: Row(
                      children: [
                        BaseText(
                          text: '时间 $time',
                          fontSize: 11.sp,
                          color: Color(0xff646465),
                        ),

                        SizedBox(width: 6.w,),
                        if (isOpen)
                        RotatingWidget(
                          image: 'ic_home_ref'.png3x,
                          color: Colors.grey,
                          disCallBack: (){
                            time = DateUtil.formatDate(DateTime.now(), format:DateFormats.full);
                            setState(() {});
                          },
                        )
                      ],
                    )),
                Positioned(
                    top: 42.w,
                    left: 12.w,
                    right: 12.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            BaseText(
                              text: '我的资产负债',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 8.w, right:8.w),
                                child:Image(
                                  image: 'ic_tag_w'.png3x,
                                  width: 15.w,
                                  height: 15.w,
                                )

                            ).withOnTap(onTap: (){
                              showDialog(context: context, builder: (context) {
                                return const AlterTip2();
                              });
                            }),
                            Image(
                              image: isOpen
                                  ? 'ic_eye_open'.png3x
                                  : 'ic_eye_close'.png3x,
                              width: 18.w,
                              height: 18.w,
                            ).withOnTap(onTap: () {
                              isOpen = !isOpen;
                              setState(() {});
                            }),
                          ],
                        ),
                        BaseText(
                          text: '详情',
                          fontSize: 12.sp,
                          color: Color(0xff6F6F6F),
                        ).withOnTap(onTap: () => Routes.mineAssets.push)
                      ],
                    ).withContainer(
                      width: 1.sw,
                    )),
                Positioned(
                    top: 72.w,
                    left: 12.w,
                    right: 12.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 12.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BaseText(
                                  text: '总资产(元)',
                                  color: Color(0xff646465),
                                  fontSize: 12.sp,
                                ),
                                SizedBox(
                                  height: 6.w,
                                ),
                                BaseText(
                                  text: isOpen
                                      ? AppConfig.config.abcLogic.balance()
                                      : "****",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ).withOnTap(onTap: () {
                            isMore = true;
                            setState(() {
                            });
                          }),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 12.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                BaseText(
                                  text: '总负债(元)',
                                  color: Color(0xff646465),
                                  fontSize: 12.sp,
                                ),
                                SizedBox(
                                  height: 6.w,
                                ),
                                BaseText(
                                  text: isOpen ? '0.00' : '****',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ).withOnTap(onTap: () {
                            isFz = true;
                            isMore = true;
                            setState(() {

                            });
                          }),
                        ),
                      ],
                    ).withContainer(
                      height: 80.w,
                      width: 1.sw,
                    )),
                Positioned(
                    top: 72.w + 90.w,
                    left: 12.w,
                    right: 12.w,
                    child: Container(
                      width: 1.sw,
                      height: 0.5,
                      color: Color(0xffdedede),
                    )),
                Positioned(
                    top: 72.w + 100.w,
                    left: 24.w,
                    right: 24.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: 'ic_mine_l'.png,
                              width: 22.w,
                              height: 22.w,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            BaseText(
                              text: '给资产做个诊断，实现财富增值',
                              fontSize: 12.sp,
                              color: Color(0xff666666),
                            ),
                          ],
                        ),
                        AbcButton(
                          title: '去诊断',
                          width: 55.w,
                          height: 28.w,
                          border:
                              Border.all(width: 0.5, color: BColors.mainColor),
                          radius: 25.w,
                          bgColor: Colors.white,
                          titleColor: BColors.mainColor,
                          fontSize: 10.sp,
                          onTap: () {
                            Get.to(() => FixedNavPage(), arguments: {
                              'imageList': ['zczd'],
                              'title': '资产诊断',
                              'right': true
                            });
                          },
                        ),
                      ],
                    )),
                Positioned(
                    top: 90.w + 120.w,
                    left: 24.w,
                    right: 24.w,
                    child: Container(
                      width: 1.sw,
                      height: 25.w,
                    ).withOnTap(onTap: () {
                      isMore = true;
                      setState(() {});
                    })),
              ],
            ),
          );
  }

  String getChineseUnitSimple(double number) {
    if (number < 1000) {
      return '';
    }

    final absNumber = number.abs();
    final digits = absNumber.toStringAsFixed(0).length;

    if (digits <= 4) {
      return '千';
    } else if (digits <= 5) {
      return '万';
    } else if (digits <= 6) {
      return '十万';
    } else if (digits <= 7) {
      return '百万';
    } else if (digits <= 8) {
      return '千万';
    } else if (digits <= 9) {
      return '亿';
    } else if (digits <= 10) {
      return '十亿';
    } else if (digits <= 11) {
      return '百亿';
    } else if (digits <= 12) {
      return '千亿';
    } else {
      return '万亿';
    }
  }
}
