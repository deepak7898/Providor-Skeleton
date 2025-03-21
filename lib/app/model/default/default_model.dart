import 'dart:convert';

DefaultModel defaultModelFromJson(String str) => DefaultModel.fromJson(json.decode(str));

String defaultModelToJson(DefaultModel data) => json.encode(data.toJson());

class DefaultModel {
  DefaultModel({
    this.status,
    this.message,
    this.totalDuration,
  });

  DefaultModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    totalDuration = json['totalDuration'];
  }

  bool? status;
  String? message;
  String? totalDuration;

  DefaultModel copyWith({
    bool? status,
    String? message,
    String? totalDuration,
  }) =>
      DefaultModel(
        status: status ?? status,
        message: message ?? this.message,
        totalDuration: totalDuration ?? this.totalDuration,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['totalDuration'] = totalDuration;
    return map;
  }
}
