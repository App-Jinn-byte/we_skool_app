import 'package:flutter/material.dart';
import 'package:we_skool_app/widgets/text_views.dart';

import '../res/assets.dart';
import '../res/colors.dart';
import '../res/res.dart';

class CommonWidgets {
  static Widget getButton({
    double? width,
    String? text,
    required Function? onPress,
    Color? btnColor,
    Color? textColor,
    Color? borderColor,
    final fontFamily,
  }) {
    return GestureDetector(
      onTap: () {
        onPress!.call();
      },
      child: Container(
        height: getHeight() * 0.07,
        width: width ?? sizes!.width,
        decoration: BoxDecoration(
          color: btnColor ?? AppColors.darkBlueColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(
            getWidth() * .02,
          ),
        ),
        child: Center(
            child: TextView.size18Text(
          text ?? "SUBMIT",
          fontFamily: fontFamily ?? Assets.raleWayBold,
          color: textColor ?? AppColors.pureWhiteColor,
        )),
      ),
    );
  }

  static Widget appBarSimple({
    String? title,
    Function? onPressBack,
  }) {
    return Container(
      width: sizes?.width,
      color: AppColors.darkBlueColor,
      padding: EdgeInsets.only(
        left: sizes!.pagePadding,
        right: sizes!.pagePadding,
        top: getHeight() * 0.07,
        bottom: getHeight() * 0.025,
      ),
      child: Row(
        children: [
          GestureDetector(
              onTap: () => onPressBack!(),
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.pureWhiteColor,
                size: 25,
              )),
          SizedBox(width: getHeight() * 0.01),
          SizedBox(
            width: getWidth() * 0.72,
            child: Text(
              title ?? "",
              style: TextStyle(
                color: AppColors.pureWhiteColor,
                fontSize: sizes?.fontSize24,
                fontFamily: Assets.raleWayBold,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
