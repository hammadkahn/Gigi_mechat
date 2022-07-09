class ApiUrls {
  static const String baseUrl = 'https://gigiapi.zanforthstaging.com/api/';

  //merchant auth urls
  static var login = Uri.parse('${baseUrl}login');
  static var merchantSignUp = Uri.parse('${baseUrl}merchantRegister');
  static var logOut = Uri.parse('${baseUrl}logout');

  //deal urls
  static var getSingleDeal = Uri.parse('${baseUrl}merchant/getDeal/');
  static var allDeals = Uri.parse(
      '${baseUrl}merchant/getDeals?limit=10&page=1&returnType=customPagination&status=1&active=1');

  //branch urls
  static var getAllBranches = Uri.parse(
      '${baseUrl}merchant/getBranches?limit=10&page=1&returnType=customPagination');
}
