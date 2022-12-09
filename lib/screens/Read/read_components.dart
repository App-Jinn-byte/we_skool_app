import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class ReadComponents {

   Widget myReadBox({
     double? height,
     @required String? titleText,
     @required String? descriptionText,
     @required String? linkText,
     @required String? actionText,

     @required String? statustext,
   }) {
    return Container(
      height: height,
      width: getWidth(),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.pureWhiteColor,
        border:
        Border.all(color: AppColors.borderColor, width: getWidth() * 0.005),
        boxShadow: const [
          BoxShadow(
              color: AppColors.shadow, blurRadius: 2, offset: Offset(1, 3))
        ],
        borderRadius: BorderRadius.all(Radius.circular(getHeight() * .014)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth() * 0.04, vertical: getHeight() * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView.size14Text('Title', color: AppColors.textColor, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600),
            SizedBox(height: getHeight()*0.015),
            TextView.size14Text(titleText, color: AppColors.grey2colrtext,fontFamily: Assets.raleWayMedium, fontWeight: FontWeight.w500),
            myDividers(),
            TextView.size14Text('Description', color: AppColors.textColor, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600),
            SizedBox(height: getHeight()*0.015),
            TextView.size14Text(descriptionText,color: AppColors.grey2colrtext,fontFamily: Assets.raleWayMedium, fontWeight: FontWeight.w500, lines: 3),
           myDividers(),
            TextView.size14Text('Link', color: AppColors.textColor, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600),
            SizedBox(height: getHeight()*0.015),
            TextView.size14Text(linkText,color: AppColors.grey2colrtext,fontFamily: Assets.raleWayMedium, fontWeight: FontWeight.w500),
           myDividers(),
            
            TextView.size14Text('Status', color: AppColors.textColor, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600),
            SizedBox(height: getHeight()*0.015),
            TextView.size14Text(statustext,color: AppColors.grey2colrtext,fontFamily: Assets.raleWayMedium, fontWeight: FontWeight.w500),
          myDividers(),
            TextView.size14Text('Action', color: AppColors.textColor, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600),
            SizedBox(
              height: getHeight() * 0.015,
            ),
            TextView.size14Text(actionText, color: AppColors.grey2colrtext, fontFamily: Assets.raleWayMedium, fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
   Widget myArchievedBox({
     double? height,
     @required String? titleText,
     @required String? descriptionText,
     @required String? linkText,
     @required String? actionText,
   
   }) {
    return Container(
      height: height,
      width: getWidth(),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.pureWhiteColor,
        border:
        Border.all(color: AppColors.borderColor, width: getWidth() * 0.005),
        boxShadow: const [
          BoxShadow(
              color: AppColors.shadow, blurRadius: 2, offset: Offset(1, 3))
        ],
        borderRadius: BorderRadius.all(Radius.circular(getHeight() * .014)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth() * 0.04, vertical: getHeight() * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView.size14Text('Title', color: AppColors.textColor, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600),
            SizedBox(height: getHeight()*0.015),
            TextView.size14Text(titleText, color: AppColors.grey2colrtext,fontFamily: Assets.raleWayMedium, fontWeight: FontWeight.w500),
            myDividers(),
            TextView.size14Text('Description', color: AppColors.textColor, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600),
            SizedBox(height: getHeight()*0.015),
            TextView.size14Text(descriptionText,color: AppColors.grey2colrtext,fontFamily: Assets.raleWayMedium, fontWeight: FontWeight.w500, lines: 3),
           myDividers(),
            TextView.size14Text('Link', color: AppColors.textColor, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600),
            SizedBox(height: getHeight()*0.015),
            TextView.size14Text(linkText,color: AppColors.grey2colrtext,fontFamily: Assets.raleWayMedium, fontWeight: FontWeight.w500),
            
          
          myDividers(),
            TextView.size14Text('Action', color: AppColors.textColor, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600),
            SizedBox(
              height: getHeight() * 0.015,
            ),
            TextView.size14Text(actionText, color: AppColors.grey2colrtext, fontFamily: Assets.raleWayMedium, fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }

   Widget myDividers() {
    return Divider(
        height: getHeight() * 0.035,
        thickness: getHeight() * 0.001,
        color: AppColors.dividerColor);
  }
}
