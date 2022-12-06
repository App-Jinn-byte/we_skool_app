import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/we_monthly_schedule/we_monthly_components.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class WeMonthlySchedule extends StatelessWidget {
  const WeMonthlySchedule({super.key});

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);

    return SafeArea(
        child: Scaffold(
            body: Container(
                height: sizes!.height,
                width: sizes!.width,
                color: AppColors.pureWhiteColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CommonWidgets.appBarIconImageText(
                          text: "We Monthly Schedule",
                          image: "",
                          isDataFetched: false,
                          onPressMenu: () {
                            Navigator.pop(context);
                          }),
                      Container(
                        height: sizes!.height * 0.80,
                        margin:
                            EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.lightBackground),
                              fit: BoxFit.fill),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getWidth() * 0.01,
                              vertical: getHeight() * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WeMonthlyComponents.weekwidget(
                                    text: 'Week 1',
                                    color: AppColors.redColor,
                                    txtcolr: AppColors.pureWhiteColor,
                                  ),
                                  WeMonthlyComponents.weekwidget(
                                    text: 'Week 2',
                                    color: AppColors.greycontainer,
                                    txtcolr: AppColors.grey2colrtext,
                                  ),
                                  WeMonthlyComponents.weekwidget(
                                    text: 'Week 3',
                                    color: AppColors.greycontainer,
                                    txtcolr: AppColors.grey2colrtext,
                                  ),
                                  WeMonthlyComponents.weekwidget(
                                    text: 'Week 4',
                                    color: AppColors.greycontainer,
                                    txtcolr: AppColors.grey2colrtext,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getHeight() * 0.03,
                              ),
                              TextView.size20Text('Feburay 1st - 5th',
                                  color: AppColors.blackLight,
                                  fontFamily: Assets.raleWaySemiBold,
                                  fontWeight: FontWeight.w600),
                              SizedBox(
                                height: getHeight() * 0.018,
                              ),
                              WeMonthlyComponents.myDivider(),
                              SizedBox(
                                height: getHeight() * 0.018,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  WeMonthlyComponents.daywidget(
                                    text: 'Sun',
                                    color: AppColors.greycontainer,
                                    txtcolr: AppColors.yellowColor,
                                    fontfamily: Assets.raleWaySemiBold,
                                    fontweight: FontWeight.w600,
                                  ),
                                  WeMonthlyComponents.daywidget(
                                    text: 'Mon',
                                    color: AppColors.greycontainer,
                                    txtcolr: AppColors.blackBorderColor,
                                    fontfamily: Assets.raleWayRegular,
                                    fontweight: FontWeight.w400,
                                  ),
                                  WeMonthlyComponents.daywidget(
                                    text: 'Tue',
                                    color: AppColors.greycontainer,
                                    txtcolr: AppColors.blackBorderColor,
                                    fontfamily: Assets.raleWayRegular,
                                    fontweight: FontWeight.w400,
                                  ),
                                  WeMonthlyComponents.daywidget(
                                    text: 'Wed',
                                    color: AppColors.greycontainer,
                                    txtcolr: AppColors.blackBorderColor,
                                    fontfamily: Assets.raleWayRegular,
                                    fontweight: FontWeight.w400,
                                  ),
                                  WeMonthlyComponents.daywidget(
                                    text: 'Thu',
                                    color: AppColors.greycontainer,
                                    txtcolr: AppColors.blackBorderColor,
                                    fontfamily: Assets.raleWayRegular,
                                    fontweight: FontWeight.w400,
                                  ),
                                  WeMonthlyComponents.daywidget(
                                    text: 'Fri',
                                    color: AppColors.greycontainer,
                                    txtcolr: AppColors.blackBorderColor,
                                    fontfamily: Assets.raleWayRegular,
                                    fontweight: FontWeight.w400,
                                  ),
                                  WeMonthlyComponents.daywidget(
                                    text: 'Sat',
                                    color: AppColors.greycontainer,
                                    txtcolr: AppColors.yellowColor,
                                    fontfamily: Assets.raleWaySemiBold,
                                    fontweight: FontWeight.w600,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getHeight() * 0.03,
                              ),
                              Column(
                                children: [
                                  WeMonthlyComponents.miniContainer(
                                    timetext1: '8:00 am-8:30am',
                                    timetextdetail: 'Breakfast',
                                    color: AppColors.pureBlack,
                                    colortext: AppColors.textColor,
                                  ),
                                  SizedBox(
                                    height: getHeight() * 0.02,
                                  ),
                                  WeMonthlyComponents.miniContainer(
                                    timetext1: '8:00 am-8:30am',
                                    timetextdetail: 'Musicsss',
                                    color: AppColors.pureBlack,
                                    colortext: AppColors.textColor,
                                  ),
                                  SizedBox(
                                    height: getHeight() * 0.02,
                                  ),
                                  WeMonthlyComponents.miniContainer(
                                    timetext1: '8:00 am-8:30am',
                                    timetextdetail: 'Breakfast',
                                    color: AppColors.pureBlack,
                                    colortext: AppColors.textColor,
                                  ),
                                  SizedBox(
                                    height: getHeight() * 0.02,
                                  ),
                                  WeMonthlyComponents.miniContainer(
                                    timetext1: '8:00 am-8:30am',
                                    timetextdetail: 'Musicsss',
                                    color: AppColors.pureBlack,
                                    colortext: AppColors.textColor,
                                  ),
                                  SizedBox(
                                    height: getHeight() * 0.02,
                                  ),
                                  WeMonthlyComponents.miniContainer(
                                    timetext1: '8:00 am-8:30am',
                                    timetextdetail: 'Breakfast',
                                    color: AppColors.pureBlack,
                                    colortext: AppColors.textColor,
                                  ),
                                  SizedBox(
                                    height: getHeight() * 0.02,
                                  ),
                                  WeMonthlyComponents.miniContainer(
                                    timetext1: '8:00 am-8:30am',
                                    timetextdetail: 'Musicsss',
                                    color: AppColors.pureBlack,
                                    colortext: AppColors.textColor,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
