import 'package:cbc/pages/bill_loading/bill_loading_view.dart';
import 'package:cbc/pages/bill_more/bill_more_view.dart';
import 'package:cbc/pages/bill_of_range/bill_of_range_view.dart';
import 'package:cbc/pages/credit_report/credit_report_view.dart';
import 'package:cbc/pages/deposit/deposit_view.dart';
import 'package:cbc/pages/home_normal_more/home_normal_more_view.dart';
import 'package:cbc/pages/loan/loan_view.dart';
import 'package:cbc/pages/mine_assets/mine_assets_view.dart';
import 'package:cbc/pages/mine_follow/mine_follow_view.dart';
import 'package:cbc/pages/mine_more/mine_more_view.dart';
import 'package:cbc/pages/mine_service/mine_service_view.dart';
import 'package:cbc/pages/payment/payment_view.dart';
import 'package:cbc/pages/safe_manage/safe_manage_view.dart';
import 'package:cbc/pages/scan/scan_view.dart';
import 'package:cbc/pages/shared_present/shared_present_view.dart';
import 'package:cbc/pages/sqxyk/sqxyk_view.dart';
import 'package:cbc/pages/tabs/home/account/print/print_view.dart';
import 'package:cbc/pages/tabs/home/account/transfer/card_transfer/card_transfer_view.dart';
import 'package:cbc/pages/tabs/home/account/transfer/contract_detail/contract_detail_view.dart';
import 'package:cbc/pages/tabs/home/account/transfer/register_transfer/register_transfer_view.dart';
import 'package:cbc/pages/tabs/home/bill/bill_view.dart';
import 'package:cbc/pages/tabs/home/component/child/home_robot_detail/view.dart';
import 'package:cbc/pages/tabs/home/component/gyisc_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/index/index_view.dart';
import '../pages/login/login_view.dart';
import '../pages/message_center/message_center_view.dart';
import '../pages/other/image/image_view.dart';
import '../pages/other/web_view/web_view_view.dart';
import '../pages/scan/scan_receipt/scan_receipt_view.dart';
import '../pages/search/search_view.dart';
import '../pages/splash/splash_view.dart';
import '../pages/tabs/home/account/account_detail/account_detail_view.dart';
import '../pages/tabs/home/account/account_detail/more_query/more_query_view.dart';
import '../pages/tabs/home/account/print/print_progress/print_progress_detail/print_progress_detail_view.dart';
import '../pages/tabs/home/account/print/print_progress/print_progress_detail/print_progress_info/print_progress_info_view.dart';
import '../pages/tabs/home/account/print/print_progress/print_progress_view.dart';
import '../pages/tabs/home/account/transfer/huikuan/huikuan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.tabs,
      page: () => IndexPage(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.versionChange,
      page: () => ImagePage(
        title: '版本切换',
        image: 'bg_bbqh',
      ),
    ),
    GetPage(
      name: Routes.messageCenter,
      page: () => MessageCenterPage(),
    ),
    GetPage(
      name: Routes.messageManager,
      page: () => ImagePage(
        title: '消息管理',
        image: 'bg_xxgl',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF343D49),
      ),
    ),
    GetPage(
      name: Routes.mineService,
      page: () => MineServicePage(),
    ),
    GetPage(
      name: Routes.qrScan,
      page: () => ScanPage(),
    ),
    GetPage(
      name: Routes.deposit,
      page: () => DepositPage(),
    ),
    GetPage(
      name: Routes.virtualCollection,
      page: () => ImagePage(
        title: '数字藏品',
        image: 'img_szcp',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: true,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.loan,
      page: () => LoanPage(),
    ),
    GetPage(
      name: Routes.lifeFee,
      page: () => ImagePage(
        title: 'e缴费',
        image: 'bg_life_fee',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: true,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.mineAssets,
      page: () => MineAssetsPage(),
    ),
    GetPage(
      name: Routes.salaryManager,
      page: () => ImagePage(
        title: '工银薪管家',
        image: 'bg_salary_manager',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: true,
        isShare: true,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.nobleMetal,
      page: () => ImagePage(
        title: '贵金属',
        image: 'bg_noble_metal',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.realMetal,
      page: () => ImagePage(
        title: '金行家',
        image: 'bg_real_metal',
        navTitleColor: Colors.transparent,
        navBackColor: Colors.transparent,
        navChange: false,
        navBarColor: Colors.transparent,
        right: false,
      ),
    ),
    GetPage(
      name: Routes.carbonSpace,
      page: () => ImagePage(
        title: '碳空间',
        image: 'bg_carbon_space',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: true,
        right: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.hirePurchase,
      page: () => ImagePage(
        title: '分期付款',
        image: 'bg_hire_purchase',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.oldAgePension,
      page: () => ImagePage(
        title: '个人养老金',
        image: 'bg_old_age_pension',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: true,
        right: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.safeCenter,
      page: () => ImagePage(
        title: '安全中心',
        image: 'bg_safe_center',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.mineAssetsCollection,
      page: () => ImagePage(
        title: '我的资金自动归集',
        image: 'bg_mine_assets_collection',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.homeNormalMore,
      page: () => HomeNormalMorePage(),
    ),
    GetPage(
      name: Routes.sharedPresent,
      page: () => SharedPresentPage(),
    ),
    GetPage(
      name: Routes.commitFeedback,
      page: () => ImagePage(
        title: '评价与反馈',
        image: 'bg_pjyfk',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
        right: false,
        rightStrBtn: '意见反馈',
      ),
    ),
    GetPage(
      name: Routes.cloudSave,
      page: () => ImagePage(
        title: '云保管',
        image: 'bg_ybg',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
        right: true,
      ),
    ),
    GetPage(
      name: Routes.gongYinIDou,
      page: () => ImagePage(
        title: '工银i豆商城',
        image: 'gyidsc7',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
        right: true,
      ),
    ),
    GetPage(
      name: Routes.mineNormalMore,
      page: () => MineMorePage(),
    ),
    GetPage(
      name: Routes.billLoading,
      page: () => BillLoadingPage(),
    ),
    GetPage(
      name: Routes.billMore,
      page: () => BillMorePage(),
    ),
    GetPage(
      name: Routes.billOfRangeTime,
      page: () => BillOfRangePage(),
    ),
    GetPage(
      name: Routes.creditReport,
      page: () => CreditReportPage(),
    ),
    GetPage(
      name: Routes.progressStatus,
      page: () => ImagePage(
        title: '请选择查询进度',
        image: 'qxzcxjd',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.xykqy,
      page: () => ImagePage(
        title: '信用卡启用',
        image: 'xykqy',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.sjxszffw,
      page: () => ImagePage(
        title: '升级线上支付服务',
        image: 'sjxszffw',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.jzfq,
      page: () => ImagePage(
        title: '家装分期',
        image: 'jzfq',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.xjfq,
      page: () => ImagePage(
        title: '现金分期',
        image: 'xjfq',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.gyxykqy,
      page: () => ImagePage(
        title: '工银信用卡权益',
        image: 'gyxykqy',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.yjbk,
      page: () => ImagePage(
        title: '一键绑卡',
        image: 'yjbk',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.zhny,
      page: () => ImagePage(
        title: '账户能源',
        image: 'zhny',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.zcgh,
      page: () => InkWell(
        onTap: () => Get.back(),
        child: ImagePage(
          title: '',
          image: 'zcgh',
          navTitleColor: Colors.transparent,
          navChange: true,
          right: false,
          navBarColor: Colors.transparent,
      )),
    ),
    GetPage(
      name: Routes.cpxxcx,
      page: () => ImagePage(
        title: '产品信息查询',
        image: 'cpxxcx',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.whmm,
      page: () => ImagePage(
        title: '外汇买卖',
        image: 'whmm',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.jcgjs,
      page: () => ImagePage(
        title: '积存贵金属',
        image: 'jcgjs',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.zhwh,
      page: () => ImagePage(
        title: '账户外汇',
        image: 'zhwh',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.cf_gd,
      page: () => ImagePage(
        title: '更多',
        image: 'cf_gd',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.zsxq,
      page: () => ImagePage(
        title: '指数详情',
        image: 'zsxq',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.bcwd,
      page: () => ImagePage(
        title: '百城万店',
        image: 'bcwd',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.gxag,
      page: () => ImagePage(
        title: '工享爱购',
        image: 'gxag',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.gyidly,
      page: () => ImagePage(
        title: '新年新惊喜',
        image: 'gyidly',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        defNavTitleColor:Colors.white,
        navChange: true,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.xmly,
      page: () => ImagePage(
        title: '喜马拉雅',
        image: 'xmly',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.gyesb,
      page: () => ImagePage(
        title: '工银e社保',
        image: 'gyesb',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.mydy,
      page: () => ImagePage(
        title: '猫眼电影',
        image: 'mydy',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.sh_qb,
      page: () => ImagePage(
        title: '全部',
        image: 'sh_qb',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.gyidsc5,
      page: () => ImagePage(
        title: '工银i豆商城',
        image: 'gyidsc5',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.qbxyk,
      page: () => ImagePage(
        title: '全部信用卡',
        image: 'qbxyk',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.zhxffq,
      page: () => ImagePage(
        title: '综合消费分期',
        image: 'zhxffq',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.zggsyhsjwz,
      page: () => ImagePage(
        title: '中国工商银行手机网站',
        image: 'zggsyhsjwz',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.qxwsdkqy,
      page: () => ImagePage(
        title: '全新万事达权益',
        image: 'qxwsdkqy',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.xxsc,
      page: () => ImagePage(
        title: '星享事成',
        image: 'xxsc',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: true,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.dkesh,
      page: () => ImagePage(
        title: '打开e生活App',
        image: 'dkesh',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.sjyl,
      page: () => ImagePage(
        title: '6月升金有礼',
        image: 'sjyl',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.tsyl,
      page: () => ImagePage(
        title: "'碳'索有礼",
        image: 'tsyl',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.cfxb,
      page: () => ImagePage(
        title: "财富相伴 与您同行",
        image: 'cfxb',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.jjxq,
      page: () => ImagePage(
        title: "基金详情",
        image: 'jjxq',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.jhj,
      page: () => ImagePage(
        title: "金行家",
        image: 'jhj',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.mxjh,
      page: () => ImagePage(
        title: "梦想计划",
        image: 'jhdz',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.scrb,
      page: () => ImagePage(
        title: "市场日报",
        image: 'scrb',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
        right: false,
      ),
    ),
    GetPage(
      name: Routes.kcxq,
      page: () => ImagePage(
        title: "课程详情",
        image: 'kcxq',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.payDetail,
      page: () => ImagePage(
        title: '支付明细',
        image: 'bg_pay_detail',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
        right: false,
        rightStrBtn: '更多查询',
      ),
    ),
    GetPage(
      name: Routes.safeManage,
      page: () => SafeManagePage(),
    ),
    GetPage(
      name: Routes.allPayFunction,
      page: () => ImagePage(
        title: '全部功能',
        image: 'bg_all_pay_function',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.dayDayEarn,
      page: () => ImagePage(
        title: '天天盈',
        image: 'bg_day_day_earn',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.jidikuanghuan,
      page: () => ImagePage(
        title: '首页',
        image: 'jidikuanghuan',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
        right: false,
      ),
    ),
    GetPage(
      name: Routes.zichantisheng,
      page: () => ImagePage(
        title: '越升越有礼${DateTime.now().month}月',
        image: 'zichantisheng',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.a500,
      page: () => ImagePage(
        title: '',
        image: 'A500',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
        right: false,
      ),
    ),
    GetPage(
      name: Routes.nianzhongj,
      page: () => ImagePage(
        title: '年终奖打理指南',
        image: 'nianzhongj',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
        isShare: true,
      ),
    ),
    GetPage(
      name: Routes.gyisc,
      page: () => GyiscPage(),
    ),
    GetPage(
      name: Routes.payment,
      page: () => PaymentPage(),
    ),
    GetPage(
      name: Routes.mineFollow,
      page: () => MineFollowPage(),
    ),
    GetPage(
      name: Routes.pointsStore,
      page: () => ImagePage(
        title: '积分商城',
        image: 'img_jfsc',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
        right: true,
      ),
    ),
    GetPage(
      name: Routes.sqxyk,
      page: () => SqxykPage(),
    ),
    GetPage(
      name: Routes.insteadMoney,
      page: () => ImagePage(
        title: '立减金',
        image: 'img_ljj',
        jpg: true,
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
        right: true,
      ),
    ),
    GetPage(
      name: Routes.personalPoints,
      page: () => ImagePage(
        title: '个人综合积分',
        image: 'bg_grzhjf',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        navChange: false,
        navBarColor: Colors.white,
        right: false,
        rightStrBtn: '查询明细',
      ),
    ),
    GetPage(
      name: Routes.personalLevel,
      page: () => ImagePage(
        title: '工银礼享家',
        image: 'bg_gylxj',
        navTitleColor: const Color(0xFF607483),
        navBackColor: const Color(0xFF607483),
        defNavTitleColor:Colors.white,
        navChange: true,
        navBarColor: Colors.white,
      ),
    ),
    GetPage(
      name: Routes.personalInfo,
      page: () => PaymentPage(),
    ),
    GetPage(
      name: Routes.cardTransferPage,
      page: () => CardTransferPage(),
    ),
    GetPage(
      name: Routes.registerTransferPage,
      page: () => RegisterTransferPage(),
    ),
    GetPage(
      name: Routes.printPage,
      page: () => PrintPage(),
    ),
    GetPage(
      name: Routes.billPage,
      page: () => BillPage(),
    ),
    GetPage(
      name: Routes.mreQueryPage,
      page: () => MoreQueryPage(),
    ),
    GetPage(
      name: Routes.accountDetailPage,
      page: () => AccountDetailPage(),
    ),
    GetPage(
      name: Routes.huiKuanPage,
      page: () => HuiKuanPage(),
    ),
    GetPage(
      name: Routes.searchPage,
      page: () => SearchPage(),
    ),
    GetPage(
      name: Routes.printProgressPage,
      page: () => PrintProgressPage(),
    ),
    GetPage(
      name: Routes.printProgressDetailPage,
      page: () => Print_progress_detailPage(),
    ),
    GetPage(
      name: Routes.printProgressInfoPage,
      page: () => Print_progress_infoPage(),
    ),

    GetPage(
      name: Routes.splashPage,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.scanReceiptPage,
      page: () => ScanReceiptPage(),
    ),
    GetPage(
      name: Routes.wbViewPage,
      page: () => WebViewPage(),
    ),
    GetPage(name: Routes.homeRobotPage, page: () => RobotPage()),
    GetPage(
      name: Routes.contractDetailPage,
      page: () => ContractDetailPage(),
    ),
  ];
}
