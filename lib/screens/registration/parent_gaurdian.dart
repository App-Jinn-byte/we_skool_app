import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';
import '../../res/colors.dart';


class ParentGuardian extends StatefulWidget {
  const ParentGuardian({Key? key}) : super(key: key);

  @override
  _ParentGuardianState createState() => _ParentGuardianState();
}

class _ParentGuardianState extends State<ParentGuardian> {
  TextEditingController? fullNameController;
  TextEditingController? relationshipController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? countryController;
  TextEditingController? stateController;
  bool onCheck = false;


  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    relationshipController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    countryController = TextEditingController();
    stateController = TextEditingController();
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
                          SizedBox(height: getHeight() * 0.04),
                          TextView.size26Text("Parent Guardian # 1",
                              color: AppColors.blackTextColor,
                              fontFamily: Assets.raleWayBold,
                              fontWeight: FontWeight.w700),
                          SizedBox(height: getHeight() * 0.04),
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
                                height: getHeight() * 0.04,
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
                                  lines: 2, color: AppColors.greyTextColor, fontFamily: Assets.raleWayLight, fontWeight: FontWeight.w300)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: getHeight() * 0.03,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                      child: CommonWidgets.getButton(
                          onPress: () {},
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
}
