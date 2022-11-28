import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';

import '../../widgets/text_views.dart';

class DevelepmentCheckComponents {
  static Widget myBox({double? height}) {
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
            TextView.size14Text('Title', color: AppColors.textcolr),
            TextField(
              decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dividerColor)),
                  hintText: 'Your text here',
                  hintStyle: TextStyle(
                    fontFamily: Assets.raleWayMedium,
                    color: AppColors.greyTextColor,
                    fontSize: sizes!.fontSize14,
                  )),
            ),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text('Description', color: AppColors.textcolr),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.dividerColor)),
                  hintText: 'Your text here...',
                  hintStyle: TextStyle(
                    fontFamily: Assets.raleWayMedium,
                    color: AppColors.greyTextColor,
                    fontSize: sizes!.fontSize14,
                  )),
            ),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text('Age group', color: AppColors.textcolr),
            TextField(
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.dividerColor)),
                hintText: '6 months to 12 months',
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
            TextView.size14Text('Status', color: AppColors.textcolr),
            SizedBox(
              height: getHeight() * 0.012,
            ),
            TextView.size14Text('Active', color: AppColors.greyTextColor),
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
