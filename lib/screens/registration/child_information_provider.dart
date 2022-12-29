import 'package:flutter/cupertino.dart';
import 'package:we_skool_app/common/utils.dart';
import 'package:we_skool_app/models/member/look_ups/cities_response.dart';
import 'package:we_skool_app/models/member/look_ups/countries_response.dart';
import 'package:we_skool_app/models/member/look_ups/states_response.dart';
import 'package:we_skool_app/res/strings.dart';
import 'package:we_skool_app/network/API.dart';
import 'package:we_skool_app/network/api_url.dart';
import 'package:we_skool_app/network/models.dart';
import 'package:we_skool_app/models/member/daily_schedule_response.dart';

class ChildInformationProvider extends ChangeNotifier {
  BuildContext? context;
  CountriesResponse countriesResponse = CountriesResponse();
  StatesResponse statesResponse = StatesResponse.empty();
  CitiesResponse citiesResponse = CitiesResponse.empty();
  bool isDataFetch = false;
  List<dynamic> statesList = [];
  List<dynamic> citiesList = [];

  init({required BuildContext context}) async {
    statesList = [];
    citiesList = [];
    // isDataFetch = false;
    this.context = context;
    countriesApiHit();
  }

  Future<void> countriesApiHit() async {
    try {
      isDataFetch = false;
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      countriesResponse = await MyApi.callGetApi(
        url: countriesApiUrl,
        myHeaders: header,
        modelName: Models.countriesModel,
      );
      isDataFetch = true;
      print('Countries Fetch Success');
      notifyListeners();
    }
    catch(ex){
      print("Countries:$ex");
    }
  }

  Future<void> stateApiHit({required String countryId}) async {
    try {
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> params = {
        "countryId": countryId,
      };
      statesResponse = await MyApi.callGetApi(
        url: statesApiUrl,
        myHeaders: header,
        parameters: params,
        modelName: Models.statesModel,
      );
      statesList = statesResponse.data!.states!;
      print('States Fetch Success');
      notifyListeners();
    }
    catch(ex){
      print("States:$ex");
    }
  }

  Future<void> cityApiHit({required String stateId}) async {
    try {
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> params = {
        "stateId": stateId,
      };
      citiesResponse = await MyApi.callGetApi(
        url: cityApiUrl,
        myHeaders: header,
        parameters: params,
        modelName: Models.citiesModel,
      );
      citiesList = citiesResponse.data!.cities!;
      print('Cities Fetch Success');
      notifyListeners();
    }
    catch(ex){
      print("Cities:$ex");
    }
  }
}