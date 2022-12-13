import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/screens/bottomTab/pages/daily_observation/daily_observation_components.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class DailyObservation extends StatefulWidget {
  String? from;

  DailyObservation({super.key, @required this.from});

  @override
  _DailyObservationState createState() => _DailyObservationState();
}

class _DailyObservationState extends State<DailyObservation>
    with SingleTickerProviderStateMixin {
  final DailyObservationComponents _dailyObservationComponents =
      DailyObservationComponents();
  TextEditingController? activityName;
  TextEditingController? materialPresentedController;
  TextEditingController? childQuoteController;
  TextEditingController? additionalNotesController;
  // TabController? _tabController;
  TextEditingController? sleepSessionsController;
  TextEditingController? snacksController;
  TextEditingController? diaperingController;
  TextEditingController? medicationController;
  DateTime? observationDate;
  DateTime? notesDate;
  final TimeOfDay _timeOfDay = TimeOfDay.now();
  String? _selectedtime = '5:00 AM';
  String? _selectedtime2 = '5:00 AM';
  String? _selectedtime3 = '8:00 AM';
  String? _selectedtime4 = '8:00 AM';

  @override
  void initState() {
    super.initState();
    activityName = TextEditingController();
    materialPresentedController = TextEditingController();
    childQuoteController = TextEditingController();
    additionalNotesController = TextEditingController();
    // _tabController = TabController(length: 2, vsync: this);
    sleepSessionsController = TextEditingController();
    snacksController = TextEditingController();
    diaperingController = TextEditingController();
    medicationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Container(
              height: sizes!.height,
              width: sizes!.width,
              color: AppColors.pureWhiteColor,
              // padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.from == "home"
                        ? CommonWidgets.appBarIconImageText(
                            text: "Daily Observation",
                            image: "",
                            onPressMenu: () {
                              Navigator.pop(context);
                            },
                            isDataFetched: false)
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidth() * 0.05),
                            child: CommonWidgets.appBarTextImage(
                                text: "Daily Observation",
                                image: "",
                                isDataFetched: false),
                          ),
                    Container(
                      height: sizes!.height * 0.8,
                      padding:
                          EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.lightBackground),
                              fit: BoxFit.fill)),
                      child: Column(
                       // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: getHeight() * 0.02),
                          ButtonsTabBar(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: getWidth() * 0.090),
                            unselectedBorderColor: AppColors.greyColor,
                            borderWidth: 1,
                            height: getHeight() * 0.045,
                            labelStyle: const TextStyle(
                                color: AppColors.pureWhiteColor,
                                fontFamily: Assets.raleWaySemiBold,
                                fontWeight: FontWeight.w600),
                            unselectedLabelStyle: const TextStyle(
                                color: AppColors.greyColor,
                                fontFamily: Assets.raleWaySemiBold,
                                fontWeight: FontWeight.w600),
                            backgroundColor: AppColors.redColor,
                            unselectedBackgroundColor: AppColors.pureWhiteColor,
                            borderColor: AppColors.pinkColor,
                            buttonMargin: EdgeInsets.symmetric(
                                horizontal: getWidth() * 0.015),
                            tabs: const [
                              Tab(
                                text: 'Observations',
                              ),
                              Tab(
                                text: '      Notes      ',
                              ),
                            ],
                          ),
                          Expanded(
                              child: TabBarView(
                            children: [
                              ListView(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: getHeight() * 0.02),
                                      Padding(
                                        padding:  EdgeInsets.only(left: getWidth()*0.002),
                                        child: _dailyObservationComponents
                                            .getDateField(
                                                date: observationDate != null
                                                    ? "${observationDate!.day}/${observationDate!.month}/${observationDate!.year}"
                                                    : "DD/MM/YY",
                                                onPressDate: () {
                                                  _selectObservationDate(
                                                      context);
                                                }),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: getWidth() * 0.023),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            TextView.size14Text(
                                                "Name of activity",
                                                color: AppColors.blackLight,
                                                fontWeight: FontWeight.w600,
                                                fontFamily:
                                                    Assets.raleWaySemiBold),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            _dailyObservationComponents
                                                .textField(
                                                    textEditingController:
                                                        activityName),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            TextView.size14Text(
                                                "Materials presented by",
                                                color: AppColors.blackLight,
                                                fontWeight: FontWeight.w600,
                                                fontFamily:
                                                    Assets.raleWaySemiBold),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            _dailyObservationComponents.textField(
                                                textEditingController:
                                                    materialPresentedController),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            TextView.size14Text(
                                                "Child's quotes & questions (if applicable)",
                                                color: AppColors.blackLight,
                                                fontWeight: FontWeight.w600,
                                                fontFamily:
                                                    Assets.raleWaySemiBold),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            _dailyObservationComponents
                                                .textField(
                                                    textEditingController:
                                                        childQuoteController),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            TextView.size14Text(
                                                "Additional notes",
                                                color: AppColors.blackLight,
                                                fontWeight: FontWeight.w600,
                                                fontFamily:
                                                    Assets.raleWaySemiBold),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            _dailyObservationComponents.textField(
                                                textEditingController:
                                                    additionalNotesController),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            _dailyObservationComponents
                                                .buttonRow(
                                                    onPressCancel: () {},
                                                    onPressSave: () {},
                                                    onPressSubmit: () {}),
                                            SizedBox(
                                                height: getHeight() * 0.09),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              ListView(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: getHeight() * 0.02),
                                      Padding(
                                         padding:  EdgeInsets.only(left: getWidth()*0.002),
                                        child: _dailyObservationComponents
                                            .getDateField(
                                                date: notesDate != null
                                                    ? "${notesDate!.day}/${notesDate!.month}/${notesDate!.year}"
                                                    : "DD/MM/YY",
                                                onPressDate: () {
                                                  _selectNotesDate(context);
                                                }),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: getWidth() * 0.023),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextView.size14Text(
                                                    "Sleep Sessions",
                                                    color:
                                                        AppColors.blackLight,
                                                    fontWeight:
                                                        FontWeight.w600,
                                                    fontFamily: Assets
                                                        .raleWaySemiBold),
                                                _dailyObservationComponents
                                                    .timefield(
                                                        onPresstime: () {
                                                          selecttime();
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            TextView.size12Text(
                                                                _selectedtime,
                                                                color: AppColors
                                                                    .greyText,
                                                                fontFamily: Assets
                                                                    .raleWayMedium,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                                        Image.asset(Assets.timeicon,height: getHeight()*0.016,)
                                                          
                                                          ],
                                                        )),
                                              ],
                                            ),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            _dailyObservationComponents
                                                .textField(
                                                    textEditingController:
                                                        sleepSessionsController),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextView.size14Text(
                                                    "Meals/Snacks",
                                                    color:
                                                        AppColors.blackLight,
                                                    fontWeight:
                                                        FontWeight.w600,
                                                    fontFamily: Assets
                                                        .raleWaySemiBold),
                                                _dailyObservationComponents
                                                    .timefield(
                                                        onPresstime: () {
                                                          selecttime2();
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            TextView.size12Text(
                                                                _selectedtime2,
                                                                color: AppColors
                                                                    .greyText,
                                                                fontFamily: Assets
                                                                    .raleWayMedium,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                                         Image.asset(Assets.timeicon,height: getHeight()*0.016,)
                                                          ],
                                                        )),
                                              ],
                                            ),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            _dailyObservationComponents
                                                .textField(
                                                    textEditingController:
                                                        snacksController),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextView.size14Text(
                                                    "Diapering/Toileting",
                                                    color:
                                                        AppColors.blackLight,
                                                    fontWeight:
                                                        FontWeight.w600,
                                                    fontFamily: Assets
                                                        .raleWaySemiBold),
                                                _dailyObservationComponents
                                                    .timefield(
                                                        onPresstime: () {
                                                          selecttime3();
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            TextView.size12Text(
                                                                _selectedtime3,
                                                                color: AppColors
                                                                    .greyText,
                                                                fontFamily: Assets
                                                                    .raleWayMedium,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                                         Image.asset(Assets.timeicon,height: getHeight()*0.016,)
                                                          ],
                                                        )),
                                              ],
                                            ),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            _dailyObservationComponents
                                                .textField(
                                                    textEditingController:
                                                        diaperingController),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextView.size14Text(
                                                    "Medications",
                                                    color:
                                                        AppColors.blackLight,
                                                    fontWeight:
                                                        FontWeight.w600,
                                                    fontFamily: Assets
                                                        .raleWaySemiBold),
                                                _dailyObservationComponents
                                                    .timefield(
                                                        onPresstime: () {
                                                          selecttime4();
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            TextView.size12Text(
                                                                _selectedtime4,
                                                                color: AppColors
                                                                    .greyText,
                                                                fontFamily: Assets
                                                                    .raleWayMedium,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                                   Image.asset(Assets.timeicon,height: getHeight()*0.016,)
                                                          ],
                                                        )),
                                              ],
                                            ),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            _dailyObservationComponents
                                                .textField(
                                                    textEditingController:
                                                        medicationController),
                                            SizedBox(
                                                height: getHeight() * 0.02),
                                            _dailyObservationComponents
                                                .buttonRow(
                                                    onPressCancel: () {},
                                                    onPressSave: () {},
                                                    onPressSubmit: () {}),
                                            SizedBox(
                                                height: getHeight() * 0.09),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Future<void> _selectObservationDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(DateTime.now().year + 20),
      helpText: 'Select date',
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(primary: AppColors.pinkColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            highlightColor: Colors.grey[400],
          ), // This will change to light theme.
          child: child!,
        );
      },
    );
    if (picked != null && picked != observationDate) {
      setState(() {
        observationDate = picked;
      });
    }
  }

  Future<void> _selectNotesDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(DateTime.now().year + 20),
      helpText: 'Select date',
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(primary: AppColors.pinkColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            highlightColor: Colors.grey[400],
          ), // This will change to light theme.
          child: child!,
        );
      },
    );
    if (picked != null && picked != notesDate) {
      setState(() {
        notesDate = picked;
      });
    }
  }

  Future<void> selecttime() async {
   final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(primary: AppColors.pinkColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            highlightColor: Colors.grey[400],
          ), // This will change to light theme.
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
      //  _timeOfDay = _picked;
        _selectedtime = picked.format(context);
        
      });
    }
  }
  Future<void> selecttime2() async {
   final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(primary: AppColors.pinkColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            highlightColor: Colors.grey[400],
          ), // This will change to light theme.
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
      //  _timeOfDay = _picked;
        _selectedtime2 = picked.format(context);
        
      });
    }
  }
  Future<void> selecttime3() async {
   final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(primary: AppColors.pinkColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            highlightColor: Colors.grey[400],
          ), // This will change to light theme.
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
      //  _timeOfDay = _picked;
        _selectedtime3 = picked.format(context);
        
      });
    }
  }
   Future<void> selecttime4() async {
   final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(primary: AppColors.pinkColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            highlightColor: Colors.grey[400],
          ), // This will change to light theme.
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
      //  _timeOfDay = _picked;
        _selectedtime4 = picked.format(context);
        
      });
    }
  }
}
