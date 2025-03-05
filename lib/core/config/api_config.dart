

class ApiConfig {
  ///API Configurations..

  static const domainName = 'http://117.250.147.169:4000';
  static const String version = '/api/leaveManagment';
  static const String baseUrl = '$domainName$version';
  static const String mapsBaseUrl = 'https://maps.googleapis.com/maps/api';

  // static const String privacyPolicyUrl = '${baseUrl}privacy-policy';

  static Map<String, String> defaultHeaders() {
    return {};
    // return {'Authorization': 'Bearer ${LocalDatabase().accessToken}'};
  }
}

