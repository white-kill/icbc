import 'package:cbc/config/app_config.dart';
import 'package:cbc/pages/other/fixed_nav/fixed_nav_view.dart';
import 'package:cbc/pages/tabs/home/account/print/print_progress/print_progress_detail/print_progress_detail_view.dart';
import 'package:cbc/utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../../../config/model/progress_list_model.dart';
import '../../../../../../../routes/app_pages.dart';
import '../print_progress_detail/print_progress_info/print_progress_info_view.dart';

class ProgressItemWidget extends StatefulWidget {
  final ProgressListList model;
  const ProgressItemWidget({super.key, required this.model});

  @override
  State<ProgressItemWidget> createState() => _ProgressItemWidgetState();
}

class _ProgressItemWidgetState extends State<ProgressItemWidget> {
  List titleNames = [
    '分享',
    '再办一笔',
    '评价',
    '订单详情',
  ];

  void jumpPage(String name){
    if(name == '再办一笔') Routes.printPage.push;
    if(name == '订单详情') Get.to(() => Print_progress_detailPage(),arguments: {
      'model':widget.model.detail,
    });
    if(name == '评价') {
      Get.to(() => FixedNavPage(), arguments: {
        'image': 'pj',
        'title': '订单评价',
        'right': false
      });
    }
    if(name == '分享') {
      _showBusinessTermsDialog(context);
    }
  }


  void _showBusinessTermsDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 标题
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.w),
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.sp)
                ),
                child:
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '分享到',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.w,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20.w,),

                        Column(
                          children: [
                            Image(image: "wechat".png, width: 40.w,),
                            Text(
                              '微信好友',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20.w,),
                        Column(
                          children: [
                            Image(image: "wechat_line".png, width: 40.w,),
                            Text(
                              '微信朋友圈',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.w,),
                  ],
                )
              ).withOnTap(onTap: () async {
              }),
              SizedBox(height: 15.w,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.sp),
                ),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 关闭按钮
                    Text(
                      '取消',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFF989898),
                      ),
                    ).withOnTap(onTap: () {
                      Navigator.of(context).pop();
                    }),
                  ],
                ),
              ),

              SizedBox(height: 20.w),
              // 底部安全区域
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        );
      },
    );
  }





  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BaseText(
          text: widget.model.createTime,
          style: TextStyle(
          fontSize: 13.sp,
          color: Color(0xff999999)
        ),).withContainer(
          height: 40.w,
          padding: EdgeInsets.only(top: 6.w,left: 12.w),
          alignment: Alignment.centerLeft
        ),
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        image: 'print_progress'.png3x,
                        width: 20.w,
                        height: 20.w,
                      ),
                      SizedBox(width: 4.w,),
                      BaseText(
                        text: '历史明细打印',
                        color: Color(0xff333333),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      BaseText(
                        text: '已发送',
                        color: BColors.mainColor,
                      ),
                      SizedBox(width: 6.w,),
                      Image(
                        image: 'ic_tag_w'.png3x,
                        width: 15.w,
                        height: 15.w,
                      ),
                    ],
                  ).withOnTap(onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: 280.w,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: 15.w),

                                // 标题
                                BaseText(
                                  text: '提示',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff333333),
                                  ),
                                ),
                                SizedBox(height: 5.w),
                                // 内容
                                Container(
                                  child: BaseText(
                                    text: '由于业务高峰期，可能造成网络拥堵，邮件实际送达时间以您电子邮箱接收的时间为准。',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      height: 1.4,
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 5,
                                  ),
                                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                                ),
                                SizedBox(height: 12.w),
                                Container(
                                  width: double.maxFinite,
                                  height: 1,
                                  color: Color(0xFF7B7B7B).withAlpha(30),
                                ),
                                // 确定按钮
                                Container(
                                  width: double.infinity,
                                  height: 40.w,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    child: BaseText(
                                      text: '确定',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Color(0xffB90B12),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ).withOnTap(onTap: () {
                            Navigator.of(context).pop();
                          }),
                        );
                      },
                    );
                  }),
                ],
              ).withContainer(
                height: 45.w,
                padding: EdgeInsets.only(left: 25.w,right: 12.w)
              ),
              Container(
                width: 1.sw,
                height: 0.5.w,
                color: const Color(0xffCBCBCB),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.w,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BaseText(text: '账户:${AppConfig.config.abcLogic.card()}',
                            color: Color(0xff777777),fontSize: 12.w,),
                          SizedBox(height: 4.w,),
                          BaseText(text: '起止日期:${widget.model.dateTimeRange}',
                            color: Color(0xff777777),fontSize: 12.w,),
                        ],
                      ),
                      Image(image: 'ic_jt_right'.png3x,width: 22.w,height: 22.w,),
                    ],
                  ).withOnTap(onTap: (){
                    Get.to(() => Print_progress_infoPage(),arguments: {
                      'model':widget.model.detail
                    });
                  }),
                  SizedBox(height: 10.w,),
                ],
              ).withPadding(left: 12.w,right: 12.w),
              Container(
                width: 1.sw,
                height: 0.5.w,
                color: const Color(0xffCBCBCB),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: titleNames.map((e) {
                  return Container(
                    height: 24.w,
                    padding: EdgeInsets.only(left: 8.w,right: 8.w,top: 2.w,bottom: 2.w),
                    margin: EdgeInsets.only(right: 10.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5.w,color: Color(0xff666666)),
                      borderRadius: BorderRadius.all(Radius.circular(20.w))
                    ),
                    child: BaseText(
                      text: e,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xff666666),
                      ),
                    ),
                  ).withOnTap(onTap: ()=> jumpPage(e));
                }).toList(),
              ).withContainer(
                height: 50.w,
                width: 1.sw,
              ),
            ],
          ),
        )
      ],
    );
  }
}
