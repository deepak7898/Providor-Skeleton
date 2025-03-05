// import 'package:flutter/material.dart';
// import 'package:hive_flutter/adapters.dart';
// import '../../core/config/app_config.dart';
//
// class LocalDatabase extends ChangeNotifier {
//   ///Hive Database Initialization....
//
//   static Future initialize() async {
//     await Hive.initFlutter();
//     await Hive.openBox(AppConfig.databaseName);
//   }
//
//   ///Hive Database Box....
//   Box database = Hive.box(AppConfig.databaseName);
//
//   ///Access Local Database data...
//
//   late String? name = database.get('name');
//   late String? email = database.get('email');
//   late String? mobile = database.get('mobile');
//   late String? profilePhoto = database.get('photoUrl');
//   late String? accessToken = database.get('accessToken');
//   late String? deviceToken = database.get('deviceToken');
//
//   late double? latitude = database.get('latitude');
//   late double? longitude = database.get('longitude');
//   late String? themeMode = database.get('themeMode');
//
//   setDeviceToken(String? token) {
//     deviceToken = token;
//     database.put('deviceToken', token ?? '');
//     notifyListeners();
//   }
//
//   setThemeMode({required ThemeMode mode}) {
//     themeMode = mode.name;
//     database.put('themeMode', themeMode ?? '');
//     notifyListeners();
//   }
//
//   setLatLong(
//     double? latitude,
//     double? longitude,
//   ) {
//     latitude = latitude;
//     longitude = longitude;
//     database.put('latitude', latitude);
//     database.put('longitude', longitude);
//     notifyListeners();
//   }
// }
