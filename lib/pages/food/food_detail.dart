import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_app/controllers/popular_product_controller.dart';
import 'package:my_first_app/controllers/recommended_product_controller.dart';
import 'package:my_first_app/route/route_helper.dart';
import 'package:my_first_app/utils/app_constants.dart';
import 'package:my_first_app/utils/dimensions.dart';
import 'package:my_first_app/widgets/app_icon.dart';
import 'package:my_first_app/widgets/app_short_detail_col.dart';
import 'package:my_first_app/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';

class FoodDetail extends StatelessWidget {
  int? popularProductPageId;
  int? recommendedProductPageId;
  FoodDetail({super.key, this.popularProductPageId, this.recommendedProductPageId});

  @override
  Widget build(BuildContext context) {
    var product = popularProductPageId!=null
        ?Get.find<PopularProductController>().popularProductList[popularProductPageId!]
        :Get.find<RecommendedProductController>().recommendedProductList[recommendedProductPageId!];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.foodDetailPageImg,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          AppConstants.BASE_URL+"/uploads/"+product.img
                      )
                  )
                ),
          )),
          // End

          // Small Widget
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: const AppIcon(icon: Icons.arrow_back),
                  onTap: (){
                    Get.toNamed(RouteHelper.getMainPage());
                  },
                ),
                const AppIcon(icon: Icons.shopping_cart_outlined),
              ],
          )),
          // End

          // Introduction Session
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.foodDetailPageImg - Dimensions.height20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.height20),
                    topLeft: Radius.circular(Dimensions.height20)
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppShortDetailCol(
                    productName: product.name,
                    titleFontSize: Dimensions.font26,
                    star: product.star,
                  ),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height15,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text: product.description!
                      ),
                    ),
                  ),
                ],
              ),
          ),),
          // End
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.foodDetailPageFooter,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width30,
            right: Dimensions.width30,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.height20*2),
            topRight: Radius.circular(Dimensions.height20*2),
          ),
          color: AppColors.buttonBackgroundColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Amount Session
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height15,
                bottom: Dimensions.height15,
                left: Dimensions.width15,
                right: Dimensions.width15
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width15/2,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width15/2,),
                  Icon(Icons.add, color: AppColors.signColor),
                ],
              ),
            ),
            // End

            // Add to cart Button Session
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height15,
                bottom: Dimensions.height15,
                left: Dimensions.width15,
                right: Dimensions.width15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height20),
                color: AppColors.mainColor
              ),
              
              child: BigText(text: "\$${product.price} | Add to cart", color: Colors.white,),
            ),
            // End
          ],
        ),
      ),
    );
  }
}
