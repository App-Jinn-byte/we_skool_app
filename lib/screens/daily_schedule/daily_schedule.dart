import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/daily_schedule/daily_schedule_components.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/screens/daily_schedule/daily_schedule_provider.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class DailySchedule extends StatefulWidget {
  const DailySchedule({Key? key}) : super(key: key);

  @override
  _DailyScheduleState createState() => _DailyScheduleState();
}

class _DailyScheduleState extends State<DailySchedule> {
  final DailyScheduleComponents _dailyScheduleComponents =
      DailyScheduleComponents();
  DailyScheduleProvider _dailyScheduleProvider = DailyScheduleProvider();
  DateTime? todayDate;

  @override
  void initState() {
    super.initState();
    _dailyScheduleProvider = Provider.of<DailyScheduleProvider>(context, listen: false);
    _dailyScheduleProvider.init(context: context);
    todayDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DailyScheduleProvider>(context, listen: true);
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
                      TextView.size20Text(
                          DateTimeFormat.format(
                              DateTime.parse(todayDate.toString()),
                              format: 'j, M, Y'),
                          color: AppColors.pureBlack,
                          fontFamily: Assets.raleWaySemiBold,
                          fontWeight: FontWeight.w600),
                      Divider(
                          height: getHeight() * 0.05,
                          thickness: getHeight() * 0.0005,
                          color: AppColors.blackColor),
                      _dailyScheduleProvider.isDataFetch
                          ? _dailyScheduleProvider.dailyScheduleResponse.data!
                                  .dailySchedule!.isNotEmpty
                              ? Expanded(
                                  child: ScrollConfiguration(
                                    behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
                                    child: ListView.builder(
                                        itemCount: _dailyScheduleProvider
                                            .dailyScheduleResponse
                                            .data!
                                            .dailySchedule!
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              _dailyScheduleComponents
                                                  .getScheduleBar(
                                                      time:
                                                          "${DateTimeFormat.format(DateTime.parse(_dailyScheduleProvider.dailyScheduleResponse.data!.dailySchedule![index].startTime!), format: 'h:i A')} - "
                                                          "${DateTimeFormat.format(DateTime.parse(_dailyScheduleProvider.dailyScheduleResponse.data!.dailySchedule![index].endTime!), format: 'h:i A')}",
                                                      text: _dailyScheduleProvider
                                                          .dailyScheduleResponse
                                                          .data!
                                                          .dailySchedule![index]
                                                          .title!),
                                              SizedBox(height: getHeight() * 0.02)
                                            ],
                                          );
                                        }),
                                  ),
                                )
                              : CommonWidgets.noDataAvailable()
                          : CommonWidgets.loading(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
