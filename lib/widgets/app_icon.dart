import 'package:flutter/cupertino.dart';
import 'package:my_first_app/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const AppIcon({
    required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.size = 0, this.iconColor = const Color(0xFF756d54),
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size==0?Dimensions.iconSize40:size,
      height: size==0?Dimensions.iconSize40:size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size==0?Dimensions.iconSize40/2:size/2),
        color: backgroundColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: size==0?Dimensions.iconSize40/2:size/2,
      ),
    );
  }
}
