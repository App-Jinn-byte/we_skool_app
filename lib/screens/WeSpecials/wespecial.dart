import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';

import '../../res/colors.dart';
import '../../widgets/common_widgets.dart';
import '../../widgets/text_views.dart';
import 'wespecial_components.dart';

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
                image: AssetImage(Assets.lightBackground), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              CommonWidgets.appBarIconImageText(
                  text: 'We Specials',
                  image: '',
                  isDataFetched: false,
                  onPressMenu: () {
                    Navigator.pop(context);
                  }),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getHeight() * 0.001,
                    horizontal: getWidth() * 0.051),
                child: Column(
                  children: [
                    SizedBox(
                      height: getHeight() * 0.04,
                    ),
            Column(
              children: [
                Container(
                  height: getHeight() * 0.28,
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
                   SizedBox(height: getHeight() * 0.02),

                        WeSpecialWidgets.miniContainer(
                            color: AppColors.redColor,
                            colortext: AppColors.redColor,
                            text1: 'Yoga Class',
                            textprice: 'Price/50'),
                   SizedBox(height: getHeight() * 0.02),

                        WeSpecialWidgets.miniContainer(
                            color: AppColors.greyColor,
                            colortext: AppColors.greyTextColor,
                            text1: 'Dance Class',
                            textprice: 'Price/50'),
                 SizedBox(height: getHeight() * 0.02),

                        WeSpecialWidgets.miniContainer(
                            color: AppColors.greyColor,
                            colortext: AppColors.greyTextColor,
                            text1: 'Music Class',
                            textprice: 'Price/50',


                            ),
                             SizedBox(height: getHeight() * 0.02),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: getHeight() * 0.01),

                WeSpecialWidgets.myDividers(),
              SizedBox(height: getHeight() * 0.03),

                CommonWidgets.getButton(onPress: (){


                },text: 'Enroll'),
              ],
            )
          ],
          ),
        ),
            ],
      ),
      ),
      ),
    );
  }
}
