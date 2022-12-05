
import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/registration/registration_components.dart';
import 'package:we_skool_app/screens/registration/select_program.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';
import '../../res/colors.dart';


class ParentGuardian extends StatefulWidget {
  const ParentGuardian({Key? key}) : super(key: key);

  @override
  _ParentGuardianState createState() => _ParentGuardianState();
}

class _ParentGuardianState extends State<ParentGuardian> {
  final RegistrationComponents _registrationComponents = RegistrationComponents();
  TextEditingController? fullNameController;
  TextEditingController? relationshipController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? countryController;
  TextEditingController? stateController;
  bool onCheck = false;
  TextEditingController? fullName2Controller;
  TextEditingController? relationship2Controller;
  TextEditingController? email2Controller;
  TextEditingController? phone2Controller;
  TextEditingController? country2Controller;
  TextEditingController? state2Controller;


  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    relationshipController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    countryController = TextEditingController();
    stateController = TextEditingController();
    fullName2Controller = TextEditingController();
    relationship2Controller = TextEditingController();
    email2Controller = TextEditingController();
    phone2Controller = TextEditingController();
    country2Controller = TextEditingController();
    state2Controller = TextEditingController();
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
                              box3Color:AppColors.veryLightBLue,
                              text1Color: AppColors.pureWhiteColor,
                              text2Color: AppColors.pureWhiteColor,
                              text3Color: AppColors.greyColor,
                              bar1Color: AppColors.yellowColor,
                              bar2Color: AppColors.veryLightBLue
                          ),
                          SizedBox(height: getHeight() * 0.01),
                          TextView.size26Text("Parent Guardian # 1",
                              color: AppColors.blackTextColor,
                              fontFamily: Assets.raleWayBold,
                              fontWeight: FontWeight.w700),
                          SizedBox(height: getHeight() * 0.02),
                          CommonWidgets.textField(
                            textEditingController: fullNameController,
                            hint: "Full Name",
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: getHeight() * 0.02),
                          CommonWidgets.textField(
                            textEditingController: relationshipController,
                            hint: "Relationship",
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: getHeight() * 0.02),
                          CommonWidgets.textField(
                            textEditingController: emailController,
                            hint: "Enter Your Email",
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: getHeight() * 0.02),
                          CommonWidgets.textField(
                            textEditingController: phoneController,
                            hint: "Phone",
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: getHeight() * 0.02),
                          CommonWidgets.textField(
                            textEditingController: countryController,
                            hint: "Country",
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: getHeight() * 0.02),
                          CommonWidgets.textField(
                            textEditingController: stateController,
                            hint: "Add State",
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: getHeight() * 0.01),
                          Row(
                            children: [
                              SizedBox(
                                height: getHeight() * 0.02,
                                width: getWidth() * 0.02,
                                child: Checkbox(
                                  shape: const CircleBorder(),
                                  checkColor: Colors.white,
                                  activeColor: AppColors.yellowColor,
                                  value: onCheck,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      onCheck = value!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: getWidth() * 0.02),
                              TextView.size14Text("Is Parent/Guardian #1's address same as child's?",
                                  lines: 2, color: AppColors.greyTextColor, fontFamily: Assets.raleWayLight, fontWeight: FontWeight.w300),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              openSheet(getHeight() * 0.7);
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                  Icons.keyboard_arrow_down_sharp, size: getHeight() * 0.04, color: AppColors.pinkColor),
                            ),
                          ),
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
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const SelectProgram()));
                          },
                          width: getWidth()* 0.9,
                          btnColor: AppColors.pinkColor,
                          text: "Next",
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.pureWhiteColor,
                          fontFamily: Assets.raleWaySemiBold),
                    ),)
                ]
            )),
      ),
    );
  }

  void openSheet(double height) {

    // setState(() {
    //   BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10));
    // });

    showModalBottomSheet(
      //barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Container(
            //margin: EdgeInsets.only(top: sizes!.heightRatio * 58.74),
            padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
            height: sizes!.height * 0.85,
            decoration:  const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.backGroundImage), fit: BoxFit.fill),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(getHeight() * 0.02),
              //   topRight: Radius.circular(getHeight() * 0.02),
              // ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizes!.heightRatio * 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: getHeight() * 0.019,
                          width: getWidth() * 0.035,
                          padding: EdgeInsets.only(top: getHeight() * 0.06),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Assets.crossIcon),
                                fit: BoxFit.fill
                            ),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: sizes!.heightRatio * 10,
                ),
                TextView.size26Text("Parent Guardian # 2",
                    color: AppColors.blackTextColor,
                    fontFamily: Assets.raleWayBold,
                    fontWeight: FontWeight.w700),
                SizedBox(height: getHeight() * 0.03),
                CommonWidgets.textField(
                  textEditingController: fullName2Controller,
                  hint: "Full Name",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: getHeight() * 0.02),
                CommonWidgets.textField(
                  textEditingController: relationship2Controller,
                  hint: "Relationship",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: getHeight() * 0.02),
                CommonWidgets.textField(
                  textEditingController: email2Controller,
                  hint: "Enter Your Email",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: getHeight() * 0.02),
                CommonWidgets.textField(
                  textEditingController: phone2Controller,
                  hint: "Phone",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: getHeight() * 0.02),
                CommonWidgets.textField(
                  textEditingController: country2Controller,
                  hint: "Country",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: getHeight() * 0.02),
                CommonWidgets.textField(
                  textEditingController: state2Controller,
                  hint: "Add State",
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: getHeight() * 0.09),
                CommonWidgets.getButton(
                    onPress: () {

                    },
                    btnColor: AppColors.pinkColor,
                    text: "Next",
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.pureWhiteColor,
                    fontFamily: Assets.raleWaySemiBold),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
