import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/screens/bottomTab/pages/daily_observation/daily_observation_components.dart';
import 'package:we_skool_app/screens/bottomTab/pages/notification/notification_components.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';



class DailyObservation extends StatefulWidget {
  String? from;

  DailyObservation({super.key, @required this.from});

  @override
  _DailyObservationState createState() => _DailyObservationState();
}

class _DailyObservationState extends State<DailyObservation> with SingleTickerProviderStateMixin {
  final DailyObservationComponents _dailyObservationComponents = DailyObservationComponents();
  TextEditingController? activityName;
  TextEditingController? materialPresentedController;
  TextEditingController? childQuoteController;
  TextEditingController? additionalNotesController;
  TabController? _tabController;
  TextEditingController? sleepSessionsController;
  TextEditingController? snacksController;
  TextEditingController? diaperingController;
  TextEditingController? medicationController;
  DateTime? observationDate;
  DateTime? notesDate;

  @override
  void initState() {
    super.initState();
    activityName = TextEditingController();
    materialPresentedController = TextEditingController();
    childQuoteController = TextEditingController();
    additionalNotesController = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
    sleepSessionsController = TextEditingController();
    snacksController = TextEditingController();
    diaperingController = TextEditingController();
    medicationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: sizes!.height,
            width: sizes!.width,
            color: AppColors.pureWhiteColor,
            // padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.from == "home" ?
                  CommonWidgets.appBarIconImageText(
                      text: "Daily Observation",
                      image: "",
                      onPressMenu: () {
                        Navigator.pop(context);
                      },
                      isDataFetched: false):
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                    child: CommonWidgets.appBarTextImage(
                        text: "Daily Observation",
                        image: "",
                        isDataFetched: false),
                  ),
                  Container(
                    height: sizes!.height * 0.8,
                    padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.lightBackground), fit: BoxFit.fill
                        )),
                    child: Column(
                      children: [
                        SizedBox(height: getHeight() * 0.02),
                        TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            // border: Border.all(color: AppColors.grey2colrtext, width: getWidth() * 0.008),
                            color: AppColors.pinkColor,
                          ),
                          indicatorColor: AppColors.pinkColor,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorPadding:
                          EdgeInsets.symmetric(vertical: sizes!.heightRatio * 5),
                          labelColor: AppColors.pureWhiteColor,
                          labelStyle: TextStyle(
                              fontSize: sizes!.fontRatio * 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: Assets.raleWaySemiBold),
                          unselectedLabelColor: AppColors.grey2colrtext,
                          labelPadding: EdgeInsets.all(sizes!.smallPadding),
                          tabs: [
                            _dailyObservationComponents.getTab(text: "Observations"),
                            _dailyObservationComponents.getTab(text: "Notes"),
                          ],
                        ),
                        Expanded(child: TabBarView(
                          controller: _tabController,
                          children: [
                            ListView(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: getHeight() * 0.02),
                                    _dailyObservationComponents.getDateField(
                                        date: observationDate != null
                                            ? "${observationDate!.day}/${observationDate!.month}/${observationDate!.year}"
                                            : "Select Date",
                                        onPressDate: () {
                                          _selectObservationDate(context);
                                        }
                                    ),
                                    SizedBox(height: getHeight() * 0.02),
                                    TextView.size14Text("Name of activity",
                                        color: AppColors.blackLight, fontWeight: FontWeight.w600,fontFamily: Assets.raleWaySemiBold),
                                    SizedBox(height: getHeight() * 0.02),
                                    _dailyObservationComponents.textField(textEditingController: activityName),
                                    SizedBox(height: getHeight() * 0.02),
                                    TextView.size14Text("Materials presented by",
                                        color: AppColors.blackLight, fontWeight: FontWeight.w600,fontFamily: Assets.raleWaySemiBold),
                                    SizedBox(height: getHeight() * 0.02),
                                    _dailyObservationComponents.textField(textEditingController: materialPresentedController),
                                    SizedBox(height: getHeight() * 0.02),
                                    TextView.size14Text("Child's quotes & questions (if applicable)",
                                        color: AppColors.blackLight, fontWeight: FontWeight.w600,fontFamily: Assets.raleWaySemiBold),
                                    SizedBox(height: getHeight() * 0.02),
                                    _dailyObservationComponents.textField(textEditingController: childQuoteController),
                                    SizedBox(height: getHeight() * 0.02),
                                    TextView.size14Text("Additional notes",
                                        color: AppColors.blackLight, fontWeight: FontWeight.w600,fontFamily: Assets.raleWaySemiBold),
                                    SizedBox(height: getHeight() * 0.02),
                                    _dailyObservationComponents.textField(textEditingController: additionalNotesController),
                                    SizedBox(height: getHeight() * 0.02),
                                    _dailyObservationComponents.buttonRow(
                                        onPressCancel: () {},
                                        onPressSave: () {},
                                        onPressSubmit: () {}
                                    ),
                                    SizedBox(height: getHeight() * 0.04),
                                  ],
                                ),
                              ],
                            ),
                            ListView(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: getHeight() * 0.02),
                                    _dailyObservationComponents.getDateField(
                                        date: notesDate != null
                                            ? "${notesDate!.day}/${notesDate!.month}/${notesDate!.year}"
                                            : "Select Date",
                                        onPressDate: () {
                                          _selectNotesDate(context);
                                        }
                                    ),
                                    SizedBox(height: getHeight() * 0.02),
                                    TextView.size14Text("Sleep Sessions",
                                        color: AppColors.blackLight, fontWeight: FontWeight.w600,fontFamily: Assets.raleWaySemiBold),
                                    SizedBox(height: getHeight() * 0.02),
                                    _dailyObservationComponents.textField(textEditingController: sleepSessionsController),
                                    SizedBox(height: getHeight() * 0.02),
                                    TextView.size14Text("Meals/Snacks",
                                        color: AppColors.blackLight, fontWeight: FontWeight.w600,fontFamily: Assets.raleWaySemiBold),
                                    SizedBox(height: getHeight() * 0.02),
                                    _dailyObservationComponents.textField(textEditingController: snacksController),
                                    SizedBox(height: getHeight() * 0.02),
                                    TextView.size14Text("Diapering/Toileting",
                                        color: AppColors.blackLight, fontWeight: FontWeight.w600,fontFamily: Assets.raleWaySemiBold),
                                    SizedBox(height: getHeight() * 0.02),
                                    _dailyObservationComponents.textField(textEditingController: diaperingController),
                                    SizedBox(height: getHeight() * 0.02),
                                    TextView.size14Text("Medications",
                                        color: AppColors.blackLight, fontWeight: FontWeight.w600,fontFamily: Assets.raleWaySemiBold),
                                    SizedBox(height: getHeight() * 0.02),
                                    _dailyObservationComponents.textField(textEditingController: medicationController),
                                    SizedBox(height: getHeight() * 0.02),
                                    _dailyObservationComponents.buttonRow(
                                        onPressCancel: () {},
                                        onPressSave: () {},
                                        onPressSubmit: () {}
                                    ),
                                    SizedBox(height: getHeight() * 0.04),
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

}
