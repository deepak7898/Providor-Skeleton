
import 'package:The_Book_Corporation/widgets/gradient_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../app/model/auth_model/getRolesModel.dart';
import '../app/model/auth_model/loginModel.dart';
import '../app/view/dashBoard/dashBoard.dart';
import '../core/config/api_config.dart';
import '../route/route_paths.dart';
import '../services/api/api_service.dart';
import '../services/database/local_database.dart';
import '../widgets/widgets.dart';
class AuthController extends ChangeNotifier {
  Future<LoginModel?> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    FocusScope.of(context).unfocus();
    Map<String, dynamic> body = {
      'email': email,
      'password': password,
    };
    debugPrint('Sent Data is $body');
    LoginModel? responseData;

    try {

      ApiService().post(
        endPoint: ApiConfig.login,

        body: body,
      ).then(
            (response) {
              print('check our responce ${response}');
          if (response != null) {
            responseData = LoginModel.fromJson(response);
            if(responseData?.status==true){
              showSnackBar(
                  context: context,
                  text: responseData?.message??'',
                  color: textColor);
              context.read<LocalDatabase>().setLocalData(token:responseData?.data?.token,userData: responseData?.data?.user );
              context.go(Routs.dashBoard,extra:const Dashboard(name: 'Deepak Das Mahant',) );
            }else{
              showSnackBar(
                  context: context,
                  text: responseData?.message??'',
                  color: Colors.red);
            }
            context.pop();
            notifyListeners();
          }

        },
      );
    } catch (e) {
      context.pop();
      showSnackBar(
          context: context,
          text: '${responseData?.message}',
          color: Colors.red);
    }

    return responseData;
    // return responseData;
  }

  logOut({
    required BuildContext context,
    String? message,
    Color? color,
  }) async {
    try {
      LocalDatabase controller =LocalDatabase();

      await controller.clearUserData(context).then((val) {

        // context.firstRoute();
        context.go(Routs.loginView);       notifyListeners();
      }).then((value) {
        showSnackBar(context: context, text: message ?? 'Successfully Logout', color: color ?? Colors.green);
      });
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
  Future<LoginModel?> register({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String roleId,
    required String contact,
    required String address,
    required String uniqueCode,
  }) async {
    FocusScope.of(context).unfocus();
    Map<String, dynamic> body = {
      'name': name,
      'email': email,
      'password': password,
      'role_id': roleId,
      'contact': contact,
      'address': address,
      'unique_code': uniqueCode,
    };
    LoginModel? responseData;
    try {
      ApiService().post(
        endPoint: ApiConfig.register,
        body: body,
      ).then(
            (response) {
          if (response != null) {
            Map<String, dynamic> json = response;
            responseData = LoginModel.fromJson(json);
            if(responseData?.status==true){
              showSnackBar(
                  context: context,
                  text: responseData?.message??'',
                  color: textColor);
              context.pop();
              context.pop();

            }else{
              context.pop();
              showSnackBar(
                  context: context,
                  text: responseData?.message??'',
                  color: Colors.red);
            }

            notifyListeners();
          }

        },
      );
    } catch (e) {
      context.pop();
      showSnackBar(
          context: context,
          text: '${responseData?.message}',
          color: Colors.red);
    }
    return responseData;
  }
  GetRolesModel? getRoleModel;
  Future<GetRolesModel?> getRole({
    required BuildContext context,
  }) async {
    try {
  var res  = await ApiService().get(endPoint: ApiConfig.roles, );

  if(res !=null){

    GetRolesModel responseData = GetRolesModel.fromJson(res);

    if (responseData.status == true) {
      getRoleModel = responseData;

      notifyListeners();
    }
  }
    } catch (e, s) {
      debugPrint('Error is $e & $s');
    }
    return getRoleModel;
  }
}
extension Navigation on BuildContext {
  Future navigateTo({required Widget child}) {
    return Navigator.of(this).push(MaterialPageRoute(builder: (context) => child)).then((value) => value);
  }

  Future navigateToReplacement({required Widget child}) {
    return Navigator.of(this)
        .pushReplacement(MaterialPageRoute(builder: (context) => child))
        .then((value) => value);
  }

  void firstRoute() {
    return Navigator.of(this).popUntil((route) => route.isFirst);
  }

  void navigateBack() {
    return Navigator.of(this).pop();
  }
}