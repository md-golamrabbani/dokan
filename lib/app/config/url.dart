class URL {
  // receiveTimeout
  static const Duration receiveTimeout = Duration(seconds: 60);
  // connectTimeout
  static const Duration connectionTimeout = Duration(seconds: 60);
  // rest of url
  static String baseURL = 'http://apptest.dokandemo.com/wp-json/';
  static String login = '${baseURL}jwt-auth/v1/token';
  static String register = '${baseURL}wp/v2/users/register';
}
