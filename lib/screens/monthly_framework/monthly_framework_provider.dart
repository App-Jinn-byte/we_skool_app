import 'package:flutter/cupertino.dart';
import 'package:we_skool_app/common/utils.dart';
import 'package:we_skool_app/models/member/monthly_framework_response.dart';
import 'package:we_skool_app/res/strings.dart';
import 'package:we_skool_app/network/API.dart';
import 'package:we_skool_app/network/api_url.dart';
import 'package:we_skool_app/network/models.dart';

class MonthlyFrameworkProvider extends ChangeNotifier {
  BuildContext? context;
  MonthlyFrameworkResponse monthlyFrameworkResponse = MonthlyFrameworkResponse();
  bool isDataFetch = false;

  init({required BuildContext context}) async {
    isDataFetch = false;
    this.context = context;
    getMonthlyFrameworkApi();
  }

  Future getMonthlyFrameworkApi() async {
    try {
      int? userId = PreferenceUtils.getInt(Strings.userId);
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> params = {
        "userId": userId,
      };

      monthlyFrameworkResponse = await MyApi.callGetApi(
        url: '$monthlyFrameworkApiUrl$userId',
        myHeaders: header,
        modelName: Models.monthlyFrameworkModel,
      );

      if (monthlyFrameworkResponse != null) {
        debugPrint("getCheckListResponse : ${monthlyFrameworkResponse.message}");
        print('MonthlyFrameworkResponse Api Success');
        isDataFetch= true;
      }
      notifyListeners();
    } catch (e) {
      debugPrint("monthlyFrameworkResponse Api : ${e.toString()}");
    }
  }
}