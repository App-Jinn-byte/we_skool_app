import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';

import '../../widgets/text_views.dart';

class DevelepmentCheckComponents {
  static Widget myBox({double? height,String? title,Desc,status,Agegroup,titletxt,desctxt,agegrouptxt,satustxt}) {
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
            horizontal: getWidth() * 0.04, vertical: getHeight() * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView.size14Text(title, color: AppColors.textcolr),
            SizedBox(height: getHeight()*0.02,),
            TextView.size14Text(titletxt,color: AppColors.greyTextColor,fontFamily: Assets.raleWayMedium),
            DevelepmentCheckComponents.myDivider(),

            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text(Desc, color: AppColors.textcolr),
            SizedBox(height: getHeight()*0.02,),
            TextView.size14Text(desctxt,color: AppColors.greyTextColor,fontFamily: Assets.raleWayMedium),
            SizedBox(
              height: getHeight() * 0.05,
            ),
            DevelepmentCheckComponents.myDivider(),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text(Agegroup, color: AppColors.textcolr),
            SizedBox(height: getHeight()*0.02,),
            TextView.size14Text(agegrouptxt,color: AppColors.greyTextColor,fontFamily: Assets.raleWayMedium),
            DevelepmentCheckComponents.myDivider(),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text(status, color: AppColors.textcolr),
            SizedBox(
              height: getHeight() * 0.012,
            ),
            TextView.size14Text(satustxt, color: AppColors.greyTextColor),
          ],
        ),
      ),
    );
  }

  static Widget myDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.01),
      child: Divider(
          height: getHeight() * 0.01,
          thickness: getHeight() * 0.001,
          color: AppColors.dividerColor),
    );
  }
}
