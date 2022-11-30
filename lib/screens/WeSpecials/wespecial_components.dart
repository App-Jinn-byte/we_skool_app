
import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class WeSpecialWidgets {


 static Widget myDividers() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
      child: Divider(
          height: getHeight() * 0.01,
          thickness: getHeight() * 0.001,
          color: AppColors.dividerColor),
    );
  }
  static Widget miniContainer({String? text1,textprice, required Color color,colortext,
  }) {



    return   Expanded(
      child: Container(
      //  height: getHeight()*0.040,
        width: getWidth(),
    
        decoration: BoxDecoration(
    
          color: AppColors.pureWhiteColor,
            boxShadow: const [
          BoxShadow(
              color: AppColors.borderColor, blurRadius: 10, offset: Offset(0, 1))
        ],
          border: Border.all(color: color),
          borderRadius: BorderRadius.all(Radius.circular(getHeight() * .012)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextView.size14Text(text1, color: colortext),
            Text('|',style: TextStyle(color: colortext),),
    
            TextView.size14Text(textprice, color: colortext),
    
          ],
        ),
      ),
    );
  }
}