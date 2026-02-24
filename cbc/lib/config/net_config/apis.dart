class Apis {

  static const login = '/auth/api/login';

  ///用户信息
  static const memberInfo = '/serviceicbc/member/info';

  ///查询明细
  static const detailsQuery = '/serviceicbc/bill/page';

  ///联系人列表
  static const contactsList = '/serviceicbc/contacts/list';

  ///银行列表
  static const bankList = '/serviceicbc/bank/list';

  ///查询收支列表-单个时间查询
  static const billPagePayment = '/serviceicbc/bill/pagePayment';

  ///查询转账列表
  static const transferPage = '/serviceicbc/bill/transferPage';

  ///分页查询账单打印申请列表
  static const applyPageList = '/serviceicbc/flowExport/applyPage';

  ///账单信息打印
  static const print = '/serviceicbc/flowExport/print';

  ///银行卡转账
  static const transfer = '/serviceicbc/bill/transfer';



  /// 获取月度账单
  static const getMonthBill = '/serviceicbc/bill/monthBill';

  /// 获取月度账单列表
  static const getMonthBillList = '/serviceicbc/bill/monthBillList';

  /// 获取月度账单列表
  static const billAnalysis = '/serviceicbc/bill/analysis';

  /// 获取月度账单分类账单列表
  static const monthBilCategoryList = '/serviceicbc/bill/monthBilCategoryList';


}