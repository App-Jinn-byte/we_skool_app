import 'package:flutter/cupertino.dart';

import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/res.dart';
import '../../widgets/text_views.dart';

class RegistrationComponents {
  Widget percentageBar({
    required Color? box1Color,
    required Color? box2Color,
    required Color? box3Color,
    required Color? text1Color,
    required Color? text2Color,
    required Color? text3Color,
    required Color? bar1Color,
    required Color? bar2Color,
  }) {
    return Row(
      children: [
        Container(
          // height: getHeight() * 0.05,
          padding: EdgeInsets.all(getHeight() * 0.01),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: box1Color ?? AppColors.yellowColor,
              border: Border.all(color: AppColors.pureWhiteColor, width: getWidth() * 0.005)
          ),
          child: Center(child: TextView.size16Text("1", Assets.raleWayBold, color: text1Color?? AppColors.pureWhiteColor, lines: 1)),
        ),
        Container(
          height: getHeight() * 0.008,
          width: getWidth() * 0.32,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: bar1Color?? AppColors.veryLightBLue,
          ),
        ),
        Container(
          // height: getHeight() * 0.05,
          padding: EdgeInsets.all(getHeight() * 0.01),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: box2Color ?? AppColors.veryLightBLue,
              border: Border.all(color: AppColors.pureWhiteColor, width: getWidth() * 0.005)
          ),
          child: Center(child: TextView.size16Text("2", Assets.raleWayBold, color: text2Color?? AppColors.pureWhiteColor, lines: 1)),
        ),
        Container(
          height: getHeight() * 0.008,
          width: getWidth() * 0.32,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: bar2Color ?? AppColors.veryLightBLue,
          ),
        ),
        Container(
          // height: getHeight() * 0.05,
          padding: EdgeInsets.all(getHeight() * 0.01),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: box3Color ?? AppColors.veryLightBLue,
              border: Border.all(color: AppColors.pureWhiteColor, width: getWidth() * 0.005)
          ),
          child: Center(child: TextView.size14Text("3", fontFamily: Assets.raleWayBold, color: text3Color ?? AppColors.pureWhiteColor, lines: 1)),
        ),
      ],
    );
  }
}