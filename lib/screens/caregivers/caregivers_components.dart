

import 'package:flutter/material.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';

import '../../res/assets.dart';
import '../../widgets/text_views.dart';

class Caregivers {
  static Widget myBox({double? height,String?firstname,lastname,email,lastslide,lastslide2,}) {
    return Container(
      height: height,
      width: getWidth(),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: AppColors.shadow, blurRadius: 2, offset: Offset(1, 3))
        ],
        color: AppColors.pureWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(getHeight() * .014)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth() * 0.05, vertical: getHeight() * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView.size14Text(firstname, color: AppColors.textcolr),
            TextField(
              decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dividerColor)),
                  hintText: 'Your first name ',
                  hintStyle: TextStyle(
                    fontFamily: Assets.raleWayMedium,
                    color: AppColors.greyTextColor,
                    fontSize: sizes!.fontSize14,
                  )),
            ),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text(lastname, color: AppColors.textcolr),
            TextField(
              
              decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dividerColor)),
                  hintText: 'Your Last Name',
                  hintStyle: TextStyle(
                    fontFamily: Assets.raleWayMedium,
                    color: AppColors.greyTextColor,
                    fontSize: sizes!.fontSize14,
                  )),
            ),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text(email, color: AppColors.textcolr),
            TextField(
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.dividerColor)),
                hintText: 'Your Email here',
                hintStyle: TextStyle(
                  fontFamily: Assets.raleWayMedium,
                  color: AppColors.greyTextColor,
                  fontSize: sizes!.fontSize14,
                ),
              ),
            ),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text(lastslide, color: AppColors.textcolr),
            SizedBox(
              height: getHeight() * 0.012,
            ),
            TextView.size14Text(lastslide2, color: AppColors.greyTextColor),
           
          ],
        ),
        
      ),
      
      
    );
    
  }
  
}