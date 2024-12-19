import 'package:flutter/cupertino.dart';
import 'package:my_first_app/utils/colors.dart';
import 'package:my_first_app/utils/dimensions.dart';
import 'package:my_first_app/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndTextWidget({
        required this.icon,
        required this.text,
        required this.iconColor,
        super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.width20,),
        SizedBox(width: Dimensions.width5,),
        SmallText(text: text,),
      ],
    );
  }
}
