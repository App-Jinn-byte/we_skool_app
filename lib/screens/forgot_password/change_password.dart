import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';
import '../../res/colors.dart';
import '../../res/strings.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController? newPasswordController;
  TextEditingController? confirmPasswordController;
  late bool hiddenPassword;
  late bool hiddenPasswordConfirm;

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    hiddenPassword = true;
    hiddenPasswordConfirm = true;
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getHeight() * 0.04),
                    CommonWidgets.customBackButton(onPress: () {
                      Navigator.pop(context);
                    }),
                    SizedBox(height: getHeight() * 0.08),
                    TextView.size32Text("Change Password",
                        fontFamily: Assets.raleWayBold,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackTextColor,
                        lines: 1),
                    SizedBox(height: getHeight() * 0.06),
                    TextView.size14Text("Create New Password",
                        color: AppColors.blackTextColor,
                        fontFamily: Assets.raleWayMedium,
                        fontWeight: FontWeight.w500,
                        lines: 1),
                    SizedBox(height: getHeight() * 0.01),
                    CommonWidgets.textFieldPassword(
                        textEditingController: newPasswordController,
                        hint: "Enter New Password",
                        hidePassword: hiddenPassword,
                        clickIcon: clickIcon),
                    SizedBox(height: getHeight() * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: getWidth() * 0.015,
                          height: getHeight() * 0.01,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.pinkColor,
                          ),
                        ),
                        SizedBox(width: getWidth() * 0.02),
                        TextView.size14Text("Strong Password",
                            color: AppColors.pinkColor,
                            fontFamily: Assets.raleWayRegular)
                      ],
                    ),
                    TextView.size14Text("Confirm Password",
                        color: AppColors.blackTextColor,
                        fontFamily: Assets.raleWayMedium,
                        fontWeight: FontWeight.w500,
                        lines: 1),
                    SizedBox(height: getHeight() * 0.01),
                    CommonWidgets.textFieldPassword(
                        textEditingController: confirmPasswordController,
                        hint: "Confirm Password",
                        hidePassword: hiddenPasswordConfirm,
                        clickIcon: clickIconConfirm),
                    SizedBox(height: getHeight() * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: getWidth() * 0.015,
                          height: getHeight() * 0.01,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.pinkColor,
                          ),
                        ),
                        SizedBox(width: getWidth() * 0.02),
                        TextView.size14Text("Password Match",
                            color: AppColors.pinkColor,
                            fontFamily: Assets.raleWayRegular)
                      ],
                    ),
                    SizedBox(height: getHeight() * 0.06),
                    CommonWidgets.getButton(
                        onPress: () {},
                        btnColor: AppColors.pinkColor,
                        fontWeight: FontWeight.w500,
                        text: "Confirm",
                        textColor: AppColors.pureWhiteColor,
                        fontFamily: Assets.raleWayMedium),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  void clickIcon() {
    setState(() {
      hiddenPassword = !hiddenPassword;
    });
  }
  void clickIconConfirm() {
    setState(() {
      hiddenPasswordConfirm = !hiddenPasswordConfirm;
    });
  }
}
