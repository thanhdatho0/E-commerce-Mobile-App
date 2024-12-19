import 'package:flutter/cupertino.dart';
import 'package:my_first_app/utils/dimensions.dart';

class SmallText extends StatelessWidget {

  //Properties
  Color? color;
  final String text;
  double size;
  double height;
  //Constructor
  SmallText({super.key, this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 0,
    this.height = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size==0?Dimensions.font12:size,
        height: height==0?Dimensions.height1dot2:height,
      ),
    );
  }
}
