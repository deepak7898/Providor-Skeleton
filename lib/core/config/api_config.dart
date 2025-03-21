

class ApiConfig {
  ///API Configurations..

  static const domainName = 'http://10.62.1.46:5000/api/v1/';
  static const String version = '/api/leaveManagment';
  static const String baseUrl = domainName;
  static const String mapsBaseUrl = 'https://maps.googleapis.com/maps/api';




  ///auth

  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String users = 'users';
  static const String roles = 'auth/roles';
  // static const String privacyPolicyUrl = '${baseUrl}privacy-policy';

  static Map<String, String> defaultHeaders() {
    return {};
  }
}

