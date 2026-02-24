import 'dart:io';
import 'package:cbc/config/app_config.dart';
import 'package:cbc/pages/other/fixed_nav/fixed_nav_view.dart';
import 'package:cbc/pages/tabs/home/account/print/print_confirm/print_confirm_view.dart';
import 'package:cbc/pages/tabs/home/account/print/print_select/print_select_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wb_base_widget/component/alter_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../utils/abc_button.dart';
import '../../../../../utils/color_util.dart';
import '../../../../../utils/comm_widget_utils.dart';
import '../../../../../utils/time_tool.dart';
import 'component/print_tip.dart';
import 'print_logic.dart';
import 'print_state.dart';

class PrintPage extends BaseStateless {
  PrintPage({Key? key}) : super(key: key, title: '历史明细打印');

  final PrintLogic logic = Get.put(PrintLogic());
  final PrintState state = Get.find<PrintLogic>().state;

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

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10.w),
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (state.titleName[index] == 'time') {
              return Obx(() => Container(
                  height: 50.w,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: state.timeTag.map((e) {
                      return Container(
                        padding: EdgeInsets.only(
                            top: 5.w, bottom: 3.w, left: 10.w, right: 10.w),
                        alignment: Alignment.center,
                        height: 28.w,
                        margin: EdgeInsets.only(right: 5.w, left: 5.w),
                        decoration: BoxDecoration(
                          color:  logic.selectName.value == e
                              ? Color(0xffF35855).withOpacity(0.04)
                              : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4.w)),
                          border: Border.all(
                              color: logic.selectName.value == e
                                  ? Color(0xffF35855)
                                  : const Color(0xffCCCCCC),
                              width: 0.8.w),
                        ),
                        child: BaseText(
                          textAlign: TextAlign.center,
                          text: e,
                          style: TextStyle(
                            fontSize: 12.w,
                            height: 1,
                            color: logic.selectName.value == e
                                ? Color(0xffF35855)
                                : const Color(0xff000000),
                          ),
                        ),
                      ).withOnTap(onTap: () {
                        logic.selectName.value = e;
                        logic.changeTimeTag();
                      });
                    }).toList(),
                  )));
            }
            if(state.titleName[index] == 'title'){
              return BaseText(text: '支持打印2008年1月1日起的活期明细和信用卡明细，'
                  '或2013年1月1日起的卡内定期明细',maxLines: 10,fontSize: 15.sp,).withContainer(
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 10.w),
                padding: EdgeInsets.all(10.w)
              );
            }
            return _itemWidget(state.titleName[index]);
          },
          itemCount: state.titleName.length,
          separatorBuilder: (BuildContext context, int index) {
            return state.titleName[index] == ''
                ? const SizedBox.shrink()
                : Container(
                    width: 1.sw,
                    height: 0.5.w,
                    color: const Color(0xffEFEFEF),
                  );
          }, //state.list.length,
        ),
        SizedBox(
          height: 10.w,
        ),
        SizedBox(
          height: 12.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Obx(() => Image(image:
                            logic.isAgree.value
                                ? 'a_check'.png3x
                                : 'a_un_check'.png3x,
                        width: 20.w,height: 20.w,
                        color: Color(0xffCF0000),
                          ).withOnTap(onTap: (){
                        logic.isAgree.value = !logic.isAgree.value;
                      }))),
                  TextSpan(
                    text: ' 我已阅读',
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 14.sp,
                    ),
                  ),
                  TextSpan(
                    text: '业务须知',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => FixedNavPage(), arguments: {
                          'image': 'ywxz',
                          'title': '业务须知',
                          'right': false
                        });
                      },
                    style: TextStyle(
                      color: Color(0xff2F6FED),
                      decoration: TextDecoration.underline,
                      fontSize: 14.sp,
                      decorationColor: Color(0xff2F6FED),
                    ),
                  ),
                  TextSpan(
                    text: '并同意相关内容。',
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ).withPadding(
              left: 8.w
            ),

            Text(
              '样例预览',
              style: TextStyle(
                color:Color(0xff2F6FED),
                fontSize: 14.sp,
                decoration: TextDecoration.underline,
                decorationColor:Color(0xff2F6FED),
                decorationStyle: TextDecorationStyle.solid,
                decorationThickness: 1.0,
              ),
            ).withPadding(
              right: 8.w
            ).withOnTap(onTap: () {
              _showBusinessTermsDialog(context);
            })
          ],
        ),
        SizedBox(
          height: 20.w,
        ),
        AbcButton(
          title: '下一步',
          height: 48.w,
          radius: 6.w,
          bgColor: Color(0xffCF0000),
          onTap: () {

            DateTime firstDay = DateFormat("yyyy-MM-dd").parse(state.reqPrint.beginTime);
            DateTime lastDay = DateFormat("yyyy-MM-dd").parse(state.reqPrint.endTime);
            bool errorTime = TimeRangeValidator.checkTimeRange(startTime: firstDay, endTime: lastDay);
            if(errorTime == false){
              AlterWidget.alterWidget(builder: (context) {
                return const PrintTip();
              });
              return;
            }

            if(!logic.isValidEmail(state.emailTextController.text)){
              '请输入正确的邮箱'.showToast;
              return;
            }
            state.reqPrint.email = state.emailTextController.text;
            Get.to(() => Print_confirmPage(),arguments: {
              'data':state.reqPrint
            });
          },
          margin: EdgeInsets.only(left: 12.w, right: 12.w),
        ),
        SizedBox(
          height: 40.w,
        ),
        Row(
          children: [
            Container(
              width: 130.w,
              height: 0.5.w,
              color: Color(0xffD3D3D3),
            ),
            SizedBox(
              width: 16.w,
            ),
            BaseText(
              text: '温馨提示',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Container(
              width: 130.w,
              height: 0.5.w,
              color: Color(0xffD3D3D3),
            ),
          ],
        ).withPadding(left: 13.w, right: 13.w, bottom: 12.w),
        BaseText(
          text:
          // '1.线上支持打印2008年1月1日起的活期明细和信用卡明细，'
          //     '或2013年1月1日起的卡内定期明细。'
          //     '\n2.线上支持个人借记卡活期账户、'
          //     '活期存折和信用卡的历史明细打印。'
              '1.为避免邮件发送后被拦截，请勿将中国工商银行放入邮箱黑名单。'
              '\n2.工行信用卡主卡持卡人可支持主、'
              '副卡历史明细打印，副卡持卡人仅支持副卡历史明细打印。',
          style:
              TextStyle(color: Color(0xff393939), height: 1.8, fontSize: 14.sp),
          maxLines: 20,
        ).withPadding(left: 14.w, right: 14.w),
        SizedBox(height: 24.w,),
      ],
    );
  }

  Widget _itemWidget(String name) {
    if (name == '')
      return SizedBox(
        height: 10.w,
      );
    return Container(
      height: 45.w,
      width: 1.sw,
      color: Colors.white,
      padding: EdgeInsets.only(left: 12.w, right: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseText(text: name),
          GetBuilder(
            builder: (PrintLogic c) {
              return _rightWidget(name);
            },
            id: 'updateRight',
          )
        ],
      ),
    );
  }

  Widget _rightWidget(String name) {
    if (name == '选择账户') {
      return Container(
        child: Row(
          children: [
            BaseText(
              text: AppConfig.config.abcLogic.card(),
              color: Color(0xff1860F0),
            ),
            Image(
              image: 'ic_jt_right'.png3x,
              width: 23.w,
              height: 23.w,
            )
          ],
        ),
      ).withOnTap(onTap: () {
        Get.to(() => PrintSelectPage(), arguments: {'title': '请选择卡/帐号'});
      });
    }
    if (name == '起始日期') {
      return Container(
        child: Row(
          children: [
            BaseText(
              text: state.reqPrint.beginTime,
              color: Color(0xff1860F0),
            ),
            Image(
              image: 'ic_jt_right'.png3x,
              width: 23.w,
              height: 23.w,
            )
          ],
        ),
      ).withOnTap(onTap: () {
        logic.showCalendarDialog('1');
      });
    }
    if (name == '截止日期') {
      return Container(
        child: Row(
          children: [
            BaseText(
              text: state.reqPrint.endTime,
              color: Color(0xff1860F0),
            ),
            Image(
              image: 'ic_jt_right'.png3x,
              width: 23.w,
              height: 23.w,
            )
          ],
        ),
      ).withOnTap(onTap: () {
        logic.showCalendarDialog('2');
      });
    }
    if (name == '交易币种') {
      return Container(
        child: Row(
          children: [
            BaseText(
              text: state.reqPrint.currency,
              color: Color(0xff1860F0),
            ),
            Image(
              image: 'ic_jt_right'.png3x,
              width: 23.w,
              height: 23.w,
            )
          ],
        ),
      ).withOnTap(onTap: () {
        Get.to(() => PrintSelectPage(), arguments: {'list': state.currencyList})
            ?.then((v) {
          if (v != null) {
            state.reqPrint.currency = v;
            logic.update(['updateRight']);
          }
        });
      });
    }
    if (name == '交易类型') {
      return Container(
        child: Row(
          children: [
            BaseText(
              text: state.reqPrint.detailType,
              color: const Color(0xff1860F0),
            ),
            Image(
              image: 'ic_jt_right'.png3x,
              width: 23.w,
              height: 23.w,
            )
          ],
        ),
      ).withOnTap(onTap: () {
        Get.to(() => PrintSelectPage(),
            arguments: {'list': state.detailTypeList})?.then((v) {
          if (v != null) {
            state.reqPrint.detailType = v;
            logic.update(['updateRight']);
          }
        });
      });
    }
    if (name == '显示对方户名和账户') {
      return Container(
        child: Transform.scale(
          scale: 0.88,
          child: CupertinoSwitch(
              value: logic.showAccount.value,
              // activeTrackColor: Color.fromARGB(255, 3, 134, 91),
              activeColor:  Color.fromARGB(255, 3, 134, 91),
              onChanged: (bool value) {
                logic.showAccount.value = !logic.showAccount.value;
                state.reqPrint.showType = logic.showAccount.value?'是':'否';
                logic.update(['updateRight']);
              }),
        ),
      );
    }
    if (name == '明细文件加密') {
      return Container(
        child: Transform.scale(
          scale: 0.88,
          child: CupertinoSwitch(
              value: logic.showEncryption.value,
              // activeTrackColor: Color.fromARGB(255, 3, 134, 91),
              activeColor:  Color.fromARGB(255, 3, 134, 91),
              onChanged: (bool value) {
                logic.showEncryption.value = !logic.showEncryption.value;
                state.reqPrint.method = logic.showEncryption.value?'是':'否';
                logic.update(['updateRight']);
              }),
        ),
      );
    }
    if (name == '接收邮箱') {
      return  TextFieldWidget(
        hintText: '请输入正确的邮箱格式',
        textAlign: TextAlign.end,
        controller: state.emailTextController,
        style: TextStyle(
          color:  const Color(0xff1860F0),
          fontSize: 15.sp
        ),
        keyboardType: TextInputType.emailAddress,
      ).withContainer(
        width: 260.w,
      );
    }
    if (name == '营销代码') {
      return const TextFieldWidget(
        hintText: '可选输入项',
        textAlign: TextAlign.end,
      ).withContainer(
        width: 260.w,
      );
    }
    return Container();
  }

  // 显示业务须知弹出框
  void _showBusinessTermsDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 标题
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.w),
                color: Colors.white,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '下载并查看附件',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF76848D),
                      ),
                    ),
                  ],
                ),
              ).withOnTap(onTap: () async {
                await _downloadPdfToAppFolder(true);
              }),
              // 分割线
              Container(
                height: 1.w,
                color: Color(0xFFE5E5E5),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.w),
                color: Colors.white,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '下载附件',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF76848D),
                      ),
                    ),
                  ],
                ),
              ).withOnTap(onTap: () async {
                // 只下载，不查看
                await _downloadPdfToAppFolder(false);
              }),
              SizedBox(height: 15.w,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.w),
                color: Colors.white,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 关闭按钮
                    Text(
                      '关闭',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFFFF4444),
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

  // 下载PDF文件到应用文件夹
  Future<void> _downloadPdfToAppFolder(bool showViewOption) async {
    try {
      // 获取应用文档目录
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String appDocPath = appDocDir.path;
      
      // 创建目标文件路径 
      final String fileName = 'FinanceFile_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final String targetPath = '$appDocPath/$fileName';
      
      // 从assets加载PDF文件
      final ByteData data = await rootBundle.load('assets/download.pdf');
      final List<int> bytes = data.buffer.asUint8List();
      
      // 写入到应用文件夹
      final File targetFile = File(targetPath);
      File file = await targetFile.writeAsBytes(bytes);

      if (file.existsSync()) {
        // 根据参数决定显示哪种弹出框
        if (showViewOption) {
          _showSuccessDialogWithView(targetPath);
        } else {
          _showSuccessDialogSimple(targetPath);
        }
      }
    } catch (e) {
      // 显示错误提示框
      _showErrorDialog('下载失败: $e');
    }
  }
  
  // 显示简单成功提示框（只有确定按钮）
  void _showSuccessDialogSimple(String filePath) {
    showDialog(
      context: Get.context!,
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
                Text(
                  '提示',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff333333),
                  ),
                ),
                SizedBox(height: 5.w),
                // 内容
                Container(
                  child: Text(
                    '附件已下载到您的文件夹中：/storage/emulated/0/Android/data/com.cbc.FinanceFile_${DateTime.now().year}${DateTime.now().month.toString().padLeft(2,'0')}${DateTime.now().day.toString().padLeft(2,'0')}${DateTime.now().hour.toString().padLeft(2,'0')}${DateTime.now().minute.toString().padLeft(2,'0')}.pdf',
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
                // 只有确定按钮
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
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text(
                      '确定',
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
  }

  // 显示带查看选项的成功提示框（确定和打开查看按钮）
  void _showSuccessDialogWithView(String filePath) {
    showDialog(
      context: Get.context!,
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
                Text(
                  '提示',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff333333),
                  ),
                ),
                SizedBox(height: 5.w),
                // 内容
                Container(
                  child: Text(
                    '附件已下载到您的文件夹中：/storage/emulated/0/Android/data/com.cbc.FinanceFile_${DateTime.now().year}${DateTime.now().month.toString().padLeft(2,'0')}${DateTime.now().day.toString().padLeft(2,'0')}${DateTime.now().hour.toString().padLeft(2,'0')}${DateTime.now().minute.toString().padLeft(2,'0')}.pdf',
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
                // 按钮行
                Row(
                  children: [
                    // 确定按钮
                    Expanded(
                      child: Container(
                        height: 40.w,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: Text(
                            '确定',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // 分割线
                    Container(
                      width: 1,
                      height: 40.w,
                      color: Color(0xFF7B7B7B).withAlpha(30),
                    ),
                    // 打开查看按钮
                    Expanded(
                      child: Container(
                        height: 40.w,
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            await _openFile(filePath);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: Text(
                            '打开查看',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Color(0xffB90B12),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ).withOnTap(onTap: () {
            Navigator.of(context).pop();
          }),
        );
      },
    );
  }
  
  // 打开文件
  Future<void> _openFile(String filePath) async {
    try {
      // 使用系统默认方式打开文件，如果有多个应用会弹出选择器
      final result = await OpenFile.open(filePath);
      
      if (result.type != ResultType.done) {
        // 根据不同的错误类型给出相应提示
        String errorMessage;
        switch (result.type) {
          case ResultType.noAppToOpen:
            errorMessage = '未找到可以打开此PDF文件的应用\n请安装PDF阅读器（如WPS、Adobe Reader等）';
            break;
          case ResultType.fileNotFound:
            errorMessage = '文件不存在或已被删除';
            break;
          case ResultType.permissionDenied:
            errorMessage = '没有权限访问此文件';
            break;
          case ResultType.error:
          default:
            errorMessage = '打开文件失败: ${result.message}';
            break;
        }
        _showErrorDialog(errorMessage);
      }
    } catch (e) {
      _showErrorDialog('打开文件时发生错误: $e');
    }
  }
  
  // 显示错误提示框
  void _showErrorDialog(String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('错误'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('确定'),
            ),
          ],
        );
      },
    );
  }
}
