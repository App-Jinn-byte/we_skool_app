import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/registration/parent_gaurdian.dart';
import 'package:we_skool_app/screens/registration/registration_components.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';
import '../../res/colors.dart';


class SelectProgram extends StatefulWidget {
  const SelectProgram({Key? key}) : super(key: key);

  @override
  _SelectProgramState createState() => _SelectProgramState();
}

class _SelectProgramState extends State<SelectProgram> {
  final RegistrationComponents _registrationComponents = RegistrationComponents();
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  DateTime? startDate;
  List <String> genderList = ['Male','Female'];
  String? _genderSelection;

  void updateTypeGender(String value){
    setState(() {
      _genderSelection = value;
    });
  }

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: sizes!.height,
            width: sizes!.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.backGroundImage), fit: BoxFit.fill),
            ),
            child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: getHeight() * 0.04),
                          CommonWidgets.customBackButton(onPress: () {
                            Navigator.pop(context);
                          }),
                          SizedBox(height: getHeight() * 0.01),
                          _registrationComponents.percentageBar(
                              box1Color: AppColors.yellowColor,
                              box2Color: AppColors.yellowColor,
                              box3Color:AppColors.yellowColor,
                              text1Color: AppColors.pureWhiteColor,
                              text2Color: AppColors.pureWhiteColor,
                              text3Color: AppColors.pureWhiteColor,
                              bar1Color: AppColors.yellowColor,
                              bar2Color: AppColors.yellowColor
                          ),
                          SizedBox(height: getHeight() * 0.02),
                          TextView.size26Text("Select Program",
                              color: AppColors.blackTextColor,
                              fontFamily: Assets.raleWayBold,
                              fontWeight: FontWeight.w700),
                          SizedBox(height: getHeight() * 0.04),
                          CommonWidgets.dropDown(
                              selectedCategory: _genderSelection,
                              updateSelectedCategory: updateTypeGender,
                              categories: genderList,
                              hint: "Select"),

                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: getHeight() * 0.02,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                      child: CommonWidgets.getButton(
                          onPress: () {
                          },
                          width: getWidth()* 0.9,
                          btnColor: AppColors.pinkColor,
                          text: "Sign Up",
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.pureWhiteColor,
                          fontFamily: Assets.raleWaySemiBold),
                    ),)
                ]
            )),
      ),
    );
  }
}
