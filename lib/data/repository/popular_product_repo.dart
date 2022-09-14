import 'package:e_commerce_app/data/api/api_client.dart';
import 'package:e_commerce_app/utils/utils.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future getPopularProductList() async {
    return await apiClient.getData(AppConstants.BASE_URL+AppConstants.POPULAR_PRODUCT_URI);
  }
}