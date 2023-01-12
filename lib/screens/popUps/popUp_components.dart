import 'package:flutter/material.dart';

import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/res.dart';
import '../../widgets/text_views.dart';

class PopUpComponents {
 static Widget monthlyFrameWorkPopUp({@required BuildContext? context, @required String? text}) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        clipBehavior: Clip.none, alignment: Alignment.center,
        children: [
          Container(
            height: sizes!.height * 0.3,
            width: sizes!.widthRatio * 326,
            padding: EdgeInsets.only(
                left: sizes!.pagePadding,
                right: sizes!.pagePadding,
                top: sizes!.pagePadding * 1.5
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Align(
                //   alignment: Alignment.centerRight,
                //   child: Icon(Icons.cancel_outlined,
                //       color: AppColors.pinkColor, size: 35)
                // ),
                SizedBox(
                  height: sizes!.heightRatio * 10,
                ),
                TextView.size14Text(text, color: AppColors.blackLight, fontFamily: Assets.raleWayRegular, lines: 4),
                SizedBox(
                  height: sizes!.heightRatio * 20,
                ),
              ],
            ),
          ),
          Positioned(

              top: sizes!.heightRatio * -35,
              right: - 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context!);
                },
                child: SizedBox(
                  height: sizes!.heightRatio * 80,
                  child: const Icon(Icons.cancel_outlined,
                      color: AppColors.pinkColor, size: 35)
                ),
              ))
        ],
      ),
    );
  }
}