import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';

import '../../../../res/assets.dart';
import '../../../../res/colors.dart';
import '../../../../res/res.dart';
import '../../../../widgets/text_views.dart';

class CalendarComponents {
 Widget getDateText({
   @required String? date,
   @required String? text}) {
   return Container(
     height: getHeight() * 0.04,
     width: getWidth(),
     padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04),
     decoration: BoxDecoration(
       color: AppColors.pureWhiteColor,
       border: Border.all(color: AppColors.calendarBorder),
       borderRadius: BorderRadius.all(Radius.circular(getHeight() * .014)),
     ),
     child: Row(
       children: [
         TextView.size12Text(DateTimeFormat.format(DateTime.parse(date!), format: 'j M, Y'),
             color: AppColors.pureBlack, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600),
         SizedBox(width: getWidth() * 0.04),
         Container(
           height: getHeight() * 0.025,
           width: getWidth() * 0.002,
           color: AppColors.greyTextColor,
         ),
         SizedBox(width: getWidth() * 0.04),
         TextView.size12Text(text, color: AppColors.pureBlack, lines: 1,
             fontFamily: Assets.raleWayMedium, fontWeight: FontWeight.w500),
       ],
     ),
   );
 }
}