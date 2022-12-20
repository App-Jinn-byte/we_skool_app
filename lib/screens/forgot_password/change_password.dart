import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/forgot_password/forgot_password_provider.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';
import '../../common/utils.dart';
import '../../res/colors.dart';
import '../../res/strings.dart';
import 'package:we_skool_app/screens/forgot_password/forgot_password_components.dart';

import '../../res/toasts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final ForgotPasswordComponents _forgotPasswordComponents = ForgotPasswordComponents();
  ForgotPasswordProvider _forgotPasswordProvider = ForgotPasswordProvider();
  TextEditingController? oldPasswordController;
  TextEditingController? newPasswordController;
  TextEditingController? confirmPasswordController;
  late bool oldHiddenPassword;
  late bool hiddenPassword;
  late bool hiddenPasswordConfirm;

  @override
  void initState() {
    super.initState();
    _forgotPasswordProvider = Provider.of<ForgotPasswordProvider>(context, listen: false);
    _forgotPasswordProvider.init(context: context);
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    oldHiddenPassword = true;
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
                    TextView.size14Text("Old Password",
                        color: AppColors.blackTextColor,
                        fontFamily: Assets.raleWayMedium,
                        fontWeight: FontWeight.w500,
                        lines: 1),
                    SizedBox(height: getHeight() * 0.01),
                    CommonWidgets.textFieldPassword(
                        textEditingController: oldPasswordController,
                        hint: "Enter Old Password",
                        hidePassword: oldHiddenPassword,
                        clickIcon: clickIconOld),
                    SizedBox(height: getHeight() * 0.04),
                    // _forgotPasswordComponents.highlightForgotPasswordText(text: "Strong Password"),
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
                    SizedBox(height: getHeight() * 0.04),
                    // _forgotPasswordComponents.highlightForgotPasswordText(text: "Strong Password"),
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
                    SizedBox(height: getHeight() * 0.04),
                    // _forgotPasswordComponents.highlightForgotPasswordText(text: "Password Match"),
                    SizedBox(height: getHeight() * 0.06),
                    CommonWidgets.getButton(
                        onPress: () {
                          clickOnButton(context);
                        },
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

  void clickOnButton(BuildContext context) async {
    await callChangePasswordApi(
        oldPassword: oldPasswordController!.text.trim(),
        newPassword: newPasswordController!.text.trim(),
        confirmPassword: confirmPasswordController!.text.trim());
  }

  Future<void> callChangePasswordApi(
      {@required String? oldPassword, @required String? newPassword, @required String? confirmPassword}) async {
    if (oldPassword != null && newPassword != null && confirmPassword != null) {
      if (oldPassword.isNotEmpty && newPassword.isNotEmpty && confirmPassword.isNotEmpty && newPassword == confirmPassword) {
        _forgotPasswordProvider.changePasswordApi(oldPassword: oldPassword, newPassword: newPassword);
      } else if (oldPassword.isEmpty && newPassword.isEmpty && confirmPassword.isEmpty) {
        Toasts.getErrorToast(text: "Passwords missing");
      } else if (oldPassword.isEmpty) {
        Toasts.getErrorToast(text: "Old password missing");
      } else if (newPassword.isEmpty) {
        Toasts.getErrorToast(text: "New password missing");
      } else if (confirmPassword.isEmpty) {
        Toasts.getErrorToast(text: "Confirm password missing");
      } else if (newPassword != confirmPassword) {
        Toasts.getErrorToast(text: "Password does not match");
      }
    } else {
      Toasts.getErrorToast(text: "Invalid password");
    }
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
  void clickIconOld() {
    setState(() {
      oldHiddenPassword = !oldHiddenPassword;
    });
  }
}
