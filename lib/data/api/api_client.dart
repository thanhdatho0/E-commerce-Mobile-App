import 'package:get/get.dart';
import 'package:my_first_app/utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeader;

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    token = AppConstants.TOKEN;
    timeout = const Duration(seconds: 30);
    _mainHeader={
      'Content-type' : 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token',
    };
  }

  Future<Response> getData(String uri)async{
    try{
      Response response = await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 500, statusText: e.toString());
    }
  }
}