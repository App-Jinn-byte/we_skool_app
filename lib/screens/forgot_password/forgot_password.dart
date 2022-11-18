import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';
import 'package:we_skool_app/screens/forgot_password/change_password.dart';
import '../../res/colors.dart';
import '../../res/strings.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController? emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
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
                    CommonWidgets.customBackButton(
                        onPress: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(height: getHeight() * 0.12),
                    TextView.size32Text("Forgot Password",
                        fontFamily: Assets.raleWayBold,
                        color: AppColors.blackTextColor,
                        fontWeight: FontWeight.w500,
                        lines: 1),
                    SizedBox(height: getHeight() * 0.02),
                    TextView.size14Text(
                        "Select which contact details should we use to reset your password",
                        color: AppColors.greyTextColor,
                        fontFamily: Assets.raleWayRegular,
                        lines: 2),
                    SizedBox(height: getHeight() * 0.03),
                    CommonWidgets.textField(
                      textEditingController: emailController,
                      hint: "Enter Your Email",
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: getHeight() * 0.06),
                    CommonWidgets.getButton(
                        onPress: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const ChangePassword()));
                        },
                        btnColor: AppColors.pinkColor,
                        text: "Next",

                        fontWeight: FontWeight.w600,
                        textColor: AppColors.pureWhiteColor,
                        fontFamily: Assets.raleWaySemiBold),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
