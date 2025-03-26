import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../../app/model/auth_model/loginModel.dart';

class LocalDatabase extends ChangeNotifier {
  final box = GetStorage();


  setLocalData({UserData? userData,String? token}) {
    box.write('token', token);
    box.write('role', userData?.roleId);
  }
   getToken() {
    return box.read('token');
  }
  int? getRole() => box.read('role') ?? 0;
  setIsLogin({bool? isLogin}){
    box.write('isLogin', isLogin);
    notifyListeners();
  }
  getIsLogin(){
    return box.read('isLogin');
  }
  clareAllLocalData(){
    box.erase();
  }

  Future clearUserData(BuildContext context) async {
    return     box.erase();
  }

}
