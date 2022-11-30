import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/text_views.dart';

import '../../res/assets.dart';

class WeMonthlyComponents {
  static Widget weekwidget(
      {double? height,
      width,
      Color? color,
      txtcolr,
      String? text,
      Function()? onpress}) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: height ?? getHeight() * 0.04,
        width: width ?? getWidth() * 0.18,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(getHeight() * 0.01),
        ),
        child: Center(
            child: TextView.size14Text(text,
                color: txtcolr,
                fontFamily: Assets.raleWaySemiBold,
                fontWeight: FontWeight.w600)),
      ),
    );
  }

  static Widget daywidget(
      {double? height,
      width,
      Color? color,
      txtcolr,
      String? text,
      Function()? onpress,
      String? fontfamily,
      FontWeight? fontweight}) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: height ?? getHeight() * 0.04,
        width: width ?? getWidth() * 0.12,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(getHeight() * 0.02),
        ),
        child: Center(
            child: TextView.size14Text(text,
                color: txtcolr,
                fontFamily: fontfamily,
                fontWeight: fontweight)),
      ),
    );
  }

  static Widget miniContainer({
    String? timetext1,
    timetextdetail,
    required Color color,
    colortext,
  }) {
    return Container(
      height: getHeight() * 0.044,
      width: getWidth(),
      decoration: BoxDecoration(
        color: AppColors.pureWhiteColor,
           shape: BoxShape.rectangle,
        
          border:
              Border.all(color: AppColors.borderColor, width: getWidth() * 0.005),
          boxShadow: const [
          BoxShadow(
              color: AppColors.borderColor, blurRadius: 10, offset: Offset(0, 1))
        ],
        borderRadius: BorderRadius.all(Radius.circular(getHeight() * .012)),
      ),
      child: Row(
        children: [
          const Spacer(),
          TextView.size14Text(timetext1, color: colortext),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(getHeight() * 0.01),
            child: const VerticalDivider(
              color: AppColors.greyColor,
              thickness: 1,
            ),
          ),
          const Spacer(),
          TextView.size12Text(timetextdetail,
              color: colortext,
              fontFamily: Assets.raleWayMedium,
              fontWeight: FontWeight.w500),
          const Spacer(),
        ],
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