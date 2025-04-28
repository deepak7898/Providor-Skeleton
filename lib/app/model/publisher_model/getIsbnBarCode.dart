import 'dart:convert';
GetIsbnBarCode getIsbnBarCodeFromJson(String str) => GetIsbnBarCode.fromJson(json.decode(str));
String getIsbnBarCodeToJson(GetIsbnBarCode data) => json.encode(data.toJson());
class GetIsbnBarCode {
  GetIsbnBarCode({
      int? id, 
      int? assignmentId, 
      String? isbnCode, 
      String? barcodePath, 
      String? generatedAt,}){
    _id = id;
    _assignmentId = assignmentId;
    _isbnCode = isbnCode;
    _barcodePath = barcodePath;
    _generatedAt = generatedAt;
}

  GetIsbnBarCode.fromJson(dynamic json) {
    _id = json['id'];
    _assignmentId = json['assignment_id'];
    _isbnCode = json['isbn_code'];
    _barcodePath = json['barcode_path'];
    _generatedAt = json['generated_at'];
  }
  int? _id;
  int? _assignmentId;
  String? _isbnCode;
  String? _barcodePath;
  String? _generatedAt;

  int? get id => _id;
  int? get assignmentId => _assignmentId;
  String? get isbnCode => _isbnCode;
  String? get barcodePath => _barcodePath;
  String? get generatedAt => _generatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['assignment_id'] = _assignmentId;
    map['isbn_code'] = _isbnCode;
    map['barcode_path'] = _barcodePath;
    map['generated_at'] = _generatedAt;
    return map;
  }

}