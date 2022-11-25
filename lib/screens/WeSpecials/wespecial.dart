import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';

import '../../res/colors.dart';
import '../../widgets/text_views.dart';
import 'Components/wespecial_components.dart';

class WeSpecialScreen extends StatelessWidget {
  const WeSpecialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: sizes!.height,
          width: sizes!.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.backGroundImage), fit: BoxFit.fill),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getWidth() * 0.05, vertical: getHeight() * 0.04),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    WeSpecialWidgets.myBackButton(
                      onPress: () {},
                      height: sizes!.widthRatio * 32,
                      width: sizes!.widthRatio * 32,
                    ),
                    Gap(getWidth() * 0.03),
                    TextView.size20Text('We Specials',
                        color: AppColors.pinkColor,
                        fontFamily: Assets.raleWaySemiBold,
                        fontWeight: FontWeight.w600),
                    const Spacer(),
                    WeSpecialWidgets.mycircleimage(),
                  ],
                ),
                Gap(getHeight() * 0.01),
                WeSpecialWidgets.myDividers(),
                Gap(getHeight() * 0.04),
                Column(
                  children: [
                    Container(
                      height: getHeight() * 0.25,
                      width: getWidth(),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: AppColors.shadow,
                              blurRadius: 2,
                              offset: Offset(1, 3))
                        ],
                        color: AppColors.pureWhiteColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(getHeight() * .014)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(getHeight() * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView.size14Text('Specials',
                                color: AppColors.blackTextColor,
                                fontFamily: Assets.raleWaySemiBold),
                            Gap(getHeight() * 0.02),
                            WeSpecialWidgets.miniContainer(
                                color: AppColors.redColor,
                                colortext: AppColors.redColor,
                                text1: 'Yoga Class',
                                textprice: 'Price/50'),
                            Gap(getHeight() * 0.02),
                            WeSpecialWidgets.miniContainer(
                                color: AppColors.greyColor,
                                colortext: AppColors.greyTextColor,
                                text1: 'Dance Class',
                                textprice: 'Price/50'),
                            Gap(getHeight() * 0.02),
                            WeSpecialWidgets.miniContainer(
                                color: AppColors.greyColor,
                                colortext: AppColors.greyTextColor,
                                text1: 'Music Class',
                                textprice: 'Price/50'),
                          ],
                        ),
                      ),
                    ),
                    Gap(getHeight() * 0.01),
                    WeSpecialWidgets.myDividers(),
                    Gap(getHeight() * 0.01),
                    WeSpecialWidgets.myGetButton(
                      onPress: () {},
                      height: getHeight() * 0.053,
                      width: getWidth(),
                      text: 'Enroll',
                      fontFamily: Assets.raleWaySemiBold,
                      fontWeight: FontWeight.bold,
                      textColor: AppColors.pureWhiteColor,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
