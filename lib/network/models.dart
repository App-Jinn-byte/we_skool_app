import 'package:we_skool_app/models/error_model.dart';
import 'package:we_skool_app/models/login_model.dart';
import 'package:we_skool_app/models/common_model.dart';

class Models {
  static const String errorModel = "ERROR_MODEL";
  static const String loginModel = "LOGIN_MODEL";
  static const String commonModel = "COMMON_MODEL";


  static Future<dynamic> getModelObject(
      String modelName, Map<String, dynamic> json) async {
    switch (modelName) {
      case errorModel:
        return ErrorResponse.fromJson(json);
      case loginModel:
        return LoginResponse.fromJson(json);
      case commonModel:
        return CommonResponse.fromJson(json);

    }
  }
}
