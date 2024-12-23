import 'package:get/get.dart';
import 'package:my_first_app/Models/products_model.dart';

import '../data/repository/recommended_product_repository.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  RecommendedProductController({required this.recommendedProductRepo});

  Future<void> getRecommendedProductList()async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.isOk){
      print("got products");
      _recommendedProductList=[];
      _recommendedProductList.addAll(PopularProducts.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{

    }
  }
}