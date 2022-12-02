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

   static Widget myBox({double? height,String? title,Desc,Link,action,titletxt,desctxt,linktxt,actiontxt}) {
    return Container(
      height: height,
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
            horizontal: getWidth() * 0.04, vertical: getHeight() * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView.size14Text(title, color: AppColors.textcolr),
            SizedBox(height: getHeight()*0.02,),
            TextView.size14Text(titletxt,color: AppColors.greyTextColor,fontFamily: Assets.raleWayMedium),
            ReadWidgets.myDividers(),


            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text(Desc, color: AppColors.textcolr),
            SizedBox(height: getHeight()*0.01,),
            TextView.size14Text(desctxt,color: AppColors.greyTextColor,fontFamily: Assets.raleWayMedium),
            SizedBox(
              height: getHeight() * 0.05,
            ),
            ReadWidgets.myDividers(),

            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text(Link, color: AppColors.textcolr),
            SizedBox(height: getHeight()*0.02,),
            TextView.size14Text(linktxt,color: AppColors.greyTextColor,fontFamily: Assets.raleWayMedium),
            ReadWidgets.myDividers(),
            SizedBox(
              height: getHeight() * 0.01,
            ),
            TextView.size14Text(action, color: AppColors.textcolr),
            SizedBox(
              height: getHeight() * 0.012,
            ),
            TextView.size14Text(actiontxt, color: AppColors.greyTextColor),
          ],
        ),
      ),
    );
  }

  static Widget myDividers() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.01),
      child: Divider(
          height: getHeight() * 0.01,
          thickness: getHeight() * 0.001,
          color: AppColors.dividerColor),
    );
  }
}
