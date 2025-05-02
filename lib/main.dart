import 'package:The_Book_Corporation/route/route_config.dart';
import 'package:The_Book_Corporation/services/database/local_database.dart';
import 'package:The_Book_Corporation/services/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'controller/auth_controller.dart';
import 'controller/common_controller.dart';
import 'controller/dashboard_controller.dart';
import 'controller/isbn_scan_controller.dart';
import 'controller/order_history_controller.dart';
import 'controller/publisher_controller.dart';
import 'controller/subject_controller.dart';
import 'controller/user_controller.dart';
import 'core/config/app_config.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DashboardController()),
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider(create: (context) => LocalDatabase()),
        ChangeNotifierProvider(create: (context) => UserController()),
        ChangeNotifierProvider(create: (context) => CommonController()),
        ChangeNotifierProvider(create: (context) => SubjectController()),
        ChangeNotifierProvider(create: (context) => PublisherController()),
        ChangeNotifierProvider(create: (context) => OrderHistoryController()),
        ChangeNotifierProvider(create: (context) => IsbnScanController()),
      ],
      child:  const MyApp()));
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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




//
// import 'package:The_Book_Corporation/services/theme/theme_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:get_storage/get_storage.dart';
//
// import 'package:The_Book_Corporation/route/route_config.dart';
// import 'package:The_Book_Corporation/services/database/local_database.dart';
// import 'controller/auth_controller.dart';
// import 'controller/common_controller.dart';
// import 'controller/dashboard_controller.dart';
// import 'controller/isbn_bloc/isbn_scan_details_bloc.dart';
// import 'controller/isbn_scan_controller.dart';
// import 'controller/order_history_controller.dart';
// import 'controller/publisher_controller.dart';
// import 'controller/subject_controller.dart';
// import 'controller/user_controller.dart';
// import 'core/config/app_config.dart';
//
// // Dummy ThemeCubit (BLoC Example)
// class ThemeCubit extends Cubit<bool> {
//   ThemeCubit() : super(false);
//
//   void toggleTheme() => emit(!state);
// }
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await GetStorage.init();
//
//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (_) => ThemeCubit()), // Added Bloc
//         BlocProvider<ISBNDetailsByScanBloc>(create: (context) => ISBNDetailsByScanBloc(),lazy: false),
//       ],
//       child: MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (context) => DashboardController()),
//           ChangeNotifierProvider(create: (context) => AuthController()),
//           ChangeNotifierProvider(create: (context) => LocalDatabase()),
//           ChangeNotifierProvider(create: (context) => UserController()),
//           ChangeNotifierProvider(create: (context) => CommonController()),
//           ChangeNotifierProvider(create: (context) => SubjectController()),
//           ChangeNotifierProvider(create: (context) => PublisherController()),
//           ChangeNotifierProvider(create: (context) => OrderHistoryController()),
//           ChangeNotifierProvider(create: (context) => IsbnScanController()),
//         ],
//         child:const MyApp(),
//       ),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp.router(
//       title: AppConfig.name,
//       debugShowCheckedModeBanner: false,
//       builder: (BuildContext context, Widget? child) {
//         return MediaQuery(
//           data: MediaQuery.of(context).copyWith(textScaleFactor: 0.94),
//           child: child!,
//         );
//       },
//       theme:  AppThemes.lightTheme(context),
//       routeInformationParser: RoutesConfig.router.routeInformationParser,
//       routerDelegate: RoutesConfig.router.routerDelegate,
//       routeInformationProvider: RoutesConfig.router.routeInformationProvider,
//     );
//   }
// }
