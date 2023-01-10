import 'package:flutter/material.dart';
import 'package:we_skool_app/models/common_model.dart';
import 'package:we_skool_app/network/models.dart';
import 'package:we_skool_app/res/loader.dart';
import 'package:we_skool_app/models/login_model.dart';
import 'package:we_skool_app/network/API.dart';
import 'package:we_skool_app/network/api_url.dart';
import 'package:we_skool_app/res/toasts.dart';
import 'package:we_skool_app/screens/bottomTab/bottom_tab.dart';
import 'package:we_skool_app/common/utils.dart';
import 'package:we_skool_app/res/strings.dart';


class DailyObservationProvider extends ChangeNotifier {
  BuildContext? context;
  final Loader _loader = Loader();
  CommonResponse _commonResponse = CommonResponse();
  bool isObservationDone = false;
  bool isNotesDone = false;

  init({required BuildContext context}) async {
    isObservationDone = false;
    isNotesDone = false;
    this.context = context;
  }

  Future<void> addDailyObservationApi({
    required String date,
    required String nameOfActivity,
    required String materialsPresentedBy,
    required String quotesAndQuestions,
    required String additionalNotes,
    required bool isSubmit,
  }) async {
    try {
      _loader.showLoader(context: context);
      int? userId = PreferenceUtils.getInt(Strings.userId);
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "MemberId" : userId,
        "Date": date,
        "Name": nameOfActivity,
        "Engagement": materialsPresentedBy,
        "QuotesAndQuestions": quotesAndQuestions,
        "Additional": additionalNotes,
        "IsSubmitted": isSubmit
      };
      print(body);
      _commonResponse = await MyApi.callPostApi(
        url: addDailyObservationApiUrl,
        body: body,
        modelName: Models.commonModel,
      );
      if (_commonResponse != null) {
        isObservationDone = true;
        _loader.hideLoader(context!);
        Toasts.getSuccessToast(text: _commonResponse.data!.message);
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

  Future<void> addDailyNotesApi({
    required String date,
    required String sleepSession,
    required String meals,
    required String diaper,
    required String medications,
    required String additional,
  }) async {
    try {
      _loader.showLoader(context: context);
      int? userId = PreferenceUtils.getInt(Strings.userId);
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "UserId" : userId,
        "Date" : date,
        "DailyTaskDetails" : [
          {
            "TaskTypeId" : 1,
            "Description" : sleepSession
          },
          {
            "TaskTypeId" : 2,
            "Description" : meals
          },
          {
            "TaskTypeId" : 3,
            "Description" : diaper
          },
          {
            "TaskTypeId" : 4,
            "Description" : medications
          },
          {
            "TaskTypeId" : 5,
            "Description" : additional
          }
        ]
      };
      print(body);
      _commonResponse = await MyApi.callPostApi(
        url: addDailyNotesApiUrl,
        myHeaders: header,
        body: body,
        modelName: Models.commonModel,
      );
      if (_commonResponse != null) {
        isNotesDone = true;
        _loader.hideLoader(context!);
        Toasts.getSuccessToast(text: _commonResponse.data!.message);
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
