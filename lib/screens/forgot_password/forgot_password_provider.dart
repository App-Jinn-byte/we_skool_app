import 'package:flutter/material.dart';
import 'package:we_skool_app/models/common_model.dart';
import 'package:we_skool_app/network/models.dart';
import 'package:we_skool_app/res/loader.dart';
import 'package:we_skool_app/network/API.dart';
import 'package:we_skool_app/network/api_url.dart';
import 'package:we_skool_app/res/toasts.dart';
import 'package:we_skool_app/common/utils.dart';
import 'package:we_skool_app/res/strings.dart';
import 'package:we_skool_app/animations/slide_right.dart';
import 'package:we_skool_app/screens/bottomTab/bottom_tab.dart';

import '../../models/login_model.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  BuildContext? context;
  final Loader _loader = Loader();
  CommonResponse _commonResponse = CommonResponse();
  LoginResponse loginResponse = LoginResponse();
  bool isDataFetched = false;
  bool isPasswordChanged = false;

  init({required BuildContext context, bool? checkAnswer, int? lessonId}) async {
    isDataFetched = false;
    isPasswordChanged = false;
    this.context = context;
  }

  Future<void> forgotPasswordApi({
    required String email,
  }) async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> params = {"email": email};

      _commonResponse = await MyApi.callPostApi(
        url: forgotPasswordApiUrl,
        myHeaders: header,
        parameters: params,
        modelName: Models.commonModel,
      );
      if (_commonResponse != null) {
        isDataFetched = true;
        _loader.hideLoader(context!);
        Toasts.getSuccessToast(text: _commonResponse.data!.message);
      }

    }
    catch (e) {
      debugPrint("Catch-Error: ${e.toString()}");
    }
    _loader.hideLoader(context!);
  }

  Future<void> callForgotPasswordApi(
      {@required String? email}) async {
    if (email != null) {
      if (email.isNotEmpty) {
        forgotPasswordApi(email: email);
      }  else if (email.isEmpty) {
        Toasts.getErrorToast(text: "Email Missing");
      }
    } else {
      Toasts.getErrorToast(text: "Invalid email");
    }
  }

  Future<void> changePasswordApi({
    @required String? oldPassword,
    @required String? newPassword,
  }) async {
    try {
      int userId = PreferenceUtils.getInt(Strings.userId);
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "UserId": userId,
        "OldPassword": oldPassword,
        "NewPassword": newPassword
      };

      loginResponse = await MyApi.callPostApi(
        url: changePasswordApiUrl,
        myHeaders: header,
        body: body,
        modelName: Models.loginModel,
      );
      if (loginResponse != null) {
        isPasswordChanged = true;
        _loader.hideLoader(context!);
        Toasts.getSuccessToast(text: "Password Changed Successfully");
        PreferenceUtils.setLoginResponse(loginResponse).then((value) {
          Navigator.pushAndRemoveUntil(
              context!,
              SlideRightRoute(page: const BottomTab(pageIndex: 0)),
                  (Route<dynamic> route) => false);
        });
      }
      else {
        _loader.hideLoader(context!);
      }

    }
    catch (e) {
      _loader.hideLoader(context!);
      debugPrint("Catch-Error: ${e.toString()}");
    }
  }

}
