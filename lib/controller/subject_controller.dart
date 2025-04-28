import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/model/default/default_model.dart';
import '../app/model/subject_model/getSubjectListModel.dart';
import '../core/config/api_config.dart';
import '../services/api/api_service.dart';
import '../widgets/widgets.dart';

class SubjectController extends ChangeNotifier {
  bool subjectLoader = false;

  Future<DefaultModel?> addSubject({
    required BuildContext context,
    required String subjectName,
    required String district,
    required String className,
    required String bookType,
    required String medium,

  }) async {
    FocusScope.of(context).unfocus();
    Map<String, dynamic> body = {
      'name': subjectName,
      'class_level': className,
      'district': district,
      'book_type': bookType,
      'medium': medium ,

    };
    debugPrint('Sent Data is $body');
    DefaultModel? responseData;

    try {
      ApiService().post(
        endPoint: ApiConfig.getSubjectList,
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




  GetSubjectListModel? getSubjectListModel;
  Future<GetSubjectListModel?> getSubjectList({
    required BuildContext context,
    bool?  isRefresh=false,
  }) async {
    refresh() {
      subjectLoader = false;
      getSubjectListModel = null;
      notifyListeners();
    }

    apiResponseCompleted() {
      subjectLoader = true;
      notifyListeners();
    }
    try {
      if(isRefresh!=true){
        refresh();
      }

      var res  = await ApiService().get(endPoint: ApiConfig.getAssignPublisherList, );
      if(res !=null){
        GetSubjectListModel responseData = GetSubjectListModel.fromJson(res);
        if (responseData.status == true) {
          getSubjectListModel = responseData;
          notifyListeners();
        }
      }
      apiResponseCompleted();
    } catch (e, s) {
      apiResponseCompleted();
      debugPrint('Error is $e & $s');
    }
    return getSubjectListModel;
  }

  Future<DefaultModel?> deleteUser({
    required BuildContext context,
    required int id,

  }) async {
    DefaultModel? defaultModel;
    refresh() {
      subjectLoader = false;
      notifyListeners();
    }

    apiResponseCompleted() {
      subjectLoader = true;
      notifyListeners();
    }


    try {

      refresh();
      var res  = await ApiService().delete(endPoint: ApiConfig.deleteAndEditSubjectList, queryParameters: id,  );

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


  Future<DefaultModel?> editSubject({
    required BuildContext context,
    required int id,
    required String subjectName,
    required String className,
    required String district,
    required String bookType,
    required String medium,

  }) async {
    DefaultModel? defaultModel;

    Map<String, dynamic> body = {
      'name': subjectName,
      'class_level': className,
      'district': district,
      'book_type': bookType,
      'medium': medium,
    };

    try {
 print('check body $body');

      var res  = await ApiService().put(endPoint: ApiConfig.deleteAndEditSubjectList,body:body, queryParameters: id,  );

      if(res !=null){
        DefaultModel responseData = DefaultModel.fromJson(res);
        if (responseData.status == true) {
          defaultModel =responseData;
          context.pop();
          context.pop();
          notifyListeners();
        }
      }

    } catch (e, s) {

      debugPrint('Error is $e & $s');
    }
    return defaultModel;
  }

}
