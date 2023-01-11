import 'package:we_skool_app/models/login_model.dart';
import 'package:we_skool_app/common/utils.dart';
import 'package:we_skool_app/res/strings.dart';
import 'package:we_skool_app/network/API.dart';
import 'package:we_skool_app/network/api_url.dart';
import 'package:we_skool_app/network/models.dart';

class RefreshToken{
  LoginResponse loginResponse = LoginResponse();
  Future<bool> onRefreshTokenApi() async {
    try {
      String? email = PreferenceUtils.getString(Strings.email);
      String? password = PreferenceUtils.getString(Strings.password);
      String? deviceId = PreferenceUtils.getString(Strings.deviceId);
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "email": email,
        "password": password,
        "deviceId": deviceId
      };
      loginResponse = await MyApi.callPostApi(
        url: loginApiUrl,
        body: body,
        myHeaders: header,
        modelName: Models.loginModel,
      );
      PreferenceUtils.setString(Strings.token, loginResponse.data!.token ?? "");
      return true;
    } catch (e) {
      return false;
    }
  }
}