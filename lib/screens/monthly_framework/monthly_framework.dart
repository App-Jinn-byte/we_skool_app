import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/daily_schedule/daily_schedule_components.dart';
import 'package:we_skool_app/screens/monthly_framework/monthly_framework_components.dart';
import 'package:we_skool_app/screens/monthly_framework/monthly_framework_provider.dart';

import '../../res/colors.dart';
import '../../res/strings.dart';
import '../../widgets/common_widgets.dart';
import '../../widgets/text_views.dart';

class MonthlyFramework extends StatefulWidget {
  const MonthlyFramework({Key? key}) : super(key: key);

  @override
  _MonthlyFrameworkState createState() => _MonthlyFrameworkState();
}

class _MonthlyFrameworkState extends State<MonthlyFramework> {
  final MonthlyFrameworkComponents _monthlyFrameworkComponents = MonthlyFrameworkComponents();
  MonthlyFrameworkProvider _monthlyFrameworkProvider = MonthlyFrameworkProvider();
  int _currentIndex=0;
  List<String> list = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor inci didunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc kjfss bslngskngs gslgnsngkngngkngk",
    Strings.monthlyDummyTest, Strings.monthlyDummyTest, Strings.monthlyDummyTest, Strings.monthlyDummyTest
  ];
  bool isOpened = false;

  @override
  void initState() {
    super.initState();
    _monthlyFrameworkProvider = Provider.of<MonthlyFrameworkProvider>(context, listen: false);
    _monthlyFrameworkProvider.init(context: context);
    isOpened = false;
  }
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<MonthlyFrameworkProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: sizes!.height,
          width: sizes!.width,
          color: AppColors.pureWhiteColor,
          child: Column(
            children: [
              CommonWidgets.appBarIconImageText(
                  text: "Monthly Framework",
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
                  child:
                      _monthlyFrameworkProvider.isDataFetch ?
                          _monthlyFrameworkProvider.monthlyFrameworkResponse.data!.monthlyFramework!.isNotEmpty ?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: getHeight() * 0.02),
                      Expanded(
                        child: ScrollConfiguration(
                          behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
                          child: ListView.builder(
                              itemCount: _monthlyFrameworkProvider.monthlyFrameworkResponse.data!.monthlyFramework![0].monthlyFrameworkDetails!.length + 1,
                              itemBuilder: (context, index) {
                                if  (index == 0) {
                                  return Column(
                                    children: [
                                      CarouselSlider(
                                        options: CarouselOptions(
                                          // height: isOpened == true ? sizes!.height * 0.35: sizes!.height * 0.26,
                                          height: sizes!.height * 0.26,
                                          viewportFraction: 1,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              _currentIndex = index;
                                            });
                                          },
                                        ),
                                        items: _monthlyFrameworkProvider.introModelList.data!.map((i) {
                                          return Builder(
                                            builder: (BuildContext context) {
                                              return Container(
                                                width: MediaQuery.of(context).size.width,
                                                margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
                                                decoration: const BoxDecoration(
                                                  // color: Colors.white,
                                                  shape: BoxShape.rectangle,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    TextView.size20Text(i.heading, color: AppColors.blackLight, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600, lines: 1),
                                                    SizedBox(height: getHeight() * 0.02),
                                                    Container(
                                                      height: getHeight() * 0.2,
                                                        width: getWidth(),
                                                        padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04, vertical: getHeight() * 0.02),
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.rectangle,
                                                          color: AppColors.pureWhiteColor,
                                                          // border: Border.all(color: AppColors.blackLight, width: getWidth() * 0.00005),
                                                          borderRadius: BorderRadius.circular(
                                                            getWidth() * .035,
                                                          ),
                                                          boxShadow:  const [
                                                            BoxShadow(
                                                                color: AppColors.borderColor,
                                                                blurRadius: 1,
                                                                offset: Offset(0,0)
                                                            )
                                                          ],
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              i.description!,
                                                              textAlign: TextAlign.justify,
                                                              softWrap: true,
                                                              // maxLines: isOpened == true ? 10 : 4,
                                                              maxLines: 4,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                fontSize: sizes!.fontSize14,
                                                                fontWeight: FontWeight.w600,
                                                                fontFamily: Assets.raleWaySemiBold,
                                                                height: 1.4,
                                                                color: AppColors.darkGreyColor,
                                                              ),
                                                            ),
                                                            // _monthlyFrameworkComponents.seeMoreIcon(
                                                            //     onPressSeeMore: () {
                                                            //       setState(() {
                                                            //         isOpened = !isOpened;
                                                            //       });
                                                            //     },
                                                            //     isOpen: isOpened
                                                            // )
                                                          ],
                                                        )),
                                                  ],
                                                ),

                                                // child: Image.network(
                                                //   "$baseUrl${i.filePath}",
                                                //   fit: BoxFit.fill,
                                                // )
                                              );
                                            },
                                          );
                                        }).toList(),
                                      ),
                                      SizedBox(height: getHeight() * 0.01),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: map<Widget>(list, (index, url) {
                                          return Container(
                                            width: getWidth() * 0.02,
                                            height: getHeight() * 0.02,
                                            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: _currentIndex == index ? AppColors.pinkColor : AppColors.pureWhiteColor,
                                                border: Border.all(color: AppColors.blackBorderColor, width: getWidth() * 0.002)
                                            ),
                                          );
                                        }),
                                      ),
                                    ],
                                  );
                                }
                                else {
                                  return Column(
                                    children: [
                                      SizedBox(height: getHeight() * 0.01),
                                      _monthlyFrameworkComponents.frameWorkTiles(
                                          text: _monthlyFrameworkProvider.monthlyFrameworkResponse.data!.monthlyFramework![0].monthlyFrameworkDetails![index -1].description,
                                          image: "",
                                          isDataFetched: false,
                                          headingText: _monthlyFrameworkProvider.monthlyFrameworkResponse.data!.monthlyFramework![0].monthlyFrameworkDetails![index -1].title
                                      ),
                                      SizedBox(height: getHeight() * 0.02)
                                    ],
                                  );
                                }
                              }),
                        ),
                      )
                    ],
                  ) : CommonWidgets.noDataAvailable()
                          : CommonWidgets.loading()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
