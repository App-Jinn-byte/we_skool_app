import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';

import '../../widgets/text_views.dart';



class AssessmentReport extends StatefulWidget {
  const AssessmentReport({Key? key}) : super(key: key);

  @override
  _AssessmentReportState createState() => _AssessmentReportState();
}

class _AssessmentReportState extends State<AssessmentReport> {
  int _currentIndex=0;
  List<String> list = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor inci didunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc kjfss bslngskngs gslgnsngkngngkngk",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor inci didunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc .",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor inci didunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exerc ."];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonWidgets.appBarIconImageText(
                      text: "Assessment Report",
                      image: "",
                      onPressMenu: () {
                        Navigator.pop(context);
                      },
                      isDataFetched: false),
                  Container(
                    height: sizes!.height * 0.85,
                    margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.lightBackground), fit: BoxFit.fill
                        )),
                    child: Column(
                      children: [
                        SizedBox(height: getHeight() * 0.06),
                        // CommonWidgets.searchField(textEditingController: ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: sizes!.height * 0.5,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                          items: list.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  // height: getHeight() * 0.1,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
                                  decoration: const BoxDecoration(
                                    // color: Colors.white,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextView.size20Text("Approaches to Learning", color: AppColors.blackLight, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600, lines: 1),
                                      SizedBox(height: getHeight() * 0.02),
                                      Container(
                                        height: getHeight() * 0.42,
                                          width: getWidth(),
                                          padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04, vertical: getHeight() * 0.02),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: AppColors.pureWhiteColor,
                                            border: Border.all(color: AppColors.borderColor, width: getWidth() * 0.00005),
                                            borderRadius: BorderRadius.circular(
                                              getWidth() * .025,
                                            ),
                                            boxShadow:  const [
                                              BoxShadow(
                                                  color: AppColors.borderColor,
                                                  blurRadius: 2,
                                                  offset: Offset(0,0)
                                              )
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                // i.toString(),
                                                "Describe the child's personality, interests, learning schema, etc",
                                                // textAlign: TextAlign.justify,
                                                softWrap: true,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: sizes!.fontSize16,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: Assets.raleWaySemiBold,
                                                  height: 1.4,
                                                  color: AppColors.darkGreyColor,
                                                ),
                                              ),
                                              SizedBox(height: getHeight() * 0.03),
                                              Container(
                                                height: getHeight() * 0.28,
                                                width: getWidth(),
                                                padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.04, vertical: getHeight() * 0.02),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color: AppColors.greyFieldColor,
                                                  border: Border.all(color: AppColors.greyFieldBorderColor, width: getWidth() * 0.00005),
                                                  borderRadius: BorderRadius.circular(
                                                    getWidth() * .02,
                                                  ),
                                                  boxShadow:  const [
                                                    BoxShadow(
                                                        color: AppColors.borderColor,
                                                        blurRadius: 2,
                                                        offset: Offset(0,0)
                                                    )
                                                  ],
                                                ),
                                                child: Text(
                                                  i.toString(),
                                                  // textAlign: TextAlign.justify,
                                                  softWrap: true,
                                                  maxLines: 8,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: sizes!.fontSize14,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: Assets.raleWayMedium,
                                                    height: 1.5,
                                                    color: AppColors.grey2colrtext,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        // SizedBox(height: getHeight() * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: map<Widget>(list, (index, url) {
                            return Container(
                              width: getWidth() * 0.03,
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
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
