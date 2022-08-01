class ApiUrls {
  static const String baseUrl = 'https://gigiapi.zanforthstaging.com/api/';

  //merchant auth urls
  static final login = Uri.parse('${baseUrl}login');
  static final merchantSignUp = Uri.parse('${baseUrl}merchantRegister');
  static final logOut = Uri.parse('${baseUrl}logout');
  static final getMerchantProfile = Uri.parse('${baseUrl}merchant/getProfile');

  //deal urls
  static final getSingleDeal = Uri.parse('${baseUrl}merchant/getDeal/');
  static final allDeals = Uri.parse(
      '${baseUrl}merchant/getDeals?limit=10000&page=1&returnType=customPagination&status=1&active=1');
  static final trendingDealsUrl = Uri.parse('${baseUrl}user/getTrendingDeals');
  static final userAllDeals = Uri.parse(
    '${baseUrl}user/getDeals?limit=10000&returnType=customPagination&timeSort=desc',
  );
  static final purchaseDeal = Uri.parse('${baseUrl}user/purchaseDeal');
  static final cartList = Uri.parse(
      '${baseUrl}user/getCustomerPurchasedDeals?limit=1000?returnType=customPagination');

  //whilist urls
  static final addToWishList = Uri.parse('${baseUrl}user/addToWishlist');
  static final getWishList =
      Uri.parse('${baseUrl}user/getWishlist?returnType=customPagination');

  //branch urls
  static final getAllBranches = Uri.parse(
      '${baseUrl}merchant/getBranches?limit=10&page=1&returnType=customPagination');

  //dash board stats urls
  static final getDashStats = Uri.parse('${baseUrl}merchant/getDashboardStats');

  //user profile urls
  static final getUserProf = Uri.parse('${baseUrl}user/getCurrentUser');
  static final userSignUp = Uri.parse('${baseUrl}userRegister');
  static final updateUserProfile = Uri.parse('${baseUrl}user/updateProfile');
  static final updatePreferences = Uri.parse('${baseUrl}user/updatePreference');
  static final updateUserPass = Uri.parse('${baseUrl}user/updatePassword');

  //verify account urls
  static final verifyAccount = Uri.parse('${baseUrl}verifyAccount');
  static final reSendCode = Uri.parse('${baseUrl}resendCode');

  //user merchant urls
  static final merchantList =
      Uri.parse('${baseUrl}user/getMerchants?returnType=customPagination');

  //category urls
  static final getAllCat = Uri.parse('${baseUrl}categoryAutoComplete');
}
