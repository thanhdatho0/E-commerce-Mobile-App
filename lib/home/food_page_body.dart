
import 'package:flutter/material.dart';
import 'package:my_first_app/utils/colors.dart';
import 'package:my_first_app/utils/dimensions.dart';
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
        // Hình ảnh + Mô tả Container
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, index){
                return _buildPageItem(index);
              }),
        ),
        // End

        // Chấm chuyển ảnh
        SmoothPageIndicator(
            controller: pageController,  // PageController
            count:  5,
            effect:  ExpandingDotsEffect(
              spacing: 8.0,
              dotWidth: Dimensions.font12,
              dotHeight: Dimensions.font12,
              radius: Dimensions.font12,
              activeDotColor: AppColors.mainColor,
            ),  // your preferred effect
            onDotClicked: (index){
            }
        ),
        //End
      ],
    );
  }


  Widget _buildPageItem (int index){
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
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? const Color(0xFF69c5df) : const Color(0xFF9294cc),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/image/food0.png",
                    ))
            ),
          ),
          // End

          // Mô tả sản phẩm
          Align(
            alignment: Alignment.bottomCenter,
            // Thiết kế vị trị + màu sắc cho container
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height30),
                color: Colors.white,
                boxShadow: [
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Chi tiết mô tả
                  children: [
                    // Tên sản phẩm
                    BigText(text: "Chinese Side"),
                    SizedBox(height: Dimensions.height10,),
                    // Đánh giá
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) =>
                              Icon(Icons.star, color: AppColors.mainColor, size: Dimensions.height15,)
                          ), // Tương tự foreach
                        ),
                        SizedBox(width: Dimensions.width10,),
                        SmallText(text: "4.5"),
                        SizedBox(width: Dimensions.width10,),
                        SmallText(text: "1287"),
                        SizedBox(width: Dimensions.width10,),
                        SmallText(text: "Comments")
                      ],
                    ),
                    SizedBox(height: Dimensions.height20,),
                    // Trạng thái
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: AppColors.iconColor1,
                        ),
                        SizedBox(width: Dimensions.width30,),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.7km",
                          iconColor: AppColors.mainColor,
                        ),
                        SizedBox(width: Dimensions.width30,),
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
              // End
            ),
            // End
          ),
          // End
        ],
      )
    );
  }
}
