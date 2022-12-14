import 'dart:convert';

import 'package:e_commerce_app/controllers/cart_controller.dart';
import 'package:e_commerce_app/data/repository/popular_product_repo.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  int _quantity = 0;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;

  int _inCartItems = 0;
  int get inCartItems=>_inCartItems + _quantity;
  bool get isLoaded => _isLoaded;

  int get quantity => _quantity;

  Future<void> getPopularProductList() async {
    http.Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList
          .addAll(Product.fromJson(jsonDecode(response.body)).products);
      _isLoaded = true;
      print("İstek başarılı");
      update();
    } else {
      print("İstek başarısız." + response.statusCode.toString());
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "Item count",
        "You can't reduce more.",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar(
        "Item count",
        "You can't add more.",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _inCartItems = 0;
    _quantity = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    //if exist
    //get from storage _inCartItems = 3
    print("Exist or not " + exist.toString());

    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    print("The quantity in the cart is " + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    //if(_quantity>0) {
      _cart.addItem(product, _quantity);
      _quantity = 0;
      _inCartItems = _cart.getQuantity(product);

      _cart.items.forEach((key, value) {
        print("The id is " +
            value.id.toString() +
            " The quantity is " +
            value.quantity.toString());
      });
  }
}
