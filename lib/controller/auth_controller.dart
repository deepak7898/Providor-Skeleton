
import 'dart:convert';

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
          if (response != null) {
            responseData = LoginModel.fromJson(response);
            if(responseData?.status==true){
              showSnackBar(
                  context: context,
                  text: responseData?.message??'',
                  color: Colors.green);
              context.read<LocalDatabase>().setLocalData(token:responseData?.data?.token,userData: responseData?.data?.user );
              context.pushNamed(Routs.dashBoard,extra:const Dashboard(name: 'Deepak Das Mahant',) );
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
  Future<LoginModel?> register({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String roleId,
    required String contact,
    required String address,
  }) async {
    FocusScope.of(context).unfocus();
    Map<String, dynamic> body = {
      'name': name,
      'email': email,
      'password': password,
      'role_id': roleId,
      'contact': contact,
      'address': address,
    };
    debugPrint('Sent Data is $body');
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
                  color: Colors.green);
              context.pushNamed(Routs.dashBoard,extra:const Dashboard(name: 'Deepak Das Mahant',) );
            }
            context.pop();
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
