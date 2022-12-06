
import 'package:flutter/cupertino.dart';

import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/res.dart';
import '../../res/strings.dart';
import '../../widgets/common_widgets.dart';
import '../../widgets/text_views.dart';

class OnBoarding1Components {
  Widget onBoardingContainer({
    @required String? heading,
    @required String? description,
    @required String? buttonText,
    @required Function? onPressButton,
    final circle1Color,
    final circle2Color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getHeight() * 0.02),
          TextView.size24Text(heading, Assets.raleWayBold, color: AppColors.blackColor, fontWeight: FontWeight.w700, lines: 1),
          SizedBox(height: getHeight() * 0.02),
          TextView.size14Text(description, fontFamily: Assets.raleWayRegular,
              color: AppColors.greyTextColor, lines: 5),
          SizedBox(height: getHeight() * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: getHeight() * 0.02,
                width: getWidth() * 0.03,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circle1Color ?? AppColors.pinkColor,
                    border: Border.all(color: AppColors.pinkColor, width: 1)
                ),
              ),
              SizedBox(width: getWidth() * 0.02),
              Container(
                height: getHeight() * 0.02,
                width: getWidth() * 0.03,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: circle2Color ?? AppColors.pinkColor,
                    border: Border.all(color: AppColors.pinkColor, width: 1)
                ),
              ),

            ],
          ),
          SizedBox(height: getHeight() * 0.05),
          CommonWidgets.getButton(
              btnColor: AppColors.pinkColor,
              text: buttonText,
              fontFamily: Assets.raleWaySemiBold,
              textColor: AppColors.pureWhiteColor,
              onPress: () {
                onPressButton!.call();
              }),
        ],
      ),
    );
  }
}