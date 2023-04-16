import 'package:dio/dio.dart';
import 'package:dio_package/config/dio_config.dart';

class GetUserService {
  static Future<dynamic> getUser() async {
    try {
      Response response = await DioConfig.createRequest()
          .get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        return response;
      } else {
        return "-------------------${response.statusCode}  ---------------${response.statusMessage}";
      }
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectionTimeout:
          return "Connect time out";
        case DioErrorType.receiveTimeout:
          return "Receive time out";
        case DioErrorType.sendTimeout:
          return "Sent time out";
        case DioErrorType.connectionError:
          return "Internet connection error";
        default:
          return "Unknown error";
      }
    }
  }
}
