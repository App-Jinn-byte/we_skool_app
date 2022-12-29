import 'package:we_skool_app/models/error_model.dart';
import 'package:we_skool_app/models/login_model.dart';
import 'package:we_skool_app/models/common_model.dart';
import 'package:we_skool_app/models/member/daily_schedule_response.dart';
import 'package:we_skool_app/models/member/look_ups/countries_response.dart';
import 'package:we_skool_app/models/member/look_ups/states_response.dart';
import 'package:we_skool_app/models/member/look_ups/cities_response.dart';



class Models {
  static const String errorModel = "ERROR_MODEL";
  static const String loginModel = "LOGIN_MODEL";
  static const String commonModel = "COMMON_MODEL";
  static const String dailyScheduleModel = "DAILY_SCHEDULE_MODEL";
  static const String countriesModel = "COUNTRIES_MODEL";
  static const String statesModel = "STATES_MODEL";
  static const String citiesModel = "CITIES_MODEL";


  static Future<dynamic> getModelObject(
      String modelName, Map<String, dynamic> json) async {
    switch (modelName) {
      case errorModel:
        return ErrorResponse.fromJson(json);
      case loginModel:
        return LoginResponse.fromJson(json);
      case commonModel:
        return CommonResponse.fromJson(json);
      case dailyScheduleModel:
        return DailyScheduleResponse.fromJson(json);
      case countriesModel:
        return CountriesResponse.fromJson(json);
      case statesModel:
        return StatesResponse.fromJson(json);
      case citiesModel:
        return CitiesResponse.fromJson(json);

    }
  }
}
