
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_skool_app/res/colors.dart';

import '../../res/assets.dart';
import '../../res/res.dart';

class ContactUsComponents {
  static Widget   mytextField(
      {TextEditingController? textEditingController,
        bool? obscureText,
        String? hint,
        TextInputType? textInputType,
        double? width,height,
        String? icon,
        Color? borderColor,
        Color? bgColor,
        int? maxline,
         int? minline
        
        }) {
    return Container(
      height: height ?? sizes!.height,
      width: width ?? sizes!.width,
      decoration: BoxDecoration(
          boxShadow:  const [
            BoxShadow(
                color: AppColors.hintTextGreyColor,
                blurRadius: 1,
                offset: Offset(1,0)
            )
          ],
          color: bgColor ?? AppColors.pureWhiteColor,
          // border: Border.all(color: borderColor ?? AppColors.blackColor),
          borderRadius: BorderRadius.all(Radius.circular(getHeight() * .01))),

      child: Center(
        child: TextField(
          textAlign: TextAlign.start,
          textDirection: TextDirection.ltr,
          minLines: minline,

          maxLines: maxline,
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
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: getWidth() * .04, bottom: getHeight() * 0.01),
              hintText: hint ?? "",
 alignLabelWithHint: false,
              hintStyle: TextStyle(
                color: AppColors.hintTextGreyColor,
                fontSize: sizes!.fontSize14,
                fontFamily: Assets.raleWayRegular,
                fontWeight: FontWeight.w500,
              )),
        ),
      ),
    );
  }
  static Widget myDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.01),
      child: Divider(
          height: getHeight() * 0.01,
          thickness: getHeight() * 0.001,
          color: AppColors.dividerColor),
    );
  }
}