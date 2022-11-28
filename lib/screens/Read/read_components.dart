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
            TextView.size14Text('Link', color: AppColors.textcolr),
            TextField(
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.dividerColor)),
                hintText: 'Your Link here',
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
            TextView.size14Text('Action', color: AppColors.textcolr),
            SizedBox(
              height: getHeight() * 0.012,
            ),
            TextView.size14Text('Active Status', color: AppColors.greyTextColor),
          ],
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
