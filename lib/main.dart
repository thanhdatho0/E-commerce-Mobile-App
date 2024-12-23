import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_app/controllers/popular_product_controller.dart';
import 'package:my_first_app/controllers/recommended_product_controller.dart';
import 'package:my_first_app/pages/food/food_detail.dart';
import 'package:my_first_app/pages/home/food_page_body.dart';
import 'package:my_first_app/pages/home/main_food_page.dart';
import 'package:my_first_app/route/route_helper.dart';
import 'helper/dependencies.dart' as dep;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
