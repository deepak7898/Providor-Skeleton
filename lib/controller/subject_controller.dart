import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/model/default/default_model.dart';
import '../app/model/subject_model/getSubjectList.dart';
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

  }) async {
    FocusScope.of(context).unfocus();
    Map<String, dynamic> body = {
      'name': subjectName,
      'class_level': className,
      'district': district,
      'book_type': bookType,

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




  GetSubjectList? getSubjectListModel;
  Future<GetSubjectList?> getSubjectList({
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

      var res  = await ApiService().get(endPoint: ApiConfig.getSubjectList, );
      if(res !=null){
        GetSubjectList responseData = GetSubjectList.fromJson(res);
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

}
