import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';


import '../../core/config/api_config.dart';

import 'exception_handler.dart';

String decodeQueryParameter({required Map<String, String>? body}) {
  String formattedData = '';
  List<String>? bodyList = [];

  if (body != null) {
    body.forEach((key, value) {
      bodyList.add('&$key=$value');
    });
    formattedData = bodyList.join('').replaceFirst('&', '?');
  }

  if (formattedData.isNotEmpty) {
    debugPrint('Query Params are :- $formattedData');
  }
  return formattedData;
}

class ApiService {
  static const int timeOutDuration = 40;

  ///Seconds
  Map<String, String> defaultHeaders() {
    return {'Content-Type': 'application/json'};
  }
  Future<http.Client> createHttpClient() async {
    final ioc = HttpClient()
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true; // Bypass SSL
    return IOClient(ioc);
  }
  ///1) Get Request...

  Future<dynamic> get({
    required String endPoint,
    String? baseUrl,
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
    bool? showError,
  }) async {
    String url = (baseUrl ?? ApiConfig.baseUrl) + endPoint;
    var uri = Uri.parse('$url${decodeQueryParameter(body: queryParameters)}');

    try {
      var response = await http.get(uri, headers: headers ?? defaultHeaders()).timeout(const Duration(seconds: timeOutDuration));
           print('check resonce ${response.body}');
      return ErrorHandler.processResponse(response: response, showError: showError);
      // return response.body;
    } catch (e, s) {
      return ErrorHandler.catchError(e, s, showError);
    }
  }

  ///2) POST Request...

  Future<dynamic> post({
    required String endPoint,
    String? baseUrl,
    Map<String, String>? headers,
    Object? body,
    bool? showError,
  }) async {
    String url = (baseUrl ?? ApiConfig.baseUrl) + endPoint;
    var uri = Uri.parse(url);
    // var client = await createHttpClient();
    try {

      final response = await http.post(uri, headers: headers ?? defaultHeaders(), body: jsonEncode(body)).timeout(const Duration(seconds: timeOutDuration));
      return ErrorHandler.processResponse(response: response, showError: showError);
    } catch (e, s) {

      return ErrorHandler.catchError(e, s, showError);
    }
  }

  ///3) PUT Request...

  Future<dynamic> put({
    required String endPoint,
    String? baseUrl,
    Map<String, String>? headers,
    Object? body,
    bool? showError,
  }) async {
    String url = (baseUrl ?? ApiConfig.baseUrl) + endPoint;
    var uri = Uri.parse(url);

    try {
      final response = body == null
          ? await http.put(uri, headers: headers ?? defaultHeaders())
          : await http
          .put(uri, headers: headers ?? defaultHeaders(), body: body)
          .timeout(const Duration(seconds: timeOutDuration));

      return ErrorHandler.processResponse(response: response, showError: showError);
    } catch (e, s) {
      return ErrorHandler.catchError(e, s, showError);
    }
  }

  ///4) Patch Request...

  Future<dynamic> patch({
    required String endPoint,
    String? baseUrl,
    Map<String, String>? headers,
    Object? body,
    bool? showError,
  }) async {
    String url = (baseUrl ?? ApiConfig.baseUrl) + endPoint;
    var uri = Uri.parse(url);

    try {
      final response = await http
          .patch(uri, headers: headers ?? defaultHeaders(), body: body)
          .timeout(const Duration(seconds: timeOutDuration));

      return ErrorHandler.processResponse(response: response, showError: showError);
    } catch (e, s) {
      return ErrorHandler.catchError(e, s, showError);
    }
  }

  ///5) MultiPart  Request...

  Future<dynamic> multiPart({
    required String endPoint,
    required Map<String, String> body,
    String? baseUrl,
    Map<String, String>? headers,
    List<MultiPartData>? multipartFile,
    bool? showError,
  }) async {
    String url = (baseUrl ?? ApiConfig.baseUrl) + endPoint;
    var uri = Uri.parse(url);
    try {
      var request = http.MultipartRequest('POST', uri);
      request.fields.addAll(body);
      if (multipartFile != null) {
        for (var element in multipartFile) {
          debugPrint('Multipart... Field ${element.field}: FilePath ${element.filePath}');
          if (element.field != null && element.filePath != null) {
            request.files.add(await http.MultipartFile.fromPath('${element.field}', '${element.filePath}'));
          }
        }
      }
      request.headers.addAll(headers ?? defaultHeaders());
      http.StreamedResponse response = await request.send();
      return ErrorHandler.processResponse(response: response, showError: showError);
    } catch (e, s) {
      return ErrorHandler.catchError(e, s, showError);
    }
  }
}

class MultiPartData {
  MultiPartData({
    required this.field,
    required this.filePath,
  });

  String? field;
  String? filePath;

  factory MultiPartData.fromJson(Map<String, dynamic> json) => MultiPartData(
    field: json['field'],
    filePath: json['filePath'],
  );

  Map<String, dynamic> toJson() => {
    'field': field,
    'filePath': filePath,
  };
}
