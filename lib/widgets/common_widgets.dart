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
    final fontWeight,
  }) {
    return GestureDetector(
      onTap: () {
        onPress!.call();
      },
      child: Container(
        height: getHeight() * 0.07,
        width: width ?? sizes!.width,
        decoration: BoxDecoration(
          color: btnColor ?? AppColors.pinkColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(
            getWidth() * .02,
          ),
        ),
        child: Center(
            child: TextView.size18Text(
          text ?? "SUBMIT",
          fontFamily: fontFamily ?? Assets.raleWayBold,
          fontWeight: fontWeight,
          color: textColor ?? AppColors.pureWhiteColor,
        )),
      ),
    );
  }

  static Widget customBackButton({required Function? onPress}) {
    return GestureDetector(
      onTap: () {
        onPress!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: sizes!.widthRatio * 10,
            vertical: sizes!.heightRatio * 10),
        width: sizes!.widthRatio * 40,
        height: sizes!.heightRatio * 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.pureWhiteColor,
            width: 0.25,
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(
                  getHeight() * 0.015
              )),
          color: AppColors.pureWhiteColor,
        ),
        child: Image.asset(
          Assets.backIcon,
        ),
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

  static Widget textField(
      {TextEditingController? textEditingController,
        bool? obscureText,
        String? hint,
        TextInputType? textInputType,
        double? width,
        String? icon,
        Color? borderColor,
        Color? bgColor}) {
    return Container(
      height: getHeight() * 0.07,
      width: width ?? sizes!.width,
      decoration: BoxDecoration(
          boxShadow:  const [
            BoxShadow(
                color: AppColors.hintTextGreyColor,
                blurRadius: 1,
                offset: Offset(0,0)
            )
          ],
          color: bgColor ?? AppColors.pureWhiteColor,
          // border: Border.all(color: borderColor ?? AppColors.blackColor),
          borderRadius: BorderRadius.all(Radius.circular(getHeight() * .01))),

      child: TextField(
        controller: textEditingController,
        obscureText: obscureText ?? false,
        cursorHeight: getHeight() * .025,
        keyboardType: textInputType ?? TextInputType.text,
        cursorColor: AppColors.blackTextColor,
        style: TextStyle(
          color: AppColors.blackTextColor,
          fontSize: sizes!.fontSize14,
          fontFamily: Assets.raleWayRegular,
        ),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: getWidth() * .04),
            hintText: hint ?? "",
            alignLabelWithHint: false,
            hintStyle: TextStyle(
              color: AppColors.hintTextGreyColor,
              fontSize: sizes!.fontSize14,
              fontFamily: Assets.raleWayRegular,
            )),
      ),
    );
  }

  static Widget textFieldPassword(
      {TextEditingController? textEditingController,
        String? hint,
        TextInputType? textInputType,
        double? width,
        String? icon,
        required bool hidePassword,
        @required Function? clickIcon,
        Color? borderColor,
        Color? bgColor}) {
    return Container(
      height: getHeight() * 0.07,
      width: width ?? sizes!.width,
      decoration: BoxDecoration(
          boxShadow:  const [
            BoxShadow(
                color: AppColors.hintTextGreyColor,
                blurRadius: 1,
                offset: Offset(0,0)
            )
          ],
          color: bgColor ?? AppColors.pureWhiteColor,
          // border: Border.all(color: borderColor ?? AppColors.blackColor),
          borderRadius: BorderRadius.all(Radius.circular(getHeight() * .01))),

      child: Center(
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          controller: textEditingController,
          obscureText: hidePassword,
          cursorHeight: getHeight() * .025,
          keyboardType: textInputType ?? TextInputType.text,
          cursorColor: AppColors.blackTextColor,
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: sizes!.fontSize14,
            fontFamily: Assets.raleWayRegular,
          ),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: getWidth() * .04),
              hintText: hint ?? "",
              alignLabelWithHint: false,
              hintStyle: TextStyle(
                color: AppColors.hintTextGreyColor,
                fontSize: sizes!.fontSize14,
                fontFamily: Assets.raleWayRegular,
              ),
            suffixIcon: IconButton(
              icon: Icon(
                hidePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.hintTextGreyColor,
              ),
              onPressed: () {
                if (clickIcon != null) {
                  clickIcon.call();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

}
