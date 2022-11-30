

import 'package:flutter/material.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';

import '../../res/assets.dart';
import '../../widgets/text_views.dart';

class Caregivers {
  static Widget myBox(
      {String? firstname,
        lastname,
        email,
       lastslide,
        lastslidetxt,
        }) {
    return Container(
      height: getHeight() * 0.46,
      width: getWidth(),
      decoration: BoxDecoration(
           shape: BoxShape.rectangle,
         
          border:
              Border.all(color: AppColors.borderColor, width: getWidth() * 0.003),
         boxShadow: const [
          BoxShadow(
              color: AppColors.borderColor, blurRadius: 10, offset: Offset(0, 1))
        ],
        color: AppColors.pureWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(getHeight() * .014)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: TextView.size14Text('First Name',
                  color: AppColors.textcolr,
                  fontFamily: Assets.raleWaySemiBold),
              subtitle: Padding(
                padding: EdgeInsets.only(top: getHeight() * 0.02),
                child: TextView.size14Text(firstname,
                    color: AppColors.greyTextColor,
                    fontFamily: Assets.raleWayMedium),
              ),
            ),
            Caregivers.myDivider(),

            ListTile(
              title: TextView.size14Text('Last Name',
                  color: AppColors.textcolr,
                  fontFamily: Assets.raleWaySemiBold),
              subtitle: Padding(
                padding: EdgeInsets.only(top: getHeight() * 0.02),
                child: TextView.size14Text(lastname,
                    color: AppColors.greyTextColor,
                    fontFamily: Assets.raleWayMedium),
              ),
            ),
            Caregivers.myDivider(),
            ListTile(
              title: TextView.size14Text('Email',
                  color: AppColors.textcolr,
                  fontFamily: Assets.raleWaySemiBold),
              subtitle: Padding(
                padding: EdgeInsets.only(top: getHeight() * 0.02),
                child: TextView.size14Text(email,
                    color: AppColors.greyTextColor,
                    fontFamily: Assets.raleWayMedium),
              ),
            ),
            Caregivers.myDivider(),
            ListTile(
              title: TextView.size14Text(lastslide,
                  color: AppColors.textcolr,
                  fontFamily: Assets.raleWaySemiBold),
              subtitle: Padding(
                padding: EdgeInsets.only(top: getHeight() * 0.02),
                child: TextView.size14Text(lastslidetxt,
                    color: AppColors.greyTextColor,
                    fontFamily: Assets.raleWayMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }






  static Widget myDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
      child: Divider(
          height: getHeight() * 0.01,
          thickness: getHeight() * 0.001,
          color: AppColors.dividerColor),
    );
  }
  
}