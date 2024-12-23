
import 'package:flutter/material.dart';
import 'package:my_first_app/widgets/small_text.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppShortDetailCol extends StatelessWidget {
  final String productName;
  double titleFontSize;
  final int star;

  AppShortDetailCol({
    required this.productName,
    this.titleFontSize = 0,
    required this.star,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // Chi tiết mô tả
      children: [
        // Tên sản phẩm
        BigText(text: productName, size: titleFontSize==0?Dimensions.font20:titleFontSize,),
        SizedBox(height: Dimensions.height10,),
        // Đánh giá
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) =>
                  Icon(Icons.star, color: index<star?AppColors.mainColor:Colors.grey, size: Dimensions.height15,)
              ), // Tương tự foreach
            ),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: star.toString()),
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
    );
  }
}
