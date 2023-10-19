import 'dart:convert';
import 'dart:io';
import 'package:fetal_femur_ultrasound/data/network/BaseApiService.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../app_exceptions.dart';

class NetworkApiService extends BaseApiServices{
  @override
  Future getPostApiResponse(String url,dynamic data)async {
    dynamic responseJson;
    try{
      Response response=await http.get(Uri.parse(url)).timeout(Duration(seconds:10));
      responseJson=returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getGetResponse(String url) async{
    dynamic responseJson;
    try{
      Response response =await http.get(Uri.parse(url)).timeout((const Duration(seconds:10)));
      responseJson=returnResponse(response);
    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404: 
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException('Error occured while communicating with server'
            +'with status code'+response.statusCode.toString());
    }
  }
}