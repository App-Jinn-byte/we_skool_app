import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/development_checklist/development_checklist_components.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';

import '../../res/colors.dart';
import '../../widgets/text_views.dart';

class DevelopmentChecklist extends StatefulWidget {
   const DevelopmentChecklist({super.key});

  @override
  State<DevelopmentChecklist> createState() => _DevelopmentChecklistState();
}

class _DevelopmentChecklistState extends State<DevelopmentChecklist> {
   final DevelopmentCheckComponents _developmentCheckComponents = DevelopmentCheckComponents();
   DateTime? observationDate;
   int _currentIndex=0;
   List<String> list = ["Creates and follow through with multi step plans",
     "Identifies and experiments with different strategies to solve an academic and social challenge",
     "Able to return to an activity after feeling frustrated or disappointed",
     "Sticks with a project until it is complete"
   ];

   List<T> map<T>(List list, Function handler) {
     List<T> result = [];
     for (var i = 0; i < list.length; i++) {
       result.add(handler(i, list[i]));
     }
     return result;
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
            child: Column(children: [
              CommonWidgets.appBarIconImageText(
                  text: "Development Check",
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
                    SizedBox(
                      height: getHeight() * 0.04,
                    ),
                    CommonWidgets.searchField(),
                    SizedBox(
                      height: getHeight() * 0.02,
                    ),
                    _developmentCheckComponents.getDateField(
                        date: observationDate != null
                            ? "${observationDate!.day}/${observationDate!.month}/${observationDate!.year}"
                            : "Select Date",
                        onPressDate: () {
                          _selectObservationDate(context);
                        }),
                    SizedBox(
                      height: getHeight() * 0.03,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: sizes!.height * 0.48,
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
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                shape: BoxShape.rectangle,
                              ),
                              child: _developmentCheckComponents.getQuizContainer(
                                  headingText: "Approaches to Learning",
                                  question: "(How children learn; Initiative, curiosity, persistence, problem-solving, and attentiveness)",
                                  isSelected: false,
                                  pointsList: list
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    // SizedBox(height: getHeight() * 0.02),
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
                    SizedBox(height: getHeight() * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonWidgets.getButton(onPress: () {},
                            text: 'Cancel',
                            btnColor: AppColors.pureWhiteColor,
                            borderColor: AppColors.yellowColor,
                            textColor: AppColors.yellowColor,
                            fontFamily: Assets.raleWaySemiBold,
                            fontWeight: FontWeight.w600,
                            fontSize: sizes!.fontSize14,
                            width: getWidth() * 0.41,
                            height: getHeight()*0.06),
                        CommonWidgets.getButton(onPress: () {},
                            text: 'Submit',
                            width: getWidth() * 0.41,
                            height: getHeight()*0.06,
                          fontFamily: Assets.raleWaySemiBold,
                          fontWeight: FontWeight.w600,
                          fontSize: sizes!.fontSize14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
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
}
