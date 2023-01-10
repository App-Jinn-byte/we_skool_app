import 'package:flutter/material.dart';
import 'package:we_skool_app/widgets/text_views.dart';

import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/res.dart';

class MonthlyFrameworkComponents {
  Widget frameWorkTiles ({
    @required String? text,
    @required String? image,
    required bool isDataFetched,
    @required String? headingText

  }) {
    return Container(
      width: getWidth(),
      // height: getHeight() * 0.16,
      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.03, vertical: getHeight() * 0.02),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.pureWhiteColor,
        border:
        Border.all(color: AppColors.borderColor, width: getWidth() * 0.005),
        borderRadius: BorderRadius.circular(
          getWidth() * .04,
        ),
        boxShadow:  const [
          BoxShadow(
              color: AppColors.borderColor,
              blurRadius: 5,
              offset: Offset(0,5)
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(getHeight() * 0.02),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.backGroundColor,
              border: Border.all(color: AppColors.yellowColor, width: getWidth() * 0.001)
            ),
            child: CircleAvatar(
              backgroundImage: isDataFetched
                  ? NetworkImage(image!)
                  : const AssetImage(Assets.socialIcon)
              as ImageProvider,
              radius: getHeight() * 0.028, // 50.0
              backgroundColor: AppColors.backGroundColor,
            ),
          ),
          SizedBox(width: getWidth() * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: getWidth() * 0.6,
                  child: TextView.size14Text(headingText, color: AppColors.pureBlack, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600, lines: 2)),
              SizedBox(height: getHeight() * 0.01),
              SizedBox(
                width: getWidth() * 0.6,
                  child: TextView.size14Text(text, color: AppColors.blackLight, fontFamily: Assets.raleWayRegular, lines: 4))
            ],
          )
        ],
      ),
    );
  }

  Widget seeMoreIcon({required Function onPressSeeMore, bool? isOpen}) {
    return GestureDetector(
        onTap: () {
          onPressSeeMore.call();
        },
        child: Icon( isOpen == true ?
            Icons.keyboard_arrow_up: Icons.keyboard_arrow_down_rounded,
            size: getWidth() * 0.1,
            color: AppColors.pinkColor));
  }
}