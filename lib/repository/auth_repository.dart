
import 'package:fetal_femur_ultrasound/data/network/BaseApiService.dart';
import 'package:fetal_femur_ultrasound/res/app_url.dart';

import '../data/network/NetworkApiService.dart';

class AuthRepository{
BaseApiServices _apiServices=NetworkApiService();
Future<dynamic> loginApi(dynamic data)async{
  try{
    dynamic response=await _apiServices.getPostApiResponse(AppUrl.loginApiEndPoint, data);
    return response;
  }catch(e){
    throw e;
  }
}
Future<dynamic> registerApi(dynamic data)async{
  try{
    dynamic response=await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
    return response;
  }catch(e){
    throw e;
  }
}
}