import 'dart:convert';
GetMediumModel getMediumModelFromJson(String str) => GetMediumModel.fromJson(json.decode(str));
String getMediumModelToJson(GetMediumModel data) => json.encode(data.toJson());
class GetMediumModel {
  GetMediumModel({
      bool? status, 
      String? message, 
      int? count, 
      List<Data>? data, 
      dynamic error,}){
    _status = status;
    _message = message;
    _count = count;
    _data = data;
    _error = error;
}

  GetMediumModel.fromJson(dynamic json) {
    _status = json['success'];
    _message = json['message'];
    _count = json['count'];
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
  int? _count;
  List<Data>? _data;
  dynamic _error;

  bool? get status => _status;
  String? get message => _message;
  int? get count => _count;
  List<Data>? get data => _data;
  dynamic get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _status;
    map['message'] = _message;
    map['count'] = _count;
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
      int? id, 
      int? mediumCd, 
      String? mediumName,}){
    _id = id;
    _mediumCd = mediumCd;
    _mediumName = mediumName;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _mediumCd = json['medium_cd'];
    _mediumName = json['medium_name'];
  }
  int? _id;
  int? _mediumCd;
  String? _mediumName;

  int? get id => _id;
  int? get mediumCd => _mediumCd;
  String? get mediumName => _mediumName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['medium_cd'] = _mediumCd;
    map['medium_name'] = _mediumName;
    return map;
  }

}