import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/forgot_password/forgot_password.dart';
import 'package:we_skool_app/screens/registration/register_as.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';
import '../../res/colors.dart';
import '../../res/strings.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  late bool hiddenPassword;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    hiddenPassword = true;
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
                    CommonWidgets.customBackButton(onPress: () {}),
                    SizedBox(height: getHeight() * 0.1),
                    TextView.size24Text("Sign In", Assets.raleWayBold,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackTextColor, lines: 1),
                    SizedBox(height: getHeight() * 0.06),
                    CommonWidgets.textField(
                      textEditingController: emailController,
                      hint: "Enter Your Email",
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: getHeight() * 0.04),
                    CommonWidgets.textFieldPassword(
                        textEditingController: passwordController,
                        hint: "Password",
                        hidePassword: hiddenPassword,
                        clickIcon: clickIcon),
                    SizedBox(height: getHeight() * 0.03),
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const ForgotPassword()));
                          },
                          child: TextView.size14Text("Forgot Password?",
                              color: AppColors.blackTextColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: Assets.raleWayMedium),
                        )),
                    SizedBox(height: getHeight() * 0.05),
                    CommonWidgets.getButton(
                        onPress: () {},
                        btnColor: AppColors.pinkColor,
                        text: "LOGIN",
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.pureWhiteColor,
                        fontFamily: Assets.raleWayMedium),
                    SizedBox(height: getHeight() * 0.22),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const RegisterAs()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextView.size14Text("Don't have an account? ",
                              color: AppColors.blackTextColor,
                              fontFamily: Assets.raleWayMedium),
                          TextView.size14Text("Register Now",
                              color: AppColors.pinkColor,
                              fontFamily: Assets.raleWayBold)
                        ],
                      ),
                    )
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
}
