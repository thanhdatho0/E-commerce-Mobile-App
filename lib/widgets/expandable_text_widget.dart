import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/utils/colors.dart';
import 'package:my_first_app/utils/dimensions.dart';
import 'package:my_first_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({
    super.key,
    required this.text
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight/7.42;

  @override
  void initState(){
    super.initState();
    if(widget.text.length > textHeight){

      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }
    else{
      firstHalf = widget.text;
      secondHalf = "";
    }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?
        SmallText(height: Dimensions.height1dot8, text: firstHalf, size: Dimensions.font16, color: AppColors.paraColor,):
        Column(
          children: [
            SmallText(height: Dimensions.height1dot8, text: hiddenText?("$firstHalf..."):(firstHalf + secondHalf), size: Dimensions.font16, color: AppColors.paraColor,),
            InkWell(
              onTap: (){
                setState(() {
                  hiddenText = !hiddenText;
                });
              },
              child: Row(
                children: [
                  SmallText(text: hiddenText?"Show more":"Show less", color: AppColors.mainColor, size: Dimensions.font16,),
                  Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.mainColor,),
                ],
              ),
            )
          ],
        ),
    );
  }
}
