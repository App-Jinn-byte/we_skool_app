import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/text_views.dart';

import '../../../../res/assets.dart';
import '../../../../res/colors.dart';
import '../../../../res/sizes.dart';
import '../../../../widgets/common_widgets.dart';

class DailyObservationComponents {
  // Widget getTab({
  //   @required String? text,
  // }){
  //   return Container(
  //     width: getWidth() * 0.4,
  //     height: getHeight() * 0.05,
  //     decoration: BoxDecoration(
  //       border: Border.all(
  //         color: AppColors.grey2colrtext,
  //       ),
  //       borderRadius: BorderRadius.circular(05),
  //     ),
  //     child: Tab(
  //       // child: count == 0? Text(text+' (0)'): Text(text+' ($count)'),
  //       child: TextView.size14Text(text,)
  //     ),
  //   );
  // }

  Widget textField({@required TextEditingController? textEditingController, Color? fieldColor, Color? borderColor}) {
    return Container(
      width: sizes!.widthRatio * 325,
      height: getHeight() * 0.12,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.textFieldBigBorder,
          width: 0.25,
        ),
        borderRadius: BorderRadius.all(Radius.circular(getWidth() * 0.02)),
        color: fieldColor ?? AppColors.textFieldBigBorder,
        boxShadow: [
          BoxShadow(
            color: borderColor ?? AppColors.borderColor,
            blurRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: TextField(
        maxLines: 8,
        controller: textEditingController,
        cursorHeight: getHeight() * .025,
        style: TextStyle(
          color: AppColors.blackTextColor,
          fontFamily: Assets.raleWayMedium,
          fontSize: sizes!.fontSize14,
          fontWeight: FontWeight.w500
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              left: sizes!.widthRatio * 10,
              bottom: sizes!.heightRatio * 10,
              top: sizes!.heightRatio * 10,
              right: sizes!.widthRatio * 10),
          border: InputBorder.none,
          hintText: 'Type Something',
          hintStyle: TextStyle(
              color: AppColors.hintTextGreyColor,
              fontFamily: Assets.raleWayRegular,
              fontSize: sizes!.fontSize14
          ),
        ),
      ),
    );
  }

  Widget buttonRow({
    @required Function? onPressCancel,
    @required Function? onPressSave,
    @required Function? onPressSubmit,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonWidgets.getButton(
            width: getWidth() * 0.28,
            height: getHeight() * 0.06,
            onPress: () {
              onPressCancel!.call();
            },
            borderColor: AppColors.yellowColor,
            btnColor: AppColors.pureWhiteColor,
            text: "Cancel",
            fontFamily: Assets.raleWaySemiBold,
            fontWeight: FontWeight.w600,
            textColor: AppColors.yellowColor),
        CommonWidgets.getButton(
            width: getWidth() * 0.28,
            height: getHeight() * 0.06,
            onPress: () {
              onPressSave!.call();
            },
            borderColor: AppColors.yellowColor,
            btnColor: AppColors.pureWhiteColor,
            text: "Save",
            fontFamily: Assets.raleWaySemiBold,
            fontWeight: FontWeight.w600,
            textColor: AppColors.yellowColor),
        CommonWidgets.getButton(
            width: getWidth() * 0.28,
            height: getHeight() * 0.06,
            onPress: () {
              onPressSubmit!.call();
            },
            text: "Submit",
            fontFamily: Assets.raleWaySemiBold,
            fontWeight: FontWeight.w600,
            textColor: AppColors.pureWhiteColor),
      ],
    );
  }
  Widget getDateField({@required String? date, @required Function? onPressDate, Color? bgColor}) {
    return GestureDetector(
      onTap: () {
        if (onPressDate != null) {
          onPressDate.call();
        }
      },
      child: Container(
        height: sizes!.height * 0.04,
        width: sizes!.width * 0.4,
        margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
        padding: EdgeInsets.symmetric(horizontal: sizes!.width * 0.05),
        decoration: BoxDecoration(
            color: bgColor ?? AppColors.pureWhiteColor,
            border: Border.all(color: AppColors.grey2colrtext),
            borderRadius: BorderRadius.all(Radius.circular(getHeight() * .01))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextView.size14Text(date, color: date == "Select Date" ? AppColors.grey2colrtext: AppColors.blackTextColor, fontFamily: Assets.raleWayRegular),

          ],
        ),
      ),
    );
  }
}