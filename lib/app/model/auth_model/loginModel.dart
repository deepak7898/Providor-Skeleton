import 'dart:convert';
LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));
String loginModelToJson(LoginModel data) => json.encode(data.toJson());
class LoginModel {
  LoginModel({
      bool? status, 
      String? message, 
      Data? data, 
      dynamic error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  bool? _status;
  String? _message;
  Data? _data;
  dynamic _error;

  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;
  dynamic get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['error'] = _error;
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? token,
    UserData? user,}){
    _token = token;
    _user = user;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? UserData.fromJson(json['user']) : null;
  }
  String? _token;
  UserData? _user;

  String? get token => _token;
  UserData? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

UserData userFromJson(String str) => UserData.fromJson(json.decode(str));
String userToJson(UserData data) => json.encode(data.toJson());
class UserData {
  UserData({
      num? userId, 
      String? name, 
      String? email, 
      String? password, 
      num? roleId, 
      dynamic contactNumber, 
      dynamic address, 
      dynamic profileImage, 
      dynamic digitalSignature, 
      dynamic udiseSchId, 
      dynamic teacherId, 
      dynamic clusterId, 
      dynamic blockId, 
      dynamic deoId, 
      String? status, 
      dynamic approvedBy, 
      String? createdAt,}){
    _userId = userId;
    _name = name;
    _email = email;
    _password = password;
    _roleId = roleId;
    _contactNumber = contactNumber;
    _address = address;
    _profileImage = profileImage;
    _digitalSignature = digitalSignature;
    _udiseSchId = udiseSchId;
    _teacherId = teacherId;
    _clusterId = clusterId;
    _blockId = blockId;
    _deoId = deoId;
    _status = status;
    _approvedBy = approvedBy;
    _createdAt = createdAt;
}

  UserData.fromJson(dynamic json) {
    _userId = json['user_id'];
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _roleId = json['role_id'];
    _contactNumber = json['contact_number'];
    _address = json['address'];
    _profileImage = json['profile_image'];
    _digitalSignature = json['digital_signature'];
    _udiseSchId = json['udise_sch_id'];
    _teacherId = json['teacher_id'];
    _clusterId = json['cluster_id'];
    _blockId = json['block_id'];
    _deoId = json['deo_id'];
    _status = json['status'];
    _approvedBy = json['approved_by'];
    _createdAt = json['created_at'];
  }
  num? _userId;
  String? _name;
  String? _email;
  String? _password;
  num? _roleId;
  dynamic _contactNumber;
  dynamic _address;
  dynamic _profileImage;
  dynamic _digitalSignature;
  dynamic _udiseSchId;
  dynamic _teacherId;
  dynamic _clusterId;
  dynamic _blockId;
  dynamic _deoId;
  String? _status;
  dynamic _approvedBy;
  String? _createdAt;

  num? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  num? get roleId => _roleId;
  dynamic get contactNumber => _contactNumber;
  dynamic get address => _address;
  dynamic get profileImage => _profileImage;
  dynamic get digitalSignature => _digitalSignature;
  dynamic get udiseSchId => _udiseSchId;
  dynamic get teacherId => _teacherId;
  dynamic get clusterId => _clusterId;
  dynamic get blockId => _blockId;
  dynamic get deoId => _deoId;
  String? get status => _status;
  dynamic get approvedBy => _approvedBy;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['role_id'] = _roleId;
    map['contact_number'] = _contactNumber;
    map['address'] = _address;
    map['profile_image'] = _profileImage;
    map['digital_signature'] = _digitalSignature;
    map['udise_sch_id'] = _udiseSchId;
    map['teacher_id'] = _teacherId;
    map['cluster_id'] = _clusterId;
    map['block_id'] = _blockId;
    map['deo_id'] = _deoId;
    map['status'] = _status;
    map['approved_by'] = _approvedBy;
    map['created_at'] = _createdAt;
    return map;
  }

}