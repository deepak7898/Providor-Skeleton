import 'dart:convert';
GetUserModel getUserModelFromJson(String str) => GetUserModel.fromJson(json.decode(str));
String getUserModelToJson(GetUserModel data) => json.encode(data.toJson());
class GetUserModel {
  GetUserModel({
      bool? status, 
      String? message, 
      List<Data>? data, 
      dynamic error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  GetUserModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _error = json['error'];
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
  dynamic _error;

  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;
  dynamic get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['error'] = _error;
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? userId, 
      String? name, 
      String? email, 
      int? roleId, 
      String? status,}){
    _userId = userId;
    _name = name;
    _email = email;
    _roleId = roleId;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _name = json['name'];
    _email = json['email'];
    _roleId = json['role_id'];
    _status = json['status'];
  }
  int? _userId;
  String? _name;
  String? _email;
  int? _roleId;
  String? _status;

  int? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  int? get roleId => _roleId;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['name'] = _name;
    map['email'] = _email;
    map['role_id'] = _roleId;
    map['status'] = _status;
    return map;
  }

}