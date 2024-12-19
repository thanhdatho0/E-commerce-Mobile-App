import 'package:flutter/material.dart';
import 'package:my_first_app/home/food_page_body.dart';
import 'package:my_first_app/utils/colors.dart';
import 'package:my_first_app/utils/dimensions.dart';
import 'package:my_first_app/widgets/big_text.dart';
import 'package:my_first_app/widgets/small_text.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Vietnam", color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(text: "TP.Hồ Chí Minh", color: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.height15),
                      color: AppColors.mainColor,
                    ),
                    child: const Icon(Icons.search, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          // End

          // Slider
          const FoodPageBody(),
          // End
        ],
      ),
    );
  }
}
