

class ApiConfig {
  ///API Configurations..

  static const domainName = 'http://10.62.1.46:5000/api/v1/auth';
  static const String version = '/api/leaveManagment';
  static const String baseUrl = domainName;
  static const String mapsBaseUrl = 'https://maps.googleapis.com/maps/api';




  ///auth

  static const String login = '/login';
  static const String register = '/register';
  static const String roles = '/roles';
  // static const String privacyPolicyUrl = '${baseUrl}privacy-policy';

  static Map<String, String> defaultHeaders() {
    return {};
  }
}

