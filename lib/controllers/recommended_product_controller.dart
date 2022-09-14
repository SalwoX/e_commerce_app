import 'dart:convert';

import 'package:e_commerce_app/data/repository/recommended_product_repo.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];

  List<dynamic> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;

  bool get isloaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    http.Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList
          .addAll(Product.fromJson(jsonDecode(response.body)).products);
      _isLoaded = true;
      print("recommended İstek başarılı");
      update();
    } else {
      print("İstek başarısız." + response.statusCode.toString());
    }
  }
}
