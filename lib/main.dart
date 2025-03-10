import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:teacherTMS/route/route_config.dart';
import 'package:teacherTMS/services/theme/theme_controller.dart';

import 'controller/dashboard_controller.dart';
import 'core/config/app_config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(

      MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => DashboardController()),],
      child:  const MyApp()));
}

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
   const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Provider.of<DashboardController>(context);
    return Consumer<DashboardController>(
      builder: (context, value, child) {
        return  MaterialApp.router(
          title: AppConfig.name,
          debugShowCheckedModeBanner: false,
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith( textScaleFactor: 0.94),
              child: child!,
            );
          },
          theme:dashboardController.darkTheme==true? AppThemes.darkTheme(context):AppThemes.lightTheme(context),
          routeInformationParser: RoutesConfig.router.routeInformationParser,
          routerDelegate: RoutesConfig.router.routerDelegate,
          routeInformationProvider: RoutesConfig.router.routeInformationProvider,

        );
      },

    );
  }
}




