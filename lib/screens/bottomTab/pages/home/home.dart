import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/screens/bottomTab/pages/home/home_components.dart';
import 'package:we_skool_app/screens/daily_schedule/daily_schedule.dart';
import 'package:we_skool_app/screens/monthly_framework/monthly_framework.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeComponents _homeComponents = HomeComponents();
  final GlobalKey<ScaffoldState>? _scaffoldKey = new GlobalKey<ScaffoldState>();

  int selectedPage = 0;

  @override
  void initState() {
    super.initState();
  }

  void updateSelectedPage(int newValue) {
    setState(() {
      selectedPage = newValue;
    });
  }
  void openDrawer(BuildContext context) {
    _scaffoldKey?.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Container(
          width: sizes!.width * 0.64,
          color: Colors.white,
          child: _homeComponents.buildDrawerMenu(
              context: context,
              selectedPage: selectedPage,
              onPress: updateSelectedPage),
        ),
        body: Container(
            height: sizes!.height,
            width: sizes!.width,
            color: AppColors.pureWhiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _homeComponents.appBar(
                  onPressMenu: () {
                    openDrawer(context);
                  },
                    text: "Home", image: "", isDataFetched: false),
                Container(
                    height: sizes!.height * 0.73,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.lightBackground),
                            fit: BoxFit.fill)),
                    margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                    child: Column(
                      children: [
                        SizedBox(height: getHeight() * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _homeComponents.homeCategoryContainer(
                                text: "Monthly Framework",
                                image: Assets.homeKeyboardIcon,
                                onPress: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) => const MonthlyFramework()));
                                }
                            ),
                            _homeComponents.homeCategoryContainer(
                                text: "Daily Observation",
                                image: Assets.homeCalendarIcon,
                                onPress: () {}
                            ),
                          ],
                        ),
                        SizedBox(height: getHeight() * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _homeComponents.homeCategoryContainer(
                                text: "Monthly Schedule",
                                image: Assets.homeSearchIcon,
                                onPress: () {}
                            ),
                            _homeComponents.homeCategoryContainer(
                                text: "Development Checklist",
                                image: Assets.homeDevelopmentIcon,
                                onPress: () {}
                            )
                          ],
                        ),
                        SizedBox(height: getHeight() * 0.02),
                        Divider(
                            height: getHeight() * 0.02, thickness: getHeight() * 0.001,
                            color: AppColors.dividerColor),
                        SizedBox(height: getHeight() * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView.size20Text("Daily Schedule",
                                color: AppColors.pureBlack,
                                fontFamily: Assets.raleWaySemiBold,
                                fontWeight: FontWeight.w600),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => const DailySchedule()));
                              },
                              child: TextView.size14Text("See all",
                                  color: AppColors.pinkColor,
                                  fontFamily: Assets.raleWaySemiBold,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(height: getHeight() * 0.03),
                        Container(
                          width: getWidth(),
                          height: getHeight() * 0.33,
                          padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04, vertical: getHeight() * 0.015),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: AppColors.pureWhiteColor,
                            border:
                            Border.all(color: AppColors.borderColor, width: getWidth() * 0.005),
                            borderRadius: BorderRadius.circular(
                              getWidth() * .04,
                            ),
                            boxShadow:  const [
                              BoxShadow(
                                  color: AppColors.borderColor,
                                  blurRadius: 10,
                                  offset: Offset(0,0)
                              )
                            ],
                          ),
                          child: ListView.separated(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    _homeComponents.scheduleContainer(
                                        time1: "8:30 am - 8:50 am",
                                        text1: "Tummy Time: Caregiver"
                                    ),
                                  ],
                                );
                              },
                            separatorBuilder: (BuildContext context, int index) {
                                return Divider(height: getHeight() * 0.03, thickness: getHeight() * 0.001, color: AppColors.dividerColor);
                            },
                          ),
                        ),
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
