import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/res.dart';
import '../../widgets/common_widgets.dart';
import '../../widgets/text_views.dart';

class ForgotPasswordComponents {
  Widget otpContainer({
    required String? userEmail,
    required TextEditingController otpTextEditingController,
    required bool enable,
    required bool cursorEnable,
    required Function? onPressVerify,
    required Function? onPressSendAgain,

  }) {
    return Container(
      height: getHeight() * 0.56,
      width: sizes!.width,
      padding:
      EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: AppColors.hintTextGreyColor,
                blurRadius: 1,
                offset: Offset(0, 0))
          ],
          color: AppColors.pureWhiteColor,
          border: Border.all(
              color: AppColors.blackColor.withOpacity(0.001)),
          borderRadius: BorderRadius.all(
              Radius.circular(getHeight() * .04))),
      child: Column(
        children: [
          SizedBox(height: getHeight() * 0.04),
          TextView.size24Text(
              "Verify Email", Assets.raleWayBold,
              color: AppColors.blackTextColor,
              lines: 1,
              fontWeight: FontWeight.w700),
          SizedBox(height: getHeight() * 0.02),
          TextView.size14Text("We Have Sent Code To Email",
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w500,
              fontFamily: Assets.raleWayMedium),
          SizedBox(height: getHeight() * 0.05),
          TextView.size14Text(userEmail,
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w500,
              fontFamily: Assets.raleWayMedium),
          SizedBox(height: getHeight() * 0.04),
          SizedBox(
            height: getHeight() * 0.08,
            child: PinInputTextField(
              pinLength: 4,
              decoration: BoxLooseDecoration(
                strokeColorBuilder: PinListenColorBuilder(
                    AppColors.pinkColor,
                    AppColors.creamColor),
                textStyle: TextStyle(
                    fontSize: sizes!.fontSize32,
                    fontWeight: FontWeight.w400,
                    fontFamily: Assets.raleWayRegular,
                    color: AppColors.blackTextColor),
              ),
              controller: otpTextEditingController,
              textInputAction: TextInputAction.go,
              enabled: enable,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              enableInteractiveSelection: false,
              cursor: Cursor(
                width: getWidth() * 0.004,
                color: AppColors.pinkColor,
                radius: Radius.circular(getHeight() * 0.01),
                enabled: cursorEnable,
              ),
            ),
          ),
          SizedBox(height: getHeight() * 0.05),
          CommonWidgets.getButton(
              onPress: () {
                onPressVerify!.call();
              },
              text: "Verify",
              fontFamily: Assets.raleWaySemiBold,
              fontWeight: FontWeight.w600,
              textColor: AppColors.pureWhiteColor),
          SizedBox(height: getHeight() * 0.02),
          CommonWidgets.getButton(
              onPress: () {
                onPressSendAgain!.call();
              },
              text: "Send Again",
              fontFamily: Assets.raleWaySemiBold,
              fontWeight: FontWeight.w600,
              textColor: AppColors.yellowColor,
              btnColor: AppColors.pureWhiteColor,
              borderColor: AppColors.yellowColor),
        ],
      ),
    );
  }

  Widget highlightForgotPasswordText({@required String? text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: getWidth() * 0.015,
          height: getHeight() * 0.01,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.pinkColor,
          ),
        ),
        SizedBox(width: getWidth() * 0.02),
        TextView.size14Text(text,
            color: AppColors.pinkColor,
            fontFamily: Assets.raleWayRegular)
      ],
    );
  }
}