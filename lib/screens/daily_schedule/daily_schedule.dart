import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/daily_schedule/daily_schedule_components.dart';

import '../../res/colors.dart';
import '../../widgets/common_widgets.dart';
import '../../widgets/text_views.dart';

class DailySchedule extends StatefulWidget {
  const DailySchedule({Key? key}) : super(key: key);

  @override
  _DailyScheduleState createState() => _DailyScheduleState();
}

class _DailyScheduleState extends State<DailySchedule> {
  DailyScheduleComponents _dailyScheduleComponents = DailyScheduleComponents();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: sizes!.height,
          width: sizes!.width,
          color: AppColors.pureWhiteColor,
          child: Column(
            children: [
              CommonWidgets.appBarIconImageText(
                  text: "Daily Schedule",
                  image: "",
                  isDataFetched: false,
                  onPressMenu: () {
                    Navigator.pop(context);
                  }),
              Container(
                  height: sizes!.height * 0.85,
                  margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.lightBackground),
                        fit: BoxFit.fill),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: getHeight() * 0.02),
                      TextView.size20Text("1st February 2022",
                          color: AppColors.pureBlack,
                          fontFamily: Assets.raleWaySemiBold,
                          fontWeight: FontWeight.w600),
                      Divider(
                          height: getHeight() * 0.05,
                          thickness: getHeight() * 0.0005,
                          color: AppColors.blackColor),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 15,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  _dailyScheduleComponents.getScheduleBar(
                                      time: "8:30 am - 8:40 am",
                                      text: "Tummy Time: Caregiver"),
                                  SizedBox(height: getHeight() * 0.02)
                                ],
                              );
                            }),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
