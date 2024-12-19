import 'package:flutter/cupertino.dart';
import 'package:my_first_app/utils/colors.dart';
import 'package:my_first_app/utils/dimensions.dart';

class BigText extends StatelessWidget {
  //Properties
  Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;

  //Constructor
  BigText({super.key, this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
    this.textOverflow = TextOverflow.ellipsis
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size==0?Dimensions.font20:size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
