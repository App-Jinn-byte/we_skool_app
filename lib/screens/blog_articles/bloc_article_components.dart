import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class BlogArticleComponents {

  Widget myDivider() {
    return Divider(
        height: getHeight() * 0.04,
        thickness: getHeight() * 0.001,
        color: AppColors.dividerColor);
  }


  Widget myBox(
      {String? title,
        subtitle,
        titlefile,
        subtitlefile,
        titleaction,
        subtitleaction}) {
    return Container(
      height: getHeight() * 0.31,
      width: getWidth(),
      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04, vertical: getHeight() * 0.02),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView.size14Text(title,
              color: AppColors.blackLight, fontWeight: FontWeight.w600,
              fontFamily: Assets.raleWaySemiBold),
          SizedBox(height: getHeight() * 0.015),
          TextView.size14Text(subtitle, fontWeight: FontWeight.w500,
              color: AppColors.greyTextColor,
              fontFamily: Assets.raleWayMedium),
          myDivider(),
          TextView.size14Text(titlefile, fontWeight: FontWeight.w600,
              color: AppColors.blackLight,
              fontFamily: Assets.raleWaySemiBold),
          SizedBox(height: getHeight() * 0.015),
          TextView.size14Text(subtitlefile, fontWeight: FontWeight.w500,
              color: AppColors.greyTextColor,
              fontFamily: Assets.raleWayMedium),
          myDivider(),
          TextView.size14Text(titleaction, fontWeight: FontWeight.w600,
              color: AppColors.blackLight,
              fontFamily: Assets.raleWaySemiBold),
          SizedBox(height: getHeight() * 0.015),
          TextView.size14Text(subtitleaction, fontWeight: FontWeight.w500,
              color: AppColors.greyTextColor,
              fontFamily: Assets.raleWayMedium),
          // ListTile(
          //   title: TextView.size14Text(titleaction, fontWeight: FontWeight.w600,
          //       color: AppColors.textcolr,
          //       fontFamily: Assets.raleWaySemiBold),
          //   subtitle: Padding(
          //     padding: EdgeInsets.only(top: getHeight() * 0.02),
          //     child: TextView.size14Text(subtitleaction, fontWeight: FontWeight.w500,
          //         color: AppColors.greyTextColor,
          //         fontFamily: Assets.raleWayMedium),
          //   ),
          // ),
        ],
      ),
    );
  }

}