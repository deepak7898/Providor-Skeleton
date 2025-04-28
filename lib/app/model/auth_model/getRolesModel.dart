import 'dart:convert';
GetRolesModel getRolesModelFromJson(String str) => GetRolesModel.fromJson(json.decode(str));
String getRolesModelToJson(GetRolesModel data) => json.encode(data.toJson());
class GetRolesModel {
  GetRolesModel({
      bool? status, 
      String? message, 
      List<Data>? data, 
      dynamic error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  GetRolesModel.fromJson(dynamic json) {

    _status = json['success'];
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
    map['success'] = _status;
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
      num? roleId, 
      String? roleName, 
      num? hierarchyLevel,}){
    _roleId = roleId;
    _roleName = roleName;
    _hierarchyLevel = hierarchyLevel;
}

  Data.fromJson(dynamic json) {
    _roleId = json['role_id'];
    _roleName = json['role_name'];
    _hierarchyLevel = json['hierarchy_level'];
  }
  num? _roleId;
  String? _roleName;
  num? _hierarchyLevel;

  num? get roleId => _roleId;
  String? get roleName => _roleName;
  num? get hierarchyLevel => _hierarchyLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role_id'] = _roleId;
    map['role_name'] = _roleName;
    map['hierarchy_level'] = _hierarchyLevel;
    return map;
  }

}