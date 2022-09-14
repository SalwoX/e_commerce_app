import 'package:e_commerce_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetConnect implements GetxService {
  String? token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = AppConstants.BASE_URL;
    timeout = const Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders={
      "Content-type" : "application/json; charset=UTF-8",
      "Authorization" : "Bearer$token",
    };
  }
  Future getData(String uri,) async {
    try {
      http.Response response = await http.get(Uri.parse(uri));
      return response;
    }catch(e) {
      return http.Response(e.toString(), 500);
    }
  }
}