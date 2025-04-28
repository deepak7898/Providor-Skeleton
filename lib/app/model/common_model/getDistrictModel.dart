import 'dart:convert';
GetDistrictModel getDistrictModelFromJson(String str) => GetDistrictModel.fromJson(json.decode(str));
String getDistrictModelToJson(GetDistrictModel data) => json.encode(data.toJson());
class GetDistrictModel {
  GetDistrictModel({
      bool? success, 
      String? message, 
      int? count, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _count = count;
    _data = data;
}

  GetDistrictModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _count = json['count'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  int? _count;
  List<Data>? _data;

  bool? get success => _success;
  String? get message => _message;
  int? get count => _count;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['count'] = _count;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? districtCd, 
      String? districtName,}){
    _id = id;
    _districtCd = districtCd;
    _districtName = districtName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _districtCd = json['district_cd'];
    _districtName = json['district_name'];
  }
  int? _id;
  String? _districtCd;
  String? _districtName;

  int? get id => _id;
  String? get districtCd => _districtCd;
  String? get districtName => _districtName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['district_cd'] = _districtCd;
    map['district_name'] = _districtName;
    return map;
  }

}