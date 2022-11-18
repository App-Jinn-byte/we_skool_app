import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';
import 'package:we_skool_app/res/colors.dart';

import '../../res/strings.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({Key? key}) : super(key: key);

  @override
  _OnBoarding1State createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.appBackground,
        body: Container(
            height: sizes!.height,
            width: sizes!.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.backGroundImage), fit: BoxFit.fill
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: getHeight() * 0.6,
                  width: getWidth(),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.onBoarding1), fit: BoxFit.fill
                      )),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView.size24Text700("Made For Children", Assets.raleWayBold, color: AppColors.blackColor, lines: 1),
                        SizedBox(height: getHeight() * 0.02),
                        TextView.size14Text(Strings.onBoarding1Text, fontFamily: Assets.raleWayRegular,
                            color: AppColors.greyTextColor, lines: 5),
                        SizedBox(height: getHeight() * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: getHeight() * 0.02,
                              width: getWidth() * 0.03,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.pinkColor,
                                border: Border.all(color: AppColors.pinkColor, width: 1)
                              ),
                            ),
                            SizedBox(width: getWidth() * 0.02),
                            Container(
                              height: getHeight() * 0.02,
                              width: getWidth() * 0.03,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.pinkColor, width: 1)
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: getHeight() * 0.04),
                        CommonWidgets.getButton(
                            btnColor: AppColors.pinkColor,
                            text: "Next",
                            fontFamily: Assets.raleWaySemiBold,
                            textColor: AppColors.pureWhiteColor,
                            onPress: () {

                            }),
                      ],
                    ),
                )
              ],
            )),
      ),
    );
  }
}
