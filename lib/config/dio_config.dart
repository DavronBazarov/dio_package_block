import 'package:dio/dio.dart';

class DioConfig{
  static Dio createRequest(){
    var dio = Dio(BaseOptions(
      validateStatus: (int? statusCode){
        if(statusCode != null){
          if(statusCode>=100 && statusCode<=500){
            return true;
          }else{
            return false;
          }
        }else{
          return false;
        }
      },
      receiveDataWhenStatusError: true,
    ));

    // TIME OUT CONFIGURATION
    //
    // dio.options.connectTimeout = (55*1000) as Duration?;
    // dio.options.receiveTimeout = (55*1000) as Duration?;
    // dio.options.sendTimeout = (55*1000) as Duration?;

    return dio;
  }
}