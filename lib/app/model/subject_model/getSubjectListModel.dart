import 'dart:convert';
GetSubjectListModel getSubjectListModelFromJson(String str) => GetSubjectListModel.fromJson(json.decode(str));
String getSubjectListModelToJson(GetSubjectListModel data) => json.encode(data.toJson());
class GetSubjectListModel {
  GetSubjectListModel({
      bool? status, 
      String? message, 
      dynamic count, 
      List<Data>? data, 
      dynamic error,}){
    _status = status;
    _message = message;
    _count = count;
    _data = data;
    _error = error;
}

  GetSubjectListModel.fromJson(dynamic json) {
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
  dynamic _count;
  List<Data>? _data;
  dynamic _error;

  bool? get status => _status;
  String? get message => _message;
  dynamic get count => _count;
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
      String? name, 
      String? classLevel, 
      int? medium, 
      dynamic districtId, 
      String? bookType, 
      String? createdAt, 
      String? mediumName, 
      int? publisherId, 
      String? bookIsbnPath, 
      int? assignmentId, 
      String? currentSession, 
      String? frontCoverUrl, 
      String? backCoverUrl, 
      String? contentPdfUrl, 
      int? bookId, 
      String? isbnCode,}){
    _id = id;
    _name = name;
    _classLevel = classLevel;
    _medium = medium;
    _districtId = districtId;
    _bookType = bookType;
    _createdAt = createdAt;
    _mediumName = mediumName;
    _publisherId = publisherId;
    _bookIsbnPath = bookIsbnPath;
    _assignmentId = assignmentId;
    _currentSession = currentSession;
    _frontCoverUrl = frontCoverUrl;
    _backCoverUrl = backCoverUrl;
    _contentPdfUrl = contentPdfUrl;
    _bookId = bookId;
    _isbnCode = isbnCode;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _classLevel = json['class_level'];
    _medium = json['medium'];
    _districtId = json['district_id'];
    _bookType = json['book_type'];
    _createdAt = json['created_at'];
    _mediumName = json['medium_name'];
    _publisherId = json['publisher_id'];
    _bookIsbnPath = json['book_isbn_path'];
    _assignmentId = json['assignment_id'];
    _currentSession = json['current_session'];
    _frontCoverUrl = json['front_cover_url'];
    _backCoverUrl = json['back_cover_url'];
    _contentPdfUrl = json['content_pdf_url'];
    _bookId = json['book_id'];
    _isbnCode = json['isbn_code'];
  }
  int? _id;
  String? _name;
  String? _classLevel;
  int? _medium;
  dynamic _districtId;
  String? _bookType;
  String? _createdAt;
  String? _mediumName;
  int? _publisherId;
  String? _bookIsbnPath;
  int? _assignmentId;
  String? _currentSession;
  String? _frontCoverUrl;
  String? _backCoverUrl;
  String? _contentPdfUrl;
  int? _bookId;
  String? _isbnCode;

  int? get id => _id;
  String? get name => _name;
  String? get classLevel => _classLevel;
  int? get medium => _medium;
  dynamic get districtId => _districtId;
  String? get bookType => _bookType;
  String? get createdAt => _createdAt;
  String? get mediumName => _mediumName;
  int? get publisherId => _publisherId;
  String? get bookIsbnPath => _bookIsbnPath;
  int? get assignmentId => _assignmentId;
  String? get currentSession => _currentSession;
  String? get frontCoverUrl => _frontCoverUrl;
  String? get backCoverUrl => _backCoverUrl;
  String? get contentPdfUrl => _contentPdfUrl;
  int? get bookId => _bookId;
  String? get isbnCode => _isbnCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['class_level'] = _classLevel;
    map['medium'] = _medium;
    map['district_id'] = _districtId;
    map['book_type'] = _bookType;
    map['created_at'] = _createdAt;
    map['medium_name'] = _mediumName;
    map['publisher_id'] = _publisherId;
    map['book_isbn_path'] = _bookIsbnPath;
    map['assignment_id'] = _assignmentId;
    map['current_session'] = _currentSession;
    map['front_cover_url'] = _frontCoverUrl;
    map['back_cover_url'] = _backCoverUrl;
    map['content_pdf_url'] = _contentPdfUrl;
    map['book_id'] = _bookId;
    map['isbn_code'] = _isbnCode;
    return map;
  }

}