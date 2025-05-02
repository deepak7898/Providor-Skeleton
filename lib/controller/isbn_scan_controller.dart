import 'package:flutter/material.dart';

import '../app/view/isbn_scan/isbn_model/isbn_details_model.dart';
import '../core/config/api_config.dart';
import '../services/api/api_service.dart';


class IsbnScanController extends ChangeNotifier {
  bool darkTheme = false;
  BookVerification? bookVerification;
  Future<BookVerification?> getIsbnId({
    required BuildContext context,
    required String isbnCode,
    bool?  isRefresh=false,
  }) async {

    try {

      var res  = await ApiService().get(endPoint:ApiConfig.scanISBNGetDetails+isbnCode );
      if(res !=null){
        BookVerification responseData = BookVerification.fromJson(res);
        if (responseData.verified == true) {
          bookVerification = responseData;
          notifyListeners();
        }

      }
    } catch (e, s) {
      debugPrint('Error is $e & $s');
    }
    return bookVerification;
  }

}
