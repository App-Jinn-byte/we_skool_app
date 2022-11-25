import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class MiscWidgets {
  static Widget myBackButton(
      {required Function? onPress, required double height, width}) {
    return GestureDetector(
      onTap: () {
        onPress!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: sizes!.widthRatio * 10,
            vertical: sizes!.heightRatio * 10),
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.pureWhiteColor,
              width: 0.20,
            ),
            borderRadius:
            BorderRadius.all(Radius.circular(getHeight() * 0.016)),
            color: AppColors.pureWhiteColor,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 221, 217, 217),
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0, 2),
              )
            ]),
        child: Image.asset(
          Assets.backIcon,
        ),
      ),
    );
  }

  static Widget mycircleimage({dynamic child, Color? clr}) {
    return CircleAvatar(
      backgroundColor: clr,
      maxRadius: getHeight() * 0.02,
      child: child,
    );
  }

  static Widget myDivider() {
    return const Divider(
      thickness: 1.4,
      color: AppColors.dividercolr,
    );
  }

  static Widget searchField({
    TextEditingController? textEditingController,
  }) {
    return Container(
        height: getHeight() * 0.055,
        width: getWidth(),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: AppColors.shadow, blurRadius: 2, offset: Offset(1, 3))
          ],
          color: AppColors.pureWhiteColor,
          // border: Border.all(color: borderColor ?? AppColors.blackColor),
          borderRadius: BorderRadius.all(Radius.circular(getHeight() * .014)),
        ),
        child: TextField(
            cursorHeight: getHeight() * .024,
            controller: textEditingController,
            textAlignVertical: TextAlignVertical.center,
            cursorColor: AppColors.blackTextColor,
            style: TextStyle(
              color: AppColors.blackTextColor,
              fontSize: sizes!.fontSize14,
              fontFamily: Assets.raleWayRegular,
            ),
            decoration: InputDecoration(
              hintText: '   Search',
              hintStyle: TextStyle(
                color: AppColors.hintTextGreyColor,
                fontSize: sizes!.fontSize15,
                fontFamily: Assets.raleWayRegular,
              ),
              prefixIcon: FittedBox(
                fit: BoxFit.fitWidth,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 9),
                      child: Icon(
                        Icons.search,
                        color: AppColors.greyTextColor,
                      ),
                    ),
                    SizedBox(
                      width: getWidth() * 0.03,
                    ),
                    Container(
                      height: getHeight() * 0.02,
                      width: getWidth() * 0.002,
                      color: AppColors.greyTextColor,
                    ),

                  ],
                ),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                  left: getWidth() * 0.01, bottom: getHeight() * .01),
              alignLabelWithHint: false,
            )));
  }

  static Widget myBox(
      {String? title,
        subtitle,
        titlefile,
        subtitlefile,
        titleaction,
        subtitleaction}) {
    return Container(
      height: getHeight() * 0.33,
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
        padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            MiscWidgets.myDivider(),
            ListTile(
              title: TextView.size14Text(titlefile,
                  color: AppColors.textcolr,
                  fontFamily: Assets.raleWaySemiBold),
              subtitle: Padding(
                padding: EdgeInsets.only(top: getHeight() * 0.02),
                child: TextView.size14Text(subtitlefile,
                    color: AppColors.greyTextColor,
                    fontFamily: Assets.raleWayMedium),
              ),
            ),
            MiscWidgets.myDivider(),
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
    );
  }
}
