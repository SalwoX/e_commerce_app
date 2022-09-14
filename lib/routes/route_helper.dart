import 'package:e_commerce_app/pages/pages.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String _initial = "/";
  static const String _popularFood = "/popular-food";
  static const String _recommendedFood = "/recommended-food";

  static String getInitial() => '$_initial';

  static String getRecommendedFood(int pageId) =>
      '$_recommendedFood?pageId=$pageId';

  static String getPopularFood(int pageId) => '$_popularFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: _initial, page: () => const MainFoodPage()),
    GetPage(
      name: _popularFood,
      page: () {
        var pageId = int.parse(Get.parameters['pageId']!);
        return PopularFoodDetail(pageId: pageId);
      },
      transition: Transition.fadeIn,
    ),


    GetPage(
      name: _recommendedFood,
      page: () {
        var pageId = int.parse(Get.parameters['pageId']!);
        return RecommendedFoodDetail(pageId: pageId);
      },
      transition: Transition.fadeIn,
    ),
  ];
}
