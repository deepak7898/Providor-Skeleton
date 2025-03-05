import 'dart:convert';

DefaultModel defaultModelFromJson(String str) => DefaultModel.fromJson(json.decode(str));

String defaultModelToJson(DefaultModel data) => json.encode(data.toJson());

class DefaultModel {
  DefaultModel({
    this.success,
    this.message,
    this.totalDuration,
  });

  DefaultModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    totalDuration = json['totalDuration'];
  }

  bool? success;
  String? message;
  String? totalDuration;

  DefaultModel copyWith({
    bool? success,
    String? message,
    String? totalDuration,
  }) =>
      DefaultModel(
        success: success ?? success,
        message: message ?? this.message,
        totalDuration: totalDuration ?? this.totalDuration,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['totalDuration'] = totalDuration;
    return map;
  }
}
