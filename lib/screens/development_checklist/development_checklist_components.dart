import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';

import '../../widgets/text_views.dart';

class DevelopmentCheckComponents {
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
        // margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
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

  Widget getQuizContainer({
    @required String? headingText,
    @required String? question,
    @required bool? isSelected,
    @required List? pointsList,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView.size20Text(headingText, color: AppColors.blackLight, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600, lines: 1),
        SizedBox(height: getHeight() * 0.02),
        Container(
            height: getHeight() * 0.42,
            width: getWidth(),
            padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04, vertical: getHeight() * 0.02),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.pureWhiteColor,
              border: Border.all(color: AppColors.blackLight, width: getWidth() * 0.00005),
              borderRadius: BorderRadius.circular(
                getWidth() * .035,
              ),
              boxShadow:  const [
                BoxShadow(
                    color: AppColors.borderColor,
                    blurRadius: 4,
                    offset: Offset(0,0)
                )
              ],
            ),
            child: Column(
              children: [
                Text(
                  question!,
                  // i.toString(),
                  // textAlign: TextAlign.justify,
                  softWrap: true,
                  maxLines: 8,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: sizes!.fontSize16,
                    fontWeight: FontWeight.w600,
                    fontFamily: Assets.raleWaySemiBold,
                    height: 1.4,
                    color: AppColors.darkGreyColor,
                  ),
                ),
                SizedBox(height: getHeight() * 0.02),

                Expanded(
                  child: ScrollConfiguration(
                    behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
                    child: ListView.builder(
                      itemCount: pointsList!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: getHeight() * 0.003),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: (isSelected ?? false) ? AppColors.pinkColor : AppColors.pureWhiteColor,
                                        border: (isSelected ?? false)
                                            ? Border.all(color: AppColors.pureWhiteColor)
                                            : Border.all(width: getWidth() * 0.005,
                                            color: AppColors.darkGreyColor),
                                      ),
                                      child: (isSelected ?? false)
                                          ? Icon(
                                        Icons.check,
                                        size: getWidth() * 0.03,
                                        color: Colors.white,
                                      )
                                          : Icon(
                                        Icons.check,
                                        size: getWidth() * 0.03,
                                        color: Colors.white,
                                      )),
                                  SizedBox(width: getWidth() * 0.02),
                                  SizedBox(
                                      width: getWidth() * 0.7,
                                      child: TextView.size14Text(
                                          pointsList[index],
                                          fontFamily: Assets.raleWayRegular,
                                          color: AppColors.blackLight,
                                          lines: 3))
                                ],
                              ),
                              SizedBox(height: getHeight() * 0.02)
                            ],
                          );
                        }
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
