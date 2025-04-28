import 'package:flutter/material.dart';

import '../app/model/order_history_model/orderHistoryModel.dart';
import '../core/config/api_config.dart';
import '../services/api/api_service.dart';

class OrderHistoryController extends ChangeNotifier {
  bool orderHistoryLoader=false;
  OrderHistoryModel? orderHistoryModel;
  List<OrderHistoryModel> orderHistoryList =[];
  Future<OrderHistoryModel?> getOrderHistory({
    required BuildContext context,
    bool?  isRefresh=false,
  }) async {
    refresh() {
      orderHistoryLoader = false;
      orderHistoryModel = null;
      orderHistoryList =[];
      notifyListeners();
    }

    apiResponseCompleted() {
      orderHistoryLoader = true;
      notifyListeners();
    }
    try {
      if(isRefresh!=true){
        refresh();
      }
      List data =[];
      var res  = await ApiService().get(endPoint: ApiConfig.bookAssign, );
      if(res !=null){
        data =res;
        for (var element in data) {
          orderHistoryList.add(OrderHistoryModel(
            id: element['id'],
            subjectName: element['subject_name'],
            verify: element['verify'],
            remaining: element['remaining'],
            quantity: element['quantity'],
            publisherName: element['publisher_name'],
            isbnCode: element['isbn_code'],
            contentRcvYn: element['content_rcv_yn'],
            contentPubRcv: element['content_pub_rcv'],
            classLevel: element['class_level'],
            mediumName: element['medium_name'],
            assignedDate: element['assigned_date'],
          ));
        }print('check responce=========> $res');


        notifyListeners();
      }
      apiResponseCompleted();
    } catch (e, s) {
      apiResponseCompleted();
      debugPrint('Error is $e & $s');
    }
    return orderHistoryModel;
  }

}
