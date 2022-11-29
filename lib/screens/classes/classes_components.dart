
import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class SpClassComponents {
  static Widget myBoxcls({double?height,String?classname,students,agegroup,teacher}) {
    return Container(
      height: height ?? getHeight()*0.25,
      width: getWidth(),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: AppColors.shadow, blurRadius: 2, offset: Offset(1, 2))
        ],
        color: AppColors.pureWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(getHeight() * .014)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04,vertical: getHeight()*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.size14Text('Class Name', color: AppColors.pureBlack,fontWeight:FontWeight.w600,fontFamily: Assets.raleWaySemiBold ),
                TextView.size14Text(classname, color: AppColors.lightblackcolr,fontWeight:FontWeight.w500,fontFamily: Assets.raleWayMedium ),


              ],
            ),  
             SpClassComponents.myDivider(),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.size14Text('Students', color: AppColors.pureBlack,fontWeight:FontWeight.w600,fontFamily: Assets.raleWaySemiBold ),
                TextView.size14Text(students, color: AppColors.lightblackcolr,fontWeight:FontWeight.w500,fontFamily: Assets.raleWayMedium ),


              ],
            ),
             SpClassComponents.myDivider(),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.size14Text('Age Group', color: AppColors.pureBlack,fontWeight:FontWeight.w600,fontFamily: Assets.raleWaySemiBold ),
                TextView.size14Text(agegroup, color: AppColors.lightblackcolr,fontWeight:FontWeight.w500,fontFamily: Assets.raleWayMedium ),


              ],
            ),
             SpClassComponents.myDivider(),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.size14Text('Teacher', color: AppColors.pureBlack,fontWeight:FontWeight.w600,fontFamily: Assets.raleWaySemiBold ),
                TextView.size14Text(teacher, color: AppColors.lightblackcolr,fontWeight:FontWeight.w500,fontFamily: Assets.raleWayMedium ),


              ],
            ),
          ],
        ),
      ),

    );

}
 static Widget myBoxspecialcls({double?height,String?classname,starttime,date,teacher,status}) {
    return Container(
      height: height ?? getHeight()*0.29,
      width: getWidth(),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: AppColors.shadow, blurRadius: 2, offset: Offset(1, 2))
        ],
        color: AppColors.pureWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(getHeight() * .014)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04,vertical: getHeight()*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.size14Text('Class Name', color: AppColors.pureBlack,fontWeight:FontWeight.w600,fontFamily: Assets.raleWaySemiBold ),
                TextView.size14Text(classname, color: AppColors.lightblackcolr,fontWeight:FontWeight.w500,fontFamily: Assets.raleWayMedium ),


              ],
            ),  
             SpClassComponents.myDivider(),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.size14Text('Start Time', color: AppColors.pureBlack,fontWeight:FontWeight.w600,fontFamily: Assets.raleWaySemiBold ),
                TextView.size14Text(starttime, color: AppColors.lightblackcolr,fontWeight:FontWeight.w500,fontFamily: Assets.raleWayMedium ),


              ],
            ),
             SpClassComponents.myDivider(),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.size14Text('Date', color: AppColors.pureBlack,fontWeight:FontWeight.w600,fontFamily: Assets.raleWaySemiBold ),
                TextView.size14Text(date, color: AppColors.lightblackcolr,fontWeight:FontWeight.w500,fontFamily: Assets.raleWayMedium ),


              ],
            ),
             SpClassComponents.myDivider(),

              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.size14Text('Teacher', color: AppColors.pureBlack,fontWeight:FontWeight.w600,fontFamily: Assets.raleWaySemiBold ),
                TextView.size14Text(teacher, color: AppColors.lightblackcolr,fontWeight:FontWeight.w500,fontFamily: Assets.raleWayMedium ),


              ],
            ),
            SpClassComponents.myDivider(),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView.size14Text('Status', color: AppColors.pureBlack,fontWeight:FontWeight.w600,fontFamily: Assets.raleWaySemiBold ),
                TextView.size14Text(status, color: AppColors.lightblackcolr,fontWeight:FontWeight.w500,fontFamily: Assets.raleWayMedium ),


              ],
            ),
          ],
        ),
      ),

    );

}
  static Widget myDivider() {
    return Divider(
        height: getHeight() * 0.01,
        thickness: getHeight() * 0.001,
        color: AppColors.dividerColor);
  }

}