

import 'package:flutter/material.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';

import '../../res/assets.dart';
import '../../widgets/text_views.dart';

class CareGiversComponents {
  Widget myBox(
      {@required String? firstname,
        @required String? lastname,
        @required String? email,
        @required String? status,
        }) {
    return Container(
      height: getHeight() * 0.4,
      width: getWidth(),
      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04, vertical: getHeight() * 0.02),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView.size14Text('First Name', fontWeight: FontWeight.w600,
              color: AppColors.textColor,
              fontFamily: Assets.raleWaySemiBold),
          SizedBox(height: getHeight() * 0.015),
          TextView.size14Text(firstname,
              color: AppColors.greyTextColor, fontWeight: FontWeight.w500,
              fontFamily: Assets.raleWayMedium),
          myDivider(),
          TextView.size14Text('Last Name', fontWeight: FontWeight.w600,
              color: AppColors.textColor,
              fontFamily: Assets.raleWaySemiBold),
          SizedBox(height: getHeight() * 0.015),
          TextView.size14Text(lastname, fontWeight: FontWeight.w500,
              color: AppColors.greyTextColor,
              fontFamily: Assets.raleWayMedium),
          myDivider(),
          TextView.size14Text('Email', fontWeight: FontWeight.w600,
              color: AppColors.textColor,
              fontFamily: Assets.raleWaySemiBold),
          SizedBox(height: getHeight() * 0.015),
          TextView.size14Text(email, fontWeight: FontWeight.w500,
              color: AppColors.greyTextColor,
              fontFamily: Assets.raleWayMedium),
          myDivider(),
          TextView.size14Text('Status', fontWeight: FontWeight.w600,
              color: AppColors.textColor,
              fontFamily: Assets.raleWaySemiBold),
          SizedBox(height: getHeight() * 0.015),
          TextView.size14Text(status, fontWeight: FontWeight.w500,
              color: AppColors.greyTextColor,
              fontFamily: Assets.raleWayMedium),
        ],
      ),
    );
  }






  Widget myDivider() {
    return Divider(
        height: getHeight() * 0.035,
        thickness: getHeight() * 0.001,
        color: AppColors.dividerColor);
  }
  
}