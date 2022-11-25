import 'package:flutter/cupertino.dart';

import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/res.dart';
import '../../widgets/text_views.dart';

class DailyScheduleComponents {
  Widget getScheduleBar({
    @required String? time,
    @required String? text
  }) {
    return Container(
      width: getWidth(),
      height: getHeight() * 0.07,
      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04, vertical: getHeight() * 0.015),
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
              offset: Offset(0,0)
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView.size14Text(time ?? "8:00 am - 8:30 am", color: AppColors.pureBlack, fontWeight: FontWeight.w600, fontFamily: Assets.raleWaySemiBold),
          TextView.size14Text(text ?? "Tummy Time: Caregiver", color: AppColors.pureBlack, fontWeight: FontWeight.w600, fontFamily: Assets.raleWaySemiBold),

        ],
      ),
    );
  }
}