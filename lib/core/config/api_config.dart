

class ApiConfig {
  ///API Configurations..

  // static const domainName = 'http://10.62.1.111:5000/api/v1/';/// ashish
  static const domainName = 'https://vsk.cg.gov.in/tbc/api/v1/'; /// aman
  static const forImage = 'http://10.62.1.97:5000/';
  static const String version = '/api/leaveManagment';
  static const String baseUrl = domainName;
  static const String mapsBaseUrl = 'https://maps.googleapis.com/maps/api';

  ///auth

  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String users = 'users';
  static const String approve = 'users/approve/';
  static const String roles = 'auth/roles';
  static const String deleteUser = 'users/';
  static const String getSubjectList = 'subjects';
  static const String getAssignPublisherList = 'subjects/publisher';
  static const String getOrderList = 'subjects/order';
  static const String getDistrictList = 'filter/district-list';
  static const String getMediumList = 'filter/medium-list';
  static const String deleteAndEditSubjectList = 'subjects/';
  static const String getPublisher = 'publisher';
  static const String generateISBN = 'isbn/';
  static const String subjectAssigned = 'subject-assign/';
  static const String deleteSubjectAssigned = 'subject-assign/';
  static const String getIsbn = 'isbn/';
  static const String bookAssign = 'book-assign';
  static const scanISBNGetDetails = "isbn/getISBNDetails/";


  // static const String privacyPolicyUrl = '${baseUrl}privacy-policy';

  static Map<String, String> defaultHeaders() {
    return {};
  }
}

