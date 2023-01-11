import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/screens/bottomTab/pages/calendar/calendar_components.dart';

import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
  }) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarComponents _calendarComponents = CalendarComponents();
  TextEditingController? searchController;
  DateTime? bookingDate;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    bookingDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: sizes!.height,
            width: sizes!.width,
            color: AppColors.pureWhiteColor,
            padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidgets.appBarTextImage(
                      text: "Calendar", image: "", isDataFetched: false),
                  Container(
                    height: sizes!.height * 0.8,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.lightBackground),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
                            child: ListView.builder(
                                itemCount: 15,
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: getHeight() * 0.03),
                                        CommonWidgets.searchField(
                                            textEditingController:
                                                searchController),
                                        SizedBox(height: getHeight() * 0.03),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  getWidth() * 0.02),
                                              border: Border.all(
                                                  color: AppColors.borderColor),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      Assets.calendarBg),
                                                  fit: BoxFit.fill)),
                                          child: TableCalendar(
                                              rowHeight: getHeight() * 0.05,
                                              firstDay: DateTime.now(),
                                              lastDay: DateTime.utc(2030, 3, 14),
                                              focusedDay:
                                                  bookingDate ?? DateTime.now(),
                                              selectedDayPredicate: (day) =>
                                                  isSameDay(day, bookingDate),
                                              onDaySelected:
                                                  (selectedDay, focusedDay) {
                                                setState(() {
                                                  bookingDate = selectedDay;
                                                });
                                              },
                                              calendarStyle: const CalendarStyle(
                                                weekendTextStyle: TextStyle(
                                                    color: AppColors.yellowColor),
                                                isTodayHighlighted: false,
                                                todayDecoration: BoxDecoration(
                                                  color: AppColors.pureWhiteColor,
                                                  shape: BoxShape.circle,
                                                ),
                                                selectedDecoration: BoxDecoration(
                                                  color: AppColors.pinkColor,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              headerStyle: HeaderStyle(
                                                titleCentered: true,
                                                formatButtonVisible: false,
                                                headerPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal:
                                                            sizes!.heightRatio *
                                                                10),
                                                titleTextStyle: TextStyle(
                                                    fontFamily:
                                                        Assets.raleWaySemiBold,
                                                    fontSize: sizes!.fontSize18,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.blackLight),
                                              ),
                                              daysOfWeekStyle:
                                                  const DaysOfWeekStyle(
                                                      weekendStyle: TextStyle(
                                                          color: AppColors
                                                              .yellowColor))),
                                        ),
                                        SizedBox(height: getHeight() * 0.03),
                                        Divider(
                                            height: getHeight() * 0.01,
                                            thickness: getHeight() * 0.001,
                                            color: AppColors.dividerColor),
                                        SizedBox(height: getHeight() * 0.03),
                                        TextView.size16Text("Activity Details",
                                            Assets.raleWaySemiBold,
                                            color: AppColors.blackLight,
                                            lines: 1,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(height: getHeight() * 0.02),
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      children: [
                                        _calendarComponents.getDateText(
                                            date: bookingDate.toString(),
                                            text: "Your text here"),
                                        SizedBox(height: getHeight() * 0.02)
                                      ],
                                    );
                                  }
                                }),
                          ),
                        ),
                        SizedBox(
                          height: getHeight() * 0.04,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
