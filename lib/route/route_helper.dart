import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_first_app/pages/food/food_detail.dart';
import 'package:my_first_app/pages/home/main_food_page.dart';

class RouteHelper{
  static const String initial="/";
  static const String popularFoodDetail="/popular-food";
  static const String recommendedFoodDetail="/recommended-food";

  static String getMainPage() => initial;
  static String getPopularFood(int pageId) => "$popularFoodDetail?pageId=$pageId";
  static String getRecommendedFood(int pageId) => "$recommendedFoodDetail?pageId=$pageId";

  static List<GetPage> routes=[
    GetPage(name: initial, page: ()=>MainFoodPage(), transition: Transition.fadeIn),
    GetPage(
        name: popularFoodDetail,
        page: (){
          var pageId = Get.parameters['pageId'];
          return FoodDetail(popularProductPageId: int.parse(pageId.toString()),);
        },
        transition: Transition.fadeIn
    ),
    GetPage(
        name: recommendedFoodDetail,
        page: (){
          var pageId = Get.parameters['pageId'];
          return FoodDetail(recommendedProductPageId: int.parse(pageId.toString()),);
        },
        transition: Transition.fadeIn
    ),
  ];
}