import 'package:flutter/cupertino.dart';
import 'package:we_skool_app/common/utils.dart';
import 'package:we_skool_app/models/member/monthly_framework_response.dart';
import 'package:we_skool_app/res/strings.dart';
import 'package:we_skool_app/network/API.dart';
import 'package:we_skool_app/network/api_url.dart';
import 'package:we_skool_app/network/models.dart';
import 'package:we_skool_app/screens/monthly_framework/list_intro.dart';

class MonthlyFrameworkProvider extends ChangeNotifier {
  BuildContext? context;
  MonthlyFrameworkResponse monthlyFrameworkResponse = MonthlyFrameworkResponse();
  IntroModelList introModelList = IntroModelList();
  bool isDataFetch = false;
  List<dynamic> descriptionList = [];
  List<dynamic> headingList = ['Introduction', "Vocabulary", "Materials", "Books", "Songs to sing",];

  init({required BuildContext context}) async {
    isDataFetch = false;
    descriptionList = [];
    this.context = context;
    getMonthlyFrameworkApi();
  }

  Future getMonthlyFrameworkApi() async {
    try {
      int? userId = PreferenceUtils.getInt(Strings.userId);
      Map<String, dynamic> header = {"Content-Type": "application/json"};

      monthlyFrameworkResponse = await MyApi.callGetApi(
        url: '$monthlyFrameworkApiUrl$userId',
        myHeaders: header,
        modelName: Models.monthlyFrameworkModel,
      );

      if (monthlyFrameworkResponse != null) {
        debugPrint("getCheckListResponse : ${monthlyFrameworkResponse.message}");
        print('MonthlyFrameworkResponse Api Success');
        descriptionList = [
          monthlyFrameworkResponse.data!.monthlyFramework![0].introduction!,
          monthlyFrameworkResponse.data!.monthlyFramework![0].vocabulary!,
          monthlyFrameworkResponse.data!.monthlyFramework![0].materials!,
          monthlyFrameworkResponse.data!.monthlyFramework![0].books!,
          monthlyFrameworkResponse.data!.monthlyFramework![0].songsToSing!,
        ];
        Map<String, dynamic> body = {
          "Data": combineList(headingList, descriptionList)
        };
        introModelList = IntroModelList.fromJson(body);
        isDataFetch= true;
        // sliderList = [{
        //   "heading": "Introduction",
        //   "description": monthlyFrameworkResponse.data!.monthlyFramework![0].introduction!,
        //   },
        //   {
        //     "heading": "Vocabulary",
        //     "description": monthlyFrameworkResponse.data!.monthlyFramework![0].vocabulary!
        //   },
        //   {
        //     "heading": "Materials",
        //     "description": monthlyFrameworkResponse.data!.monthlyFramework![0].materials!
        //   },
        //   {
        //     "heading": "Books",
        //     "description": monthlyFrameworkResponse.data!.monthlyFramework![0].books!
        //   },
        //   {
        //     "heading": "Songs to sing",
        //     "description": monthlyFrameworkResponse.data!.monthlyFramework![0].songsToSing!
        //   }
        // ];
      }
      notifyListeners();
    }
    catch (e) {
      debugPrint("monthlyFrameworkResponse Api : ${e.toString()}");
    }
  }

  List combineList(List<dynamic> headingList, List<dynamic> descriptionList) {
    List finalList = [];
    for (int i=0; i < headingList.length; i ++) {
      finalList.add(FaqData(heading: headingList[i], description: descriptionList[i]).toJson());
    }
    print('>>>>>>>>>>> $finalList');
    return finalList;
  }
}

class FaqData {
  final String heading;
  final String description;

  FaqData({
    required this.heading,
    required this.description,
  });
  Map<String, dynamic> toJson() => {
    'heading': heading,
    'description': description,
  };
}