import 'package:flutter/material.dart';
import 'package:we_skool_app/network/models.dart';
import 'package:we_skool_app/res/loader.dart';
import 'package:we_skool_app/models/login_model.dart';
import 'package:we_skool_app/network/API.dart';
import 'package:we_skool_app/network/api_url.dart';
import 'package:we_skool_app/res/toasts.dart';
import 'package:we_skool_app/screens/bottomTab/bottom_tab.dart';
import '../../animations/slide_right.dart';
import 'package:we_skool_app/common/utils.dart';

class SignInProvider extends ChangeNotifier {
  BuildContext? context;
  final Loader _loader = Loader();
  LoginResponse loginResponse = LoginResponse();
  bool isDataFetched = false;

  init({required BuildContext context}) async {
    isDataFetched = false;
    this.context = context;
  }

  Future<void> loginApi({
    required String email,
    required String password
  }) async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "Email": email,
        "Password": password,
        "DeviceId" : 12345
      };
      loginResponse = await MyApi.callPostApi(
        url: loginApiUrl,
        myHeaders: header,
        body: body,
        modelName: Models.loginModel,
      );
      if (loginResponse != null) {
        isDataFetched = true;
        _loader.hideLoader(context!);
        Toasts.getSuccessToast(text: "Login Successful");
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
