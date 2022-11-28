import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class ReadWidgets {

  static Widget myGetButton({
    double? width,
    String? text,
    double? height,
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
        height: height ?? sizes!.height,
        width: width ?? sizes!.width,
        decoration: BoxDecoration(
          color: btnColor ?? AppColors.pinkColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(
            getWidth() * .02,
          ),
        ),
        child: Center(
            child: TextView.size14Text(
          text ?? "SUBMIT",
          fontFamily: fontFamily ?? Assets.raleWaySemiBold,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: textColor ?? AppColors.pureWhiteColor,
        )),
      ),
    );
  }

  static Widget myBox({
    String? title,
    subtitle,
    descriptiontext,
    subtitledesc,
    titlelink,
    subtitlelink,
    titleaction,
    subtitleaction,
  }) {
    return Padding(
      padding: EdgeInsets.only(right: getWidth() * 0.01),
      child: Container(
        height: getHeight() * 0.55,
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
          padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.01),
          child: Column(
            children: [
              ListTile(
                title: TextView.size14Text(title,
                    color: AppColors.textcolr,
                    fontFamily: Assets.raleWaySemiBold),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: getHeight() * 0.02),
                  child: TextView.size14Text(subtitle,
                      color: AppColors.greyTextColor,
                      fontFamily: Assets.raleWayMedium),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(getWidth() * 0.02),
                child: ReadWidgets.myDividers(),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: getHeight() * 0.04),
                child: ListTile(
                  title: TextView.size14Text(descriptiontext,
                      color: AppColors.textcolr,
                      fontFamily: Assets.raleWaySemiBold),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: getHeight() * 0.02),
                    child: TextView.size14Text(subtitledesc,
                        lines: 3,
                        color: AppColors.greyTextColor,
                        fontFamily: Assets.raleWayMedium),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(getWidth() * 0.02),
                child: ReadWidgets.myDividers(),
              ),
              ListTile(
                title: TextView.size14Text(titlelink,
                    color: AppColors.textcolr,
                    fontFamily: Assets.raleWaySemiBold),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: getHeight() * 0.02),
                  child: TextView.size14Text(subtitlelink,
                      color: AppColors.greyTextColor,
                      fontFamily: Assets.raleWayMedium),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(getWidth() * 0.02),
                child: ReadWidgets.myDividers(),
              ),
              ListTile(
                title: TextView.size14Text(titleaction,
                    color: AppColors.textcolr,
                    fontFamily: Assets.raleWaySemiBold),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: getHeight() * 0.02),
                  child: TextView.size14Text(subtitleaction,
                      color: AppColors.greyTextColor,
                      fontFamily: Assets.raleWayMedium),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget myDividers() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
      child: Divider(
          height: getHeight() * 0.01,
          thickness: getHeight() * 0.001,
          color: AppColors.dividerColor),
    );
  }
}
