import 'package:The_Book_Corporation/app/model/default/default_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/model/publisher_model/getIsbnBarCode.dart';
import '../app/model/publisher_model/publisherModel.dart';
import '../core/config/api_config.dart';
import '../services/api/api_service.dart';
import '../widgets/gradient_colors.dart';
import '../widgets/widgets.dart';

class PublisherController extends ChangeNotifier {
  bool publisherLoader = false;

  PublisherModel? publisherModel;
  Future<PublisherModel?> getPublisherList({
    required BuildContext context,
    bool?  isRefresh=false,
  }) async {
    refresh() {
      publisherLoader = false;
      publisherModel = null;
      notifyListeners();
    }

    apiResponseCompleted() {
      publisherLoader = true;
      notifyListeners();
    }
    try {
      if(isRefresh!=true){
        refresh();
      }

      var res  = await ApiService().get(endPoint: ApiConfig.getPublisher, );
      if(res !=null){
        PublisherModel responseData = PublisherModel.fromJson(res);
        if (responseData.status == true) {
          publisherModel = responseData;
          notifyListeners();
        }
      }
      apiResponseCompleted();
    } catch (e, s) {
      apiResponseCompleted();
      debugPrint('Error is $e & $s');
    }
    return publisherModel;
  }
  Future<DefaultModel?> generateISBN({
    required BuildContext context,
    required String? id,

  }) async {


    DefaultModel? defaultModel;
 var body ={
   "assignment_id":id
 };
    try {
      var res  = await ApiService().post(endPoint: '${ApiConfig.generateISBN}$id',body: body);
      if(res !=null){
        DefaultModel responseData = DefaultModel.fromJson(res);
        if (responseData.status == true) {
          defaultModel = responseData;
          showSnackBar(
              context: context,
              text: defaultModel.message??'',
              color: textColor);
          context.pop();
          notifyListeners();
        }else{
          context.pop();

        }
      }

    } catch (e, s) {

      debugPrint('Error is $e & $s');
    }
    return defaultModel;
  }
  Future<DefaultModel?> subjectAssigned({
    required BuildContext context,
    required String? subjectId,
    required String? publisherId,
    required String? classLevel,
    required String? session,

  }) async {
    Map<String, dynamic> body = {
      'subject_id': subjectId,
      'publisher_id': publisherId,
      'class_level': classLevel,
      'session': session,

    };

    DefaultModel? defaultModel;

    try {
      var res  = await ApiService().post(endPoint: ApiConfig.subjectAssigned, body: body);
      if(res !=null){
        DefaultModel responseData = DefaultModel.fromJson(res);
        if (responseData.status == true) {
          defaultModel = responseData;

          context.pop();
          context.pop();

        }else{
          context.pop();
          context.pop();
        }
        showSnackBar(
            context: context,
            text: defaultModel?.message??'',
            color: textColor);
        notifyListeners();
      }

    } catch (e, s) {

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
      publisherLoader = false;
      notifyListeners();
    }

    apiResponseCompleted() {
      publisherLoader = true;
      notifyListeners();
    }

    try {

      refresh();
      var res  = await ApiService().delete(endPoint: ApiConfig.deleteSubjectAssigned, queryParameters: id,  );
      if(res !=null){
        DefaultModel responseData = DefaultModel.fromJson(res);
        if (responseData.status == true) {
          defaultModel =responseData;
          notifyListeners();
        }
        context.pop();
      }
      apiResponseCompleted();
    } catch (e, s) {
      apiResponseCompleted();
      debugPrint('Error is $e & $s');
    }
    return defaultModel;
  }


  GetIsbnBarCode? getIsbnBarCodeModel;
  Future<GetIsbnBarCode?> getIsbnBarcode({
    required BuildContext context,
    required String assignmentId ,

  }) async {
    // refresh() {
    //   publisherLoader = false;
    //   getIsbnBarCodeModel = null;
    //   notifyListeners();
    // }

    // apiResponseCompleted() {
    //   publisherLoader = true;
    //   notifyListeners();
    // }
    try {
      // refresh();
      var res  = await ApiService().get(endPoint: ApiConfig.getIsbn,queryParametersWithoutKey: assignmentId );
      if(res !=null){
        GetIsbnBarCode responseData = GetIsbnBarCode.fromJson(res);
        getIsbnBarCodeModel = responseData;
        notifyListeners();
      }
      // apiResponseCompleted();
    } catch (e, s) {
      // apiResponseCompleted();
      debugPrint('Error is $e & $s');
    }
    return getIsbnBarCodeModel;
  }


}
