import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/text_views.dart';

import '../../res/colors.dart';

class PaymentsComponents {
  static Widget mypaymentBox(
      {double? height,
      String? packagetitle,
      email,
      packagedate,
      status,
      expirydate,
        @required Function? onPressButton
    }) {
    return Container(
      height: height ?? getHeight() * 0.62,
      width: getWidth(),
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
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getWidth() * 0.03, vertical: getHeight() * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView.size14Text('Package Title', color: AppColors.textColor),
            SizedBox(
              height: getHeight() * 0.02,
            ),
            TextView.size14Text(packagetitle,
                color: AppColors.greyTextColor,
                fontFamily: Assets.raleWayMedium),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            PaymentsComponents.myDivider(),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text('Email', color: AppColors.textColor),
            SizedBox(
              height: getHeight() * 0.02,
            ),
            TextView.size14Text(email,
                color: AppColors.greyTextColor,
                fontFamily: Assets.raleWayMedium),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            PaymentsComponents.myDivider(),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text('Package Date', color: AppColors.textColor),
            SizedBox(
              height: getHeight() * 0.02,
            ),
            TextView.size14Text(packagedate,
                color: AppColors.greyTextColor,
                fontFamily: Assets.raleWayMedium),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            PaymentsComponents.myDivider(),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text('Status', color: AppColors.textColor),
            SizedBox(
              height: getHeight() * 0.012,
            ),
            TextView.size14Text(status, color: AppColors.greyTextColor),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            PaymentsComponents.myDivider(),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text('Expiry Date', color: AppColors.textColor),
            SizedBox(
              height: getHeight() * 0.02,
            ),
            TextView.size14Text(expirydate,
                color: AppColors.greyTextColor,
                fontFamily: Assets.raleWayMedium),
            PaymentsComponents.myDivider(),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text('Action', color: AppColors.textColor),
            SizedBox(
              height: getHeight() * 0.02,
            ),
            getPdfButton(onPress: () {
              onPressButton!.call();
            }, text: 'Invoice Download PDF'),
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

  static Widget getPdfButton({
    double? width,
    double? height,
    String? text,
    required Function? onPress,
    Color? btnColor,
    Color? textColor,
    Color? borderColor,
    final fontFamily,
    final fontWeight,
  }) {
    return GestureDetector(
      onTap: () {
        onPress!.call();
      },
      child: Container(
          height: height ?? getHeight() * 0.06,
          width: width ?? sizes!.width,
          decoration: BoxDecoration(
            color: btnColor ?? AppColors.pinkColor,
            border: Border.all(color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(
              getWidth() * .02,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView.size14Text(text,
                  color: AppColors.pureWhiteColor,
                  fontFamily: Assets.raleWayMedium,
                  fontWeight: FontWeight.w500),
              SizedBox(
                width: getWidth() * 0.04,
              ),
              Image.asset(Assets.download),
             
            ],
          )),
    );
  }
}
