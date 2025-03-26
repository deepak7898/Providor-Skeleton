import 'package:The_Book_Corporation/app/model/default/default_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/model/user/getUserModel.dart';
import '../core/config/api_config.dart';
import '../services/api/api_service.dart';
import '../widgets/widgets.dart';



class UserController extends ChangeNotifier {
  bool userLoader =false;
  Future<DefaultModel?> addUser({
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
    DefaultModel? responseData;

    try {
      ApiService().post(
        endPoint: ApiConfig.users,
        body: body,
      ).then(
            (response) {
          if (response != null) {
            Map<String, dynamic> json = response;
            responseData = DefaultModel.fromJson(json);
            if(responseData?.status==true){
              showSnackBar(
                  context: context,
                  text: responseData?.message??'',
                  color: Colors.black45);
              context.pop();
              context.pop();
            }else{
              showSnackBar(
                  context: context,
                  text: responseData?.message??'',
                  color: Colors.red);
              context.pop();
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



  GetUserModel? getUserModel;
  Future<GetUserModel?> getUserList({
    required BuildContext context,
    bool?  isRefresh=false,
  }) async {
    refresh() {
      userLoader = false;
      getUserModel = null;
      notifyListeners();
    }

    apiResponseCompleted() {
      userLoader = true;
      notifyListeners();
    }
    try {
      if(isRefresh!=true){
        refresh();
      }

      var res  = await ApiService().get(endPoint: ApiConfig.users, );

      if(res !=null){
        GetUserModel responseData = GetUserModel.fromJson(res);
        if (responseData.status == true) {
          getUserModel = responseData;
          notifyListeners();
        }
      }
      apiResponseCompleted();
    } catch (e, s) {
      apiResponseCompleted();
      debugPrint('Error is $e & $s');
    }
    return getUserModel;
  }

  Future<DefaultModel?> updateUser({
    required BuildContext context,
    required int id,
    required String status,
  }) async {
    DefaultModel? defaultModel;
    refresh() {

      userLoader = false;
      notifyListeners();
    }

    apiResponseCompleted() {
      userLoader = true;
      notifyListeners();
    }
    var body ={
      'status':status,
    };

    try {

        refresh();
      var res  = await ApiService().put(endPoint: ApiConfig.approve,body:body, queryParameters: id,  );

      if(res !=null){
        DefaultModel responseData = DefaultModel.fromJson(res);
        if (responseData.status == true) {
          defaultModel =responseData;
          notifyListeners();
        }
      }
      apiResponseCompleted();
    } catch (e, s) {
      apiResponseCompleted();
      debugPrint('Error is $e & $s');
    }
    return defaultModel;
  }
  Future<DefaultModel?> deleteUser({
    required BuildContext context,
    required int id,

  }) async {
    DefaultModel? defaultModel;
    refresh() {
      userLoader = false;
      notifyListeners();
    }

    apiResponseCompleted() {
      userLoader = true;
      notifyListeners();
    }


    try {

        refresh();
      var res  = await ApiService().delete(endPoint: ApiConfig.deleteUser, queryParameters: id,  );

      if(res !=null){
        DefaultModel responseData = DefaultModel.fromJson(res);
        if (responseData.status == true) {
          defaultModel =responseData;
          notifyListeners();
        }
      }
      apiResponseCompleted();
    } catch (e, s) {
      apiResponseCompleted();
      debugPrint('Error is $e & $s');
    }
    return defaultModel;
  }

}
