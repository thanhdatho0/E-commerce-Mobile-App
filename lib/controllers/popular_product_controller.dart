import 'package:get/get.dart';
import 'package:my_first_app/data/repository/popular_product_repo.dart';
import 'package:my_first_app/Models/products_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  PopularProductController({required this.popularProductRepo});

  Future<void> getPopularProductList()async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.isOk){
      print("got products");
      _popularProductList=[];
      _popularProductList.addAll(PopularProducts.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{

    }
  }
}