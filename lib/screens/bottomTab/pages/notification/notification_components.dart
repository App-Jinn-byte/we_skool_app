import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_skool_app/widgets/text_views.dart';

import '../../../../res/assets.dart';
import '../../../../res/colors.dart';
import '../../../../res/res.dart';

class NotificationComponents {
  Widget notificationTile({
    @required String? image,
    @required String? text,
    required bool isDataFetched,
  }) {
    return Container(
      height: getHeight() * 0.07,
      width: getWidth(),
      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.03, vertical: getHeight() * 0.01),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: AppColors.borderColor, blurRadius: 10, offset: Offset(0, 1))
        ],
        border: Border.all(color: AppColors.borderColor),
        color: AppColors.pureWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(getHeight() * .014)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: isDataFetched
                ? NetworkImage(image!)
                : const AssetImage(Assets.notificationUnRead)
            as ImageProvider,
            radius: getHeight() * 0.02, // 50.0
            backgroundColor: AppColors.transparentColor,

          ),
          SizedBox(width: getWidth() * 0.04),
          TextView.size14Text(text, color: AppColors.blackLight, fontFamily: Assets.raleWayMedium, fontWeight: FontWeight.w500, lines: 1)
        ],
      ),
    );
  }
}