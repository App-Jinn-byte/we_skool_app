import 'package:flutter/cupertino.dart';
import 'package:we_skool_app/common/utils.dart';
import 'package:we_skool_app/res/strings.dart';
import 'package:we_skool_app/network/API.dart';
import 'package:we_skool_app/network/api_url.dart';
import 'package:we_skool_app/network/models.dart';
import 'package:we_skool_app/models/member/daily_schedule_response.dart';

class RegistrationProvider extends ChangeNotifier {
  BuildContext? context;
  DailyScheduleResponse dailyScheduleResponse = DailyScheduleResponse();
  bool isDataFetch = false;

  init({required BuildContext context}) async {
    isDataFetch = false;
    this.context = context;
    getDailyScheduleApi();
  }

  Future getDailyScheduleApi() async {
    try {
      int? userId = PreferenceUtils.getInt(Strings.userId);
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> params = {
        "userId": userId,
      };

      dailyScheduleResponse = await MyApi.callGetApi(
        url: dailyScheduleApiUrl,
        myHeaders: header,
        parameters: params,
        modelName: Models.dailyScheduleModel,
      );

      if (dailyScheduleResponse.code != null) {
        debugPrint("getCheckListResponse : ${dailyScheduleResponse.message}");
        print('Daily Schedule Api Success');
        isDataFetch= true;
      }
      notifyListeners();
    } catch (e) {
      debugPrint("DailyScheduleResponse Api : ${e.toString()}");
    }
  }
}