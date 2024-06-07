class URL {
  // receiveTimeout
  static const Duration receiveTimeout = Duration(seconds: 30);
  // connectTimeout
  static const Duration connectionTimeout = Duration(seconds: 30);
  // rest of url
  static String baseURL = 'https://apptest.dokandemo.com/wp-json/';
  static String signIn = '${baseURL}jwt-auth/v1/token';
  static String register = '${baseURL}wp/v2/users/register';
}
