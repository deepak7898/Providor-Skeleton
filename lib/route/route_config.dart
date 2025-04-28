import 'package:The_Book_Corporation/app/view/auth/register_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app/view/auth/login_view.dart';
import '../app/view/dashBoard/dashBoard.dart';
import '../app/view/onBoarding_View/OnBoarding_view.dart';
import '../app/view/order_book_history/book_history.dart';
import '../app/view/publisher/publisher.dart';
import '../app/view/splash_view/splash_view.dart';
import '../app/view/subject/add_subject.dart';
import '../app/view/subject/subject_list.dart';
import '../app/view/user_as_publisher/add_user.dart';
import '../app/view/user_as_publisher/user.dart';
import '../services/database/local_database.dart';
import '../services/theme/theme_controller.dart';
import 'route_paths.dart';

class RoutesConfig {
  ///1)  Route Config...

  static final GoRouter _router = GoRouter(
    initialLocation:Routs.splashView,
    routes: [
      GoRoute(
        name: Routs.onBoarding,
        path: Routs.onBoarding,
        pageBuilder: (context, state) {
          return customTransitionPage(
            state: state,
            child: const OnBoardingView(),
          );
        },
      ),
      GoRoute(
        name: Routs.loginView,
        path: Routs.loginView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const LoginView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0), // Right to Left Transition
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        name: Routs.addSubject,
        path: Routs.addSubject,
        pageBuilder: (context, state) {
          AddSubject? data = state.extra as AddSubject?;
          return CustomTransitionPage(

            child:  AddSubject(name:data?.name ,mediumName:data?.mediumName,className: data?.className,bookId: data?.bookId,bookType: data?.bookType,district: data?.district,editType: data?.editType,),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0), // Right to Left Transition
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        name: Routs.publisher,
        path: Routs.publisher,
        pageBuilder: (context, state) {
          AddSubject? data = state.extra as AddSubject?;
          return CustomTransitionPage(

            child:  const Publisher(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0), // Right to Left Transition
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        name: Routs.orderHistory,
        path: Routs.orderHistory,
        pageBuilder: (context, state) {
          AddSubject? data = state.extra as AddSubject?;
          return CustomTransitionPage(

            child:  const OrderHistory(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0), // Right to Left Transition
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        name: Routs.splashView,
        path: Routs.splashView,
        pageBuilder: (context, state) {
          return customTransitionPage(
            state: state,
            child: const SplashView(),
          );
        },
      ),
      GoRoute(
        name: Routs.user,
        path: Routs.user,
        pageBuilder: (context, state) {
          return  CustomTransitionPage(
            child: const User(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0), // Right to Left Transition
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        name: Routs.subjectList,
        path: Routs.subjectList,
        pageBuilder: (context, state) {
          return  CustomTransitionPage(
            child: const SubjectList(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0), // Right to Left Transition
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        name: Routs.addUser,
        path: Routs.addUser,
        pageBuilder: (context, state) {
          return  CustomTransitionPage(
            child: const AddUser(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0), // Right to Left Transition
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        name: Routs.register,
        path: Routs.register,
        pageBuilder: (context, state) {
          return customTransitionPage(
            state: state,
            child: const RegisterView(),
          );
        },
      ),
      GoRoute(
        name: Routs.dashBoard,
        path: Routs.dashBoard,
        pageBuilder: (context, state) {
          Dashboard? data = state.extra as Dashboard?;
          return CustomTransitionPage(
            child: Dashboard(
              name: data?.name,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0), // Right to Left Transition
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),

      // GoRoute(
      //   name: Routs.teacherLeaveDetails,
      //   path: Routs.teacherLeaveDetails,
      //   pageBuilder: (context, state) {
      //     TeacherLeaveDetails? data = state.extra as TeacherLeaveDetails?;
      //     return customTransitionPage(state: state, child:     TeacherLeaveDetails(
      //       leaveCategory: data?.leaveCategory,
      //       remark: data?.remark,
      //       image: data?.image,
      //       status: data?.status,
      //       teacherName: data?.teacherName,
      //       endDate: data?.endDate,
      //       leaveType: data?.leaveType,
      //       startDate: data?.startDate,
      //       teacherId: data?.teacherId,
      //     ), );
      //   },
      // ),
    ],
    errorPageBuilder: (context, state) {
      return unknownRoute(context: context, state: state);
    },
    redirectLimit: 1,
  );

  static GoRouter get router => _router;

  ///2)  Unknown Route...

  static MaterialPage unknownRoute({
    required BuildContext context,
    required GoRouterState state,
  }) {
    return MaterialPage(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('No Route defined for unknown  ${state.path}')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoButton(
              color: AppThemes.lightTheme(context).primaryColor,
              child: const Text('Home'),
              onPressed: () {
                context.go(Routs.initialRoute);
              },
            ),
          ),
        ],
      ),
    ));
  }

  static authRedirect(BuildContext context, GoRouterState state) {}

  static bool isAuthenticated() {
    LocalDatabase localDatabase = LocalDatabase();
    return localDatabase.getIsLogin()??false;
  }
  static String? authRequired(BuildContext context, GoRouterState state) {
    debugPrint('isAuthenticated() ${isAuthenticated()}');
    debugPrint('authRequired');
    if (!isAuthenticated()) {
      debugPrint('authRequired');

      return Routs.initialRoute;
    }
    return null;
  }

  ///3)  Material Page ...

  static MaterialPage<dynamic> materialPage({
    required GoRouterState state,
    required Widget child,
  }) {
    return MaterialPage(key: state.pageKey, child: child);
  }

  ///4)  Cupertino Page...
  static CupertinoPage<dynamic> cupertinoPage({
    required GoRouterState state,
    required Widget child,
    bool authRequired = false,
  }) {
    return CupertinoPage(key: state.pageKey, child: child);
  }

  ///5)  Cupertino Page...

  static CustomTransitionPage<dynamic> customTransitionPage({
    required GoRouterState state,
    required Widget child,
    bool authRequired = false,
    Curve? curve,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Duration reverseTransitionDuration = const Duration(milliseconds: 300),
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool opaque = true,
    bool barrierDismissible = false,
    Color? barrierColor,
    String? barrierLabel,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: transitionDuration,
      reverseTransitionDuration: reverseTransitionDuration,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      barrierDismissible: barrierDismissible,
      opaque: opaque,
      barrierColor: barrierColor,
      barrierLabel: barrierLabel,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: curve ?? Curves.easeInOutCirc)
              .animate(animation),
          child: child,
        );
      },
    );
  }
}
