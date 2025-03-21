import 'dart:convert';

/// Convert JSON string to `LoginModel`
LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

/// Convert `LoginModel` to JSON string
String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final bool? status;
  final String? message;
  final Data? data;
  final dynamic error;

  LoginModel({
    this.status,
    this.message,
    this.data,
    this.error,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: json['data'] != null ? Data.fromJson(json['data']) : null,
    error: json['error'],
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
    'error': error,
  };
}
/// Model for `Data`
class Data {
  final String? token;
  final UserData? user;
  Data({
    this.token,
    this.user,
  });


  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json['token'] as String?,
    user: json['user'] != null ? UserData.fromJson(json['user']) : null,
  );


  Map<String, dynamic> toJson() => {
    'token': token,
    'user': user?.toJson(),
  };
}


class UserData {
  final int? userId;
  final String? name;
  final String? email;
  final String? password;
  final int? roleId;
  final String? contactNumber;
  final String? address;
  final String? profileImage;
  final String? digitalSignature;
  final String? udiseSchId;
  final String? teacherId;
  final String? clusterId;
  final String? blockId;
  final String? deoId;
  final String? status;
  final String? approvedBy;
  final DateTime? createdAt;

  UserData({
    this.userId,
    this.name,
    this.email,
    this.password,
    this.roleId,
    this.contactNumber,
    this.address,
    this.profileImage,
    this.digitalSignature,
    this.udiseSchId,
    this.teacherId,
    this.clusterId,
    this.blockId,
    this.deoId,
    this.status,
    this.approvedBy,
    this.createdAt,
  });

  /// Factory constructor to create `UserData` from JSON
  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    userId: json['user_id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    roleId: json['role_id'] as int?,
    contactNumber: json['contact_number']?.toString(),
    address: json['address']?.toString(),
    profileImage: json['profile_image']?.toString(),
    digitalSignature: json['digital_signature']?.toString(),
    udiseSchId: json['udise_sch_id']?.toString(),
    teacherId: json['teacher_id']?.toString(),
    clusterId: json['cluster_id']?.toString(),
    blockId: json['block_id']?.toString(),
    deoId: json['deo_id']?.toString(),
    status: json['status'] as String?,
    approvedBy: json['approved_by']?.toString(),
    createdAt: json['created_at'] != null
        ? DateTime.parse(json['created_at'])
        : null,
  );

  /// Convert `UserData` instance to JSON
  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'name': name,
    'email': email,
    'password': password,
    'role_id': roleId,
    'contact_number': contactNumber,
    'address': address,
    'profile_image': profileImage,
    'digital_signature': digitalSignature,
    'udise_sch_id': udiseSchId,
    'teacher_id': teacherId,
    'cluster_id': clusterId,
    'block_id': blockId,
    'deo_id': deoId,
    'status': status,
    'approved_by': approvedBy,
    'created_at': createdAt?.toIso8601String(),
  };
}
