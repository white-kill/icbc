import 'package:cbc/config/app_config.dart';
import 'package:cbc/pages/tabs/mine/diagnosis/diagnosis_view.dart';
import 'package:cbc/routes/app_pages.dart';
import 'package:cbc/utils/comm_widget_utils.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../utils/abc_button.dart';
import '../../utils/color_util.dart';
import '../other/fixed_nav/fixed_nav_view.dart';
import 'mine_assets_logic.dart';
import 'mine_assets_state.dart';

class MineAssetsPage extends BaseStateless {
  MineAssetsPage({super.key});

  final MineAssetsLogic logic = Get.put(MineAssetsLogic());
  final MineAssetsState state = Get
      .find<MineAssetsLogic>()
      .state;

  @override
  Widget? get titleWidget =>
      BaseText(
        text: '我的资产',
        fontSize: 17.w,
        color: const Color(0xFF607483),
      );

  @override
  Widget? get leftItem =>
      Container(
        padding: EdgeInsets.symmetric(vertical: 12.w),
        child:
        Image(image: 'ic_left_back'.png3x, color: const Color(0xFF5B6A80)),
      ).withOnTap(onTap: () => Get.back());

  @override
  List<Widget>? get rightAction =>
      [
        Image(image: 'ic_nav_service'.png3x, width: 20.w, height: 20.w)
            .withPadding(right: 20.w)
            .withOnTap(onTap: () => Routes.mineService.push),
        CommWidgetUtils.getMoreIcon(),
      ];

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder<MineAssetsLogic>(builder: (logic) {
      return Stack(
        children: [
          Container(
            width: 1.sw,
            height: 330.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff8c673a),
                  Color(0xff8c673a).withOpacity(0.5),
                  Color(0xff8c673a).withOpacity(0.05),
                ],
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.w))),
                margin: EdgeInsets.all(10.w),
                padding: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 15.w, bottom: 10.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            BaseText(
                              text: '时间 ${state.time}',
                              fontSize: 11.sp,
                              color: Color(0xff646465),
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            RotatingWidget(
                              image: 'ic_home_ref'.png3x,
                              // color: Colors.grey,
                              disCallBack: () {
                                state.time = DateUtil.formatDate(
                                    DateTime.now(),
                                    format: DateFormats.full);
                                logic.update();
                              },
                            )
                          ],
                        ),
                        Image(
                          image: logic.isOpen
                              ? 'ic_eye_open'.png3x
                              : 'ic_eye_close'.png3x,
                          width: 18.w,
                          height: 18.w,
                        ).withOnTap(onTap: () {
                          logic.isOpen = !logic.isOpen;
                          logic.update();
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 18.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.05),
                          borderRadius:
                          BorderRadius.all(Radius.circular(8.w))),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: 4.w, right: 12.w),
                            height: 50,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 6.w,
                                      height: 10.w,
                                      color: BColors.mainColor,
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    BaseText(
                                      text: '总资产(元)',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                BaseText(
                                  text:
                                  logic.isOpen ?
                                  AppConfig.config.abcLogic.balance() : "****",
                                  style: TextStyle(
                                      fontSize: logic.isOpen ? 18.sp : 22.sp,
                                      fontWeight:
                                      logic.isOpen ? FontWeight.normal :
                                      FontWeight.bold,
                                      letterSpacing: logic.isOpen ? 0.sp : 2.sp,
                                      fontFamily: 'PingFangSC',
                                      color:
                                      logic.isOpen ?
                                      Color(0xff3333333) : Colors.black),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.w, right: 8.w),
                            width: 1.sw,
                            height: 0.5,
                            color: Color(0xffdedede),
                          ),
                          SizedBox(
                            height: 16.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  BaseText(
                                    text: '资产占比',
                                    color: logic.selectOne
                                        ? Color(0xff97593b)
                                        : Colors.black,
                                  ),
                                  SizedBox(
                                    height: 8.w,
                                  ),
                                  Container(
                                    width: 35.w,
                                    height: 2.w,
                                    color: logic.selectOne
                                        ? Color(0xff97593b)
                                        : Colors.transparent,
                                  )
                                ],
                              ).withOnTap(onTap: () {
                                logic.selectOne = true;
                                logic.update();
                              }),
                              SizedBox(
                                width: 60.w,
                              ),
                              Column(
                                children: [
                                  BaseText(
                                    text: '资产详情',
                                    color: !logic.selectOne
                                        ? Color(0xff97593b)
                                        : Colors.black,
                                  ),
                                  SizedBox(
                                    height: 8.w,
                                  ),
                                  Container(
                                    width: 35.w,
                                    height: 2.w,
                                    color: !logic.selectOne
                                        ? Color(0xff97593b)
                                        : Colors.transparent,
                                  )
                                ],
                              ).withOnTap(onTap: () {
                                logic.selectOne = false;
                                logic.update();
                              }),
                            ],
                          ),
                          logic.selectOne
                              ? Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 80.w,
                                    height: 80.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(60.w)),
                                      color: Color(0xff97593b),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Container(
                                    width: 4.w,
                                    height: 4.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.w)),
                                      color: Color(0xff97593b),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  BaseText(text: '存款')
                                ],
                              ),
                              BaseText(
                                text: logic.isOpen ? '100.00%' : "****",
                                fontSize:
                                logic.isOpen ?
                                12.sp : 14.sp,
                                fontFamily: "PingFangSC",
                                color:
                                logic.isOpen ?
                                Color(0xff666666): Colors.black,
                              )
                            ],
                          ).withPadding(
                            top: 45.w,
                            bottom: 45.w,
                            left: 20.w,
                            right: 12.w,
                          )
                              : Container(
                            padding: EdgeInsets.only(
                                top: 35.w,
                                bottom: 25.w,
                                left: 12.w,
                                right: 12.w),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    BaseText(
                                      text: '存款',
                                      fontSize: 13.sp,
                                      color: Color(0xff333333),
                                    ),
                                    Row(
                                      children: [
                                        BaseText(
                                          text:
                                          logic.isOpen ?
                                          AppConfig
                                              .config.abcLogic
                                              .balance() : "****",
                                          fontSize: logic.isOpen ? 12.sp : 14.sp,
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
                                      text:
                                      logic.isOpen ?
                                      '100.00%' : "****",
                                      fontSize: logic.isOpen ? 10.sp : 12.sp,
                                      color: BColors.mainColor,
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Expanded(
                                        child: Container(
                                          height: 2.w,
                                          margin: EdgeInsets.only(
                                              right: 8.w, left: 2.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2.w)),
                                            color: BColors.mainColor,
                                          ),
                                        ))
                                  ],
                                )
                              ],
                            ),   
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.w,
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.05),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.w),
                        ),
                      ),
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
                            height: 30.w,
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
                      ),
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 4.w, right: 12.w),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.05),
                          borderRadius:
                          BorderRadius.all(Radius.circular(8.w))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 6.w,
                                height: 10.w,
                                color: Color(0xff35827D),
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              BaseText(
                                text: '总负债(元)',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          BaseText(
                            text:
                            logic.isOpen ?
                            '0.00' : "****",
                            style: TextStyle(
                                fontSize: logic.isOpen ? 18.sp : 22.sp,
                                fontWeight:
                                logic.isOpen ? FontWeight.normal :
                                FontWeight.bold,
                                letterSpacing: logic.isOpen ? 0.sp : 2.sp,
                                fontFamily: 'PingFangSC',
                                color:
                                logic.isOpen ?
                                Color(0xff3333333) : Colors.black),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.w))),
                margin: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                ),
                padding: EdgeInsets.only(
                  left: 10.w,
                  right: 10.w,
                  top: 15.w,
                  bottom: 10.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      text: '其他',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: state.otherListNames.map((e) {
                        return Container(
                          padding: EdgeInsets.only(
                              left: 15.w, top: 20.w, bottom: 20.w, right: 15.w),
                          child: Column(
                            children: [
                              Image(
                                image:
                                'ic_zc${state.otherListNames.indexOf(e)}'.png,
                                width: 26.w,
                                height: 26.w,
                              ),
                              SizedBox(height: 8.w,),
                              BaseText(text: e, style: TextStyle(
                                  fontSize: 12.sp
                              ),)
                            ],
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              BaseText(text: '说明', fontSize: 14.sp)
                  .withPadding(left: 12.w, top: 20.w, bottom: 16.w),
              BaseText(
                text: '1.本页面不展示账户余额为0的产品信息。'
                    '\n2.资产负债数据更新可能存在延时等情况，数据仅供参考，不作为对账凭证。'
                    '\n3.基金资产包含购买在途资金和赎回在途基金，实际到账金额=赎回总额-手续费，数据仅供参考，以公司确认净值为准。'
                    '\n4.您持有的理财产品资产计算规则：理财产品资产=产品份额产品最新净值，购买期在途资产=购买金额，赎回期在途资产在未确认前，仅使用该产品最新净值展示产品市值，数据仅供参考，最终请以理财公司确认净值为准。'
                    '\n5.您持有的信托产品资产计算规则：信托产品资产=产品份额产品最新净值，购买期在途资产=购买金额，赎回期在途资产在未确认前，仅使用该产品最新净值展示产品市值，上述数据仅供参考，最终请以信托公司确认数据为准。'
                    '\n6.您持有的实物贵金属、实物贵金属递延、积存贵金属、账户贵金属、账户贵金属指数、账户外汇、账户外汇指数、外汇双向、账户能源、账户农产品、账户基本金属等产品，您的持仓数据可能随市场行情变化产生浮动盈亏。'
                    '\n7.您持有的活期、定期、理财、基金等外币资产将按照当前的外汇银行买入价折算成人民币计算资产负债数据，数据仅供参考。'
                    '\n8.如果您是柜面注册电子银行客户，资产、负债数据为您在工行的全部账户的数据合计；如果您是自助注册电子银行客户，资产、负债数据仅包含您注册电子银行账户的数据合计。'
                    '\n9.若您持有“B股银证转账”、“银期转账”产品，本页面无法向您展现该类别产品的相关信息。'
                    '\n10.“其他”栏目资产未纳入总资产数据及饼图资产数据分析，您可以点击对应菜单进行查询。'
                    '\n11.您持有的养老金资产包括企业年金、团养产品、养老衍生产品、以及个人养老金（包含您使用个人养老金购买的基金、理财、保险、存款等产品）。'
                    '\n12.您的信用卡欠款将按照当前的外汇银行卖出价折算成人民币计算资产负债数据，数据仅供参考。信用卡欠款不包含分期未入账本金及其利息。',
                style: TextStyle(
                    color: Color(0xff393939), height: 2, fontSize: 11.sp),
                maxLines: 100,
              ).withPadding(left: 14.w, right: 14.w)
            ],
          )
        ],
      );
    });
  }
}
