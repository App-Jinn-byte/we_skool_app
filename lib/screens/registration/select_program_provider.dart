import 'package:flutter/cupertino.dart';
import 'package:we_skool_app/models/common_model.dart';
import 'package:we_skool_app/models/member/look_ups/programs_response.dart';
import 'package:we_skool_app/network/API.dart';
import 'package:we_skool_app/network/api_url.dart';
import 'package:we_skool_app/network/models.dart';
import 'package:we_skool_app/res/loader.dart';
import 'package:we_skool_app/res/toasts.dart';
import 'package:we_skool_app/screens/sign_in/sign_in.dart';

import '../../animations/slide_right.dart';


class SelectProgramProvider extends ChangeNotifier {
  BuildContext? context;
  final Loader _loader = Loader();
  bool isDataFetch = false;
  bool isRegistrationSuccess = false;
  ProgramsListResponse programsListResponse = ProgramsListResponse();
  CommonResponse _commonResponse = CommonResponse();
  List<dynamic> programsList = [];

  init({required BuildContext context}) async {
    programsList = [];
    isRegistrationSuccess = false;
    this.context = context;
    programsApiHit();
  }

  Future<void> programsApiHit() async {
    try {
      isDataFetch = false;
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      programsListResponse = await MyApi.callGetApi(
        url: programsApiUrl,
        myHeaders: header,
        modelName: Models.programsModel,
      );
      isDataFetch = true;
      programsList = programsListResponse.data!.programs!;
      print('Programs Fetch Success');
      notifyListeners();
    }
    catch(ex){
      print("Countries:$ex");
    }
  }

  Future<void> memberRegisterApi({
    @required String? childFirstName,
    @required String? childLastName,
    @required String? childDOB,
    @required String? countryId,
    @required String? stateId,
    @required String? cityId,
    @required String? address,
    @required String? gender,
    @required String? firstNameParent1,
    @required String? lastNameParent1,
    @required String? relationshipParent1,
    @required String? emailParent1,
    @required String? phoneParent1,
    @required String? firstNameParent2,
    @required String? lastNameParent2,
    @required String? relationshipParent2,
    @required String? emailParent2,
    @required String? phoneParent2,
    @required String? addressParent2,
    @required String? countryIdParent2,
    @required String? stateIdParent2,
    @required String? cityIdParent2,
    @required String? programId,
  }) async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "FirstName": childFirstName,
        "LastName": childLastName,
        "DOB": childDOB,
        "CountryId": countryId,
        "StateId": stateId,
        "CityId": cityId,
        "Address": address,

        "MemberInfos ": [
          {
            "Gender": gender
          }
        ],
        "MemberParentInfoes": [
          {
            "FirstName": firstNameParent1,
            "LastName": lastNameParent1,
            "Relationship": relationshipParent1,
            "Email": emailParent1,
            // "Profession": "BusinessMan",
            "Cell": phoneParent1,
            "Address": address,
            "CountryId": countryId,
            "StateId": stateId,
            "CityId": cityId
          },
          {
            "FirstName": firstNameParent2,
            "LastName": lastNameParent2,
            "Relationship": relationshipParent2,
            "Email": emailParent2,
            // "Profession": null,
            "Cell": phoneParent2,
            "Address": addressParent2,
            "CountryId": countryIdParent2,
            "StateId": stateIdParent2,
            "CityId":cityIdParent2
          }
        ],
        "MemberAdditionalInfoes": [
          {
            "ProgramId": programId
          }
        ]
      };
      print(body);
      _commonResponse = await MyApi.callPostApi(
        url: memberRegisterApiUrl,
        myHeaders: header,
        body: body,
        modelName: Models.commonModel,
      );
      if (_commonResponse != null) {
        isRegistrationSuccess = true;
        _loader.hideLoader(context!);
        Toasts.getSuccessToast(text: _commonResponse.data!.message);
        Navigator.pushAndRemoveUntil(
            context!,
            SlideRightRoute(page: const SignIn()),
                (Route<dynamic> route) => false);
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