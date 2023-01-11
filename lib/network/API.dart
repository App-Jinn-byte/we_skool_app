import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:we_skool_app/network/models.dart';
import 'package:we_skool_app/res/toasts.dart';
import 'package:we_skool_app/res/strings.dart';
import 'package:we_skool_app/models/error_model.dart';
import 'package:we_skool_app/common/utils.dart';
import 'package:we_skool_app/res/refresh_token.dart';

class MyApi {
  static Future<dynamic> callPostApi(
      {String? url,
        dynamic body,
        Map<String, dynamic>? parameters,
        Map<String, dynamic>? myHeaders,
        dynamic modelName}) async {
    try {
      var dio = Dio();
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        Map<String, dynamic> header = {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${PreferenceUtils.getString(Strings.token)}'
        };
        Response response = await dio.post(url!,
            options: Options(headers: header),
            data: body,
            queryParameters: parameters);
        switch (response.statusCode) {
          case 200:
            dynamic modelObj =
            await Models.getModelObject(modelName, response.data);
            // if (modelObj.code == 1) {
            //   return modelObj;
            // } else {
            //   Toasts.getErrorToast(text: modelObj.message);
            // }
            // return null;
            return modelObj;

          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.noInternetError);
        return null;
      }
    } on DioError catch (ex) {
      if (ex.response != null) {
        ErrorResponse errorResponse =
        await Models.getModelObject(Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          case 401:
            if(errorResponse.message == "Authorization has been denied for this request."){
              dynamic modelobj;
              await RefreshToken().onRefreshTokenApi().
              then((value) async{
                if(value) {
                  Map<String, dynamic> header = {
                    "Content-Type": "application/json",
                    'Authorization': PreferenceUtils.getString(Strings.token)
                  };
                  modelobj = await callPostApi(
                      parameters: parameters,
                      modelName: modelName,
                      body: body,
                      url: url,
                      myHeaders: header
                  );
                  return modelobj;
                }
              });
              return modelobj;
            }
            else {
              Toasts.getErrorToast(text: errorResponse.data?.message);
              return null;
            }
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception catch (ex) {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return null;
    }
  }

  static Future<dynamic> callPatchApi(
      {String? url,
        dynamic body,
        Map<String, dynamic>? parameters,
        Map<String, dynamic>? myHeaders,
        dynamic modelName}) async {
    try {
      var dio = Dio();
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        Response response = await dio.patch(url!,
            options: Options(headers: myHeaders),
            data: body,
            queryParameters: parameters);
        switch (response.statusCode) {
          case 200:
            dynamic modelObj =
            await Models.getModelObject(modelName, response.data);
            // if (modelObj.code == 1) {
            //   return modelObj;
            // } else {
            //   Toasts.getErrorToast(text: modelObj.message);
            // }
            // return null;
            return modelObj;

          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.noInternetError);
        return null;
      }
    } on DioError catch (ex) {
      if (ex.response != null) {
        ErrorResponse errorResponse =
        await Models.getModelObject(Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          case 401:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception catch (ex) {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return null;
    }
  }

  static Future<dynamic> callGetApi(
      {String? url,
        Map<String, dynamic>? parameters,
        Map<String, dynamic>? myHeaders,
        dynamic modelName}) async {
    try {
      var dio = Dio();
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        Map<String, dynamic> header = {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${PreferenceUtils.getString(Strings.token)}'
        };
        Response response = await dio.get(url!,
            options: Options(headers: header), queryParameters: parameters);
        switch (response.statusCode) {
          case 200:
            print('Case 200 Come');
            dynamic getModelObj =
            await Models.getModelObject(modelName, response.data);
            // if (getModelObj.code == 1) {
            //   return getModelObj;
            // } else {
            //   Toasts.getErrorToast(text: getModelObj.message);
            // }
            // return null;
            return getModelObj;

          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: "No internet");
        return null;
      }
    } on DioError catch (ex) {
      if (ex.response != null) {
        ErrorResponse errorResponse =
        await Models.getModelObject(Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return;
          case 401:
            if(errorResponse.message == "Authorization has been denied for this request."){
              dynamic modelobj;
              await RefreshToken().onRefreshTokenApi().
              then((value) async{
                if(value) {
                  Map<String, dynamic> header = {
                    "Content-Type": "application/json",
                    'Authorization': PreferenceUtils.getString(Strings.token)
                  };
                  modelobj = await callGetApi(
                      parameters: parameters,
                      modelName: modelName,
                      url: url,
                      myHeaders: header
                  );
                  return modelobj;
                }
              });
              return modelobj;
            }
            else {
              Toasts.getErrorToast(text: errorResponse.data?.message);
              return;
            }
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception catch (ex) {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return;
    }
  }

  static Future<dynamic> callPutApi(
      {String? url,
        dynamic body,
        Map<String, dynamic>? parameters,
        Map<String, dynamic>? myHeaders,
        dynamic modelName}) async {
    try {
      var dio = Dio();
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        Response response = await dio.put(url!,
            options: Options(headers: myHeaders),
            data: body,
            queryParameters: parameters);
        switch (response.statusCode) {
          case 200:
            dynamic modelObj =
            await Models.getModelObject(modelName, response.data);
            // if (modelObj.code == 1) {
            //   return modelObj;
            // } else {
            //   Toasts.getErrorToast(text: modelObj.message);
            // }
            // return null;
            return modelObj;

          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.noInternetError);
        return null;
      }
    } on DioError catch (ex) {
      if (ex.response != null) {
        ErrorResponse errorResponse =
        await Models.getModelObject(Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          case 401:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception catch (ex) {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return null;
    }
  }
}
