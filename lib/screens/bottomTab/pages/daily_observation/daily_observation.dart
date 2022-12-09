import 'package:buttons_tabbar/buttons_tabbar.dart';
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
  // TabController? _tabController;
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
                          ButtonsTabBar(
                           
                            contentPadding: EdgeInsets.symmetric(horizontal: getWidth()*0.09),

                            unselectedBorderColor: AppColors.greyColor,
                            borderWidth: 1,
                            height: getHeight() * 0.045,
                            labelStyle:
                            const TextStyle(color: AppColors.pureWhiteColor, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600),
                            unselectedLabelStyle:
                            const TextStyle(color: AppColors.greyColor, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600),
                            backgroundColor: AppColors.redColor,
                            unselectedBackgroundColor: AppColors.pureWhiteColor,
                            borderColor: AppColors.pinkColor,
                            buttonMargin:
                            EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
                            tabs: const [
                              Tab(
                                text: 'Observations',
                              ),
                              Tab(
                                text: '      Notes      ',
                              ),
                              
                            ],
                          ),
                          Expanded(child: TabBarView(

                            children: [
                              ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: getHeight() * 0.02),
                                        _dailyObservationComponents.getDateField(
                                            date: observationDate != null
                                                ? "${observationDate!.day}/${observationDate!.month}/${observationDate!.year}"
                                                : "DD/MM/YY",
                                            onPressDate: () {
                                              _selectObservationDate(context);
                                            }
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.only(left: getWidth()*0.023),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
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
                                          SizedBox(height: getHeight() * 0.09),

                                            ],
                                          ),
                                        ),
                                       
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: getHeight() * 0.02),
                                        _dailyObservationComponents.getDateField(
                                            date: notesDate != null
                                                ? "${notesDate!.day}/${notesDate!.month}/${notesDate!.year}"
                                                : "DD/MM/YY",
                                            onPressDate: () {
                                              _selectNotesDate(context);
                                            }
                                        ),
                                        Padding(
                                           padding:  EdgeInsets.only(left: getWidth()*0.023),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
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
                                          SizedBox(height: getHeight() * 0.09),

                                            ],
                                          ),
                                        ),
                                       
                                      ],
                                    ),
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

}
