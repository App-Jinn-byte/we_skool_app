import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/forgot_password/forgot_password_components.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';
import 'package:we_skool_app/screens/forgot_password/change_password.dart';
import '../../res/colors.dart';
import '../../res/strings.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController? emailController;
  final bool _enable = true;
  final bool _cursorEnable = true;
  final ForgotPasswordComponents _forgotPasswordComponents = ForgotPasswordComponents();

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
                    CommonWidgets.customBackButton(onPress: () {
                      Navigator.pop(context);
                    }),
                    SizedBox(height: getHeight() * 0.06),
                    _forgotPasswordComponents.otpContainer(
                        userEmail: "charlie-foodly.com",
                        otpTextEditingController: emailController!,
                        enable: _enable,
                        cursorEnable: _cursorEnable,
                        onPressVerify: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const ChangePassword()));
                        },
                        onPressSendAgain: () {

                        }),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
