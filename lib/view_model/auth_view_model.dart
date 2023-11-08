import 'package:fetal_femur_ultrasound/repository/auth_repository.dart';
import 'package:fetal_femur_ultrasound/utils/routes/routes_name.dart';
import 'package:fetal_femur_ultrasound/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo=AuthRepository();
  bool _loading=false;
  bool get loading=>_loading;
  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }
  Future<void> loginApi(dynamic data,BuildContext context)async{
    _myRepo.loginApi(data).then((value){
      setLoading(false);
        Utils.flushBarErrorMessages("Login Successfully", context);
        Navigator.pushNamed(context,RoutesName.home);
        print(value.toString());
    }).onError((error, stackTrace) {
        setLoading(false);
        Utils.flushBarErrorMessages(error.toString(), context);
        print(error.toString());
    });
  }
}