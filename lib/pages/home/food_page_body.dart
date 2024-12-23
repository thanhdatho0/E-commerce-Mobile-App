
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_app/controllers/popular_product_controller.dart';
import 'package:my_first_app/Models/products_model.dart';
import 'package:my_first_app/controllers/recommended_product_controller.dart';
import 'package:my_first_app/pages/food/food_detail.dart';
import 'package:my_first_app/route/route_helper.dart';
import 'package:my_first_app/utils/app_constants.dart';
import 'package:my_first_app/utils/colors.dart';
import 'package:my_first_app/utils/dimensions.dart';
import 'package:my_first_app/widgets/app_short_detail_col.dart';
import 'package:my_first_app/widgets/big_text.dart';
import 'package:my_first_app/widgets/icon_and_text_widget.dart';
import 'package:my_first_app/widgets/small_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
       setState(() {
         _currPageValue = pageController.page!;
       });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return popularProducts.isLoaded?SizedBox(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
                itemBuilder: (context, index){
                  return _buildPageItem(index, popularProducts.popularProductList[index]);
                }),
          ):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
        // End

        // Chấm chuyển ảnh
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return popularProducts.isLoaded?SmoothPageIndicator(
              controller: pageController,  // PageController
              count:  popularProducts.popularProductList.length,
              effect:  ExpandingDotsEffect(
                spacing: 8.0,
                dotWidth: Dimensions.font12,
                dotHeight: Dimensions.font12,
                radius: Dimensions.font12,
                activeDotColor: AppColors.mainColor,
              ),  // your preferred effect
              onDotClicked: (index){
              }
          ):Container();
        }),
        //End

        SizedBox(height: Dimensions.height20,),
        // Collection Title
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular",),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height5),
                child: BigText(text: ".", color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height5),
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        ),
        // End

        // Hiển thị danh sách các sản phẩm ở Home Page
        GetBuilder<RecommendedProductController>(builder: (recommendedProducts){
          return recommendedProducts.isLoaded?ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recommendedProducts.recommendedProductList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                child: Row(
                  children: [
                    // Images Session
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.getRecommendedFood(index));
                      },
                      child: Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.height20),
                            color: Colors.white38,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  AppConstants.BASE_URL+"/uploads/"+recommendedProducts.recommendedProductList[index].img!
                              ),
                            )
                        ),
                      ),
                    ),
                    // End

                    // Text session
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          height: Dimensions.listViewTextSize,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.height20),
                                bottomRight: Radius.circular(Dimensions.height20),
                              )
                          ),

                          child: Padding(
                            padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: recommendedProducts.recommendedProductList[index].name!),
                                SizedBox(height: Dimensions.height5,),
                                SmallText(text: recommendedProducts.recommendedProductList[index].description!, textOverflow: TextOverflow.ellipsis,),
                                SizedBox(height: Dimensions.height10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconAndTextWidget(
                                      icon: Icons.circle_sharp,
                                      text: "Normal",
                                      iconColor: AppColors.iconColor1,
                                    ),
                                    IconAndTextWidget(
                                      icon: Icons.location_on,
                                      text: "1.7km",
                                      iconColor: AppColors.mainColor,
                                    ),
                                    IconAndTextWidget(
                                      icon: Icons.access_time_rounded,
                                      text: "32min",
                                      iconColor: AppColors.iconColor2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: (){
                          Get.toNamed(RouteHelper.getRecommendedFood(index));
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),

        // End

      ],
    );
  }


  Widget _buildPageItem (int index, Products product){
    Matrix4 matrix4 = Matrix4.identity();
    if(index == _currPageValue.floor()){
      var currScale = 1-(_currPageValue - index)*(1 - _scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor + (_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue - index)*(1 - _scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    return Transform(
        transform: matrix4,
        child: Stack(
        /*
      Kiểu Stack (Ngăn xếp): Sắp xếp các Components nằm chồng lên nhau kiểu ngăn xếp:
        + Khai báo trước nằm dưới
        + Khai báo sau nằm trên
       */
        children: [
          // Hình ảnh sản phẩm
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          AppConstants.BASE_URL+"/uploads/"+product.img!
                      ))
              ),
            ),
          ),
          // End
          // Mô tả sản phẩm
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              // Thiết kế vị trị + màu sắc cho container
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.height30),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 2)
                      )
                    ]
                ),
                // Container chi tiết mô tả
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height15, left: Dimensions.width15, right: Dimensions.width15),
                  child: AppShortDetailCol(productName: product.name!, star: product.star!,),
                ),
                // End
              ),
              // End
            ),
          ),
          // End
        ],
      )
    );
  }
}
