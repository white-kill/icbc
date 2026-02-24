part of 'app_pages.dart';

class Routes {
  Routes._();

  static const tabs = '/tabs';

  static const login = '/login';

  static const versionChange = '/versionChange'; // 版本切换
  static const messageCenter = '/messageCenter'; // 消息中心
  static const messageManager = '/messageManager'; // 消息管理
  static const mineService = '/mineService'; // 我的客服
  static const qrScan = '/qrScan'; // 扫码
  static const deposit = '/deposit'; // 存款
  static const virtualCollection = '/virtualCollection'; // 数字藏品
  static const loan = '/loan'; // 贷款
  static const lifeFee = '/lifeFee'; // 生活缴费
  static const mineAssets = '/mineAssets'; // 我的资产
  static const salaryManager = '/salaryManager'; // 薪管家
  static const nobleMetal = '/nobleMetal'; // 贵金属
  static const realMetal = '/realMetal';
  static const carbonSpace = '/carbonSpace'; // 碳空间
  static const hirePurchase = '/hirePurchase'; // 分期付款
  static const oldAgePension = '/oldAgePension'; // 个人养老金
  static const safeCenter = '/safeCenter'; // 安全中心
  static const mineAssetsCollection = '/mineAssetsCollection'; // 自动归集
  static const homeNormalMore = '/homeNormalMore'; // 首页更多
  static const mineNormalMore = '/mineNormalMore'; // 我的更多
  static const billLoading = '/billLoading'; // 更多账单
  static const billMore = '/billMore'; // 更多账单
  static const billOfRangeTime = '/billOfRangeTime'; // 账单（年度、月度）
  static const creditReport = '/creditReport'; // 信用报告
  static const progressStatus = '/progressStatus'; // 办理进度
  // static const productHistory = '/productHistory'; // 产品足迹
  static const sharedPresent = '/sharedPresent'; // 分享有礼
  static const commitFeedback = '/commitFeedback'; // 评价与反馈
  // static const useSealInfo = '/useSealInfo'; // 用印信息验证
  static const cloudSave = '/cloudSave'; // 云保管
  // static const electronicsApply = '/electronicsApply'; // 电子发票申请
  // static const foreignIncomeReport = '/foreignIncomeReport'; // 涉外收入申报
  static const gongYinIDou = '/gongYinIDou'; // 工银i豆
  static const xykqy = '/xykqy'; // 信用卡启用
  static const sjxszffw = '/xykqy'; // 升级线上支付
  static const jzfq = '/jzfq'; // 家装分期
  static const xjfq = '/xjfq'; // 现金分期
  static const gyxykqy = '/gyxykqy'; // 工银信用卡权益
  static const yjbk = '/yjbk'; // 一键绑卡
  static const zhny = '/zhny'; // 账户能源
  static const zcgh = '/zcgh'; // 资产规划
  static const cpxxcx = '/cpxxcx'; // 产品信息查询
  static const whmm = '/whmm'; // 外汇买卖
  static const jcgjs = '/jcgjs'; // 存积贵金属
  static const zhwh = '/zhwh'; // 账户外汇
  static const cf_gd = '/cf_gd'; // 财富-更多
  static const zsxq = '/zsxq'; // 指数详情
  static const bcwd = '/bcwd'; // 百城万店
  static const gxag = '/gxag'; // 工享爱购
  static const gyidly = '/gyidly'; // 工银i豆乐园
  static const xmly = '/xmly'; // 喜马拉雅
  static const gyesb = '/gyesb'; // 工银e社保
  static const mydy = '/mydy'; // 猫眼电影
  static const sh_qb = '/sh_qb'; // 生活-全部
  static const gyidsc5 = '/gyidsc5'; // 工银i豆商城5
  static const qbxyk = '/qbxyk'; // 全部信用卡
  static const zhxffq = '/zhxffq'; // 综合消费分期
  static const zggsyhsjwz = '/zggsyhsjwz'; // 中国工商银行手机网站
  static const qxwsdkqy = '/qxwsdkqy'; // 全新万事达卡权益
  static const xxsc = '/xxsc'; // 星享事成
  static const dkesh = '/dkesh'; // 打开e生活App
  static const sjyl = '/sjyl'; // 6月升金有礼
  static const tsyl = '/tsyl'; // 碳索有礼
  static const cfxb = '/cfxb'; // 财富相伴
  static const jjxq = '/jjxq'; // 基金详情
  static const jhj = '/jhj'; // 金行家
  static const mxjh = '/mxjh'; // 梦想计划
  static const scrb = '/scrb'; // 市场日报
  static const kcxq = '/kcxq'; // 课程详情

  static const payDetail = '/payDetail'; // 支付明细
  static const safeManage = '/safeManager'; // 安全管理
  static const allPayFunction = '/allPayFunction'; // 支付-全部功能

  static const dayDayEarn = '/dayDayEarn'; // 天天盈
  static const jidikuanghuan = '/jidikuanghuan'; // 极地狂欢
  static const zichantisheng = '/zichantisheng'; // 资产提升
  static const a500 = '/a500'; // A500
  static const nianzhongj = '/nianzhongj'; // 年终奖
  static const gyisc = '/gyisc'; // 工银i豆商城
  static const payment = '/payment'; // 支付
  static const mineFollow = '/mineFollow'; // 我的关注

  static const setting = '/setting';
  static const personalInfo = '/personalInfo';
  static const personalPoints = '/personalPoints'; // 个人综合积分
  static const pointsStore = '/pointsStore'; // 积分商城
  static const sqxyk = '/sqxyk'; // 申请信用卡
  static const insteadMoney = '/insteadMoney'; // 立减金
  static const personalLevel = '/personalLevel'; // 工银礼享家
  static const cardTransferPage = '/cardTransferPage'; // 境内汇款
  static const registerTransferPage = '/registerTransferPage'; // 注册账户转账
  static const printPage = '/printPage'; // 明细打印
  static const billPage = '/billPage'; // 收支列表
  static const mreQueryPage = '/mreQueryPage'; // 更多筛选
  static const accountDetailPage = '/accountDetailPage'; //明细查询
  static const huiKuanPage = '/huiKuanPage'; //汇款明细
  static const searchPage = '/searchPage'; //搜索
  static const printProgressPage = '/printProgressPage'; //办理进度
  static const printProgressDetailPage = '/printProgressDetailPage'; //订单详情
  static const printProgressInfoPage = '/printProgressInfoPage'; //进度详情
  static const splashPage = '/splashPage'; //进度详情
  static const scanReceiptPage = '/scanReceiptPage'; //进度详情
  static const wbViewPage = '/wbViewPage'; //进度详情
  static const homeRobotPage = '/homeRobotPage';
  static const contractDetailPage = '/contractDetailPage'; //收款人详情
}

extension RoutesStringExtension on String {
  Future? get push => Get.toNamed(this);
}
