import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

import '../../app/model/auth_model/loginModel.dart';

class LocalDatabase extends ChangeNotifier {
  final box = GetStorage();


  setLocalData({UserData? userData,String? token}) {
    box.write('token', token);
  }
   getToken() {
    return box.read('token')==null?false:true;
  }
  setIsLogin({bool? isLogin}){
    box.write('isLogin', isLogin);
  }
  getIsLogin(){
    return box.read('IsLogin');
  }

}
