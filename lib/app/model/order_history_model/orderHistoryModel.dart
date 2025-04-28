import 'dart:convert';
OrderHistoryModel orderHistoryModelFromJson(String str) => OrderHistoryModel.fromJson(json.decode(str));
String orderHistoryModelToJson(OrderHistoryModel data) => json.encode(data.toJson());
class OrderHistoryModel {
  OrderHistoryModel({
      int? id, 
      String? isbnCode, 
      String? classLevel, 
      String? contentRcvYn, 
      String? contentPubRcv, 
      String? publisherName, 
      int? quantity, 
      int? remaining, 
      String? assignedDate, 
      String? subjectName, 
      String? mediumName, 
      bool? verify,}){
    _id = id;
    _isbnCode = isbnCode;
    _classLevel = classLevel;
    _contentRcvYn = contentRcvYn;
    _contentPubRcv = contentPubRcv;
    _publisherName = publisherName;
    _quantity = quantity;
    _remaining = remaining;
    _assignedDate = assignedDate;
    _subjectName = subjectName;
    _mediumName = mediumName;
    _verify = verify;
}

  OrderHistoryModel.fromJson(dynamic json) {
    _id = json['id'];
    _isbnCode = json['isbn_code'];
    _classLevel = json['class_level'];
    _contentRcvYn = json['content_rcv_yn'];
    _contentPubRcv = json['content_pub_rcv'];
    _publisherName = json['publisher_name'];
    _quantity = json['quantity'];
    _remaining = json['remaining'];
    _assignedDate = json['assigned_date'];
    _subjectName = json['subject_name'];
    _mediumName = json['medium_name'];
    _verify = json['verify'];
  }
  int? _id;
  String? _isbnCode;
  String? _classLevel;
  String? _contentRcvYn;
  String? _contentPubRcv;
  String? _publisherName;
  int? _quantity;
  int? _remaining;
  String? _assignedDate;
  String? _subjectName;
  String? _mediumName;
  bool? _verify;

  int? get id => _id;
  String? get isbnCode => _isbnCode;
  String? get classLevel => _classLevel;
  String? get contentRcvYn => _contentRcvYn;
  String? get contentPubRcv => _contentPubRcv;
  String? get publisherName => _publisherName;
  int? get quantity => _quantity;
  int? get remaining => _remaining;
  String? get assignedDate => _assignedDate;
  String? get subjectName => _subjectName;
  String? get mediumName => _mediumName;
  bool? get verify => _verify;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['isbn_code'] = _isbnCode;
    map['class_level'] = _classLevel;
    map['content_rcv_yn'] = _contentRcvYn;
    map['content_pub_rcv'] = _contentPubRcv;
    map['publisher_name'] = _publisherName;
    map['quantity'] = _quantity;
    map['remaining'] = _remaining;
    map['assigned_date'] = _assignedDate;
    map['subject_name'] = _subjectName;
    map['medium_name'] = _mediumName;
    map['verify'] = _verify;
    return map;
  }

}