class ApiUrls {
  static const String baseUrl = 'https://gigiapi.zanforthstaging.com/api/';

  //merchant auth urls
  static var login = Uri.parse('${baseUrl}login');
  static var merchantSignUp = Uri.parse('${baseUrl}merchantRegister');
  static var logOut = Uri.parse('${baseUrl}logout');
  static var getMerchantProfile = Uri.parse('${baseUrl}merchant/getProfile');

  //deal urls
  static var getSingleDeal = Uri.parse('${baseUrl}merchant/getDeal/');
  static var allDeals = Uri.parse(
      '${baseUrl}merchant/getDeals?limit=10&page=1&returnType=customPagination&status=1&active=1');
  static var trendingDealsUrl = Uri.parse('${baseUrl}user/getTrendingDeals');
  static var userAllDeals = Uri.parse(
      '${baseUrl}user/getDeals?limit=10&page=1&returnType=customPagination&priceSort=desc&startingPrice=0&endingPrice=500&timeSort=desc&searchText=Food');

  //branch urls
  static var getAllBranches = Uri.parse(
      '${baseUrl}merchant/getBranches?limit=10&page=1&returnType=customPagination');

  //dash board stats urls
  static var getDashStats = Uri.parse('${baseUrl}merchant/getDashboardStats');

  //user profile urls
  static var getUserProf = Uri.parse('${baseUrl}user/getCurrentUser');
  static var userSignUp = Uri.parse('${baseUrl}userRegister');

  //verify account urls
  static var verifyAccount = Uri.parse('${baseUrl}verifyAccount');
  static var reSendCode = Uri.parse('${baseUrl}resendCode');

  //category urls
  static var getAllCat = Uri.parse('${baseUrl}categoryAutoComplete');
}
