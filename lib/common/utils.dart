import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_skool_app/models/login_model.dart';
import '../res/strings.dart';

class PreferenceUtils {
  static String? userImage;
  var time = DateTime;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String? getString(String key, [String? defValue]) {
    if (PreferenceUtils._prefsInstance != null) {
      return _prefsInstance?.getString(key) ?? defValue ?? "";
    }
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;

    return prefs.setString(key, value); //?? Future.value(null);
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value); //?? Future.value(null);
  }

  static bool getBool(String key, [bool? defValue]) {
    return _prefsInstance?.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;

    return prefs.setInt(key, value); //?? Future.value(null);
  }

  static int getInt(String key, [int? defValue]) {
    return _prefsInstance?.getInt(key) ?? defValue ?? 0;
  }

  static Future setUploadImage(uploadProfilePictureResponse) async {
    PreferenceUtils.setString(
        Strings.filePath, uploadProfilePictureResponse.data!.message!);
  }

  static setUserImage(String? image) {
    PreferenceUtils.setString(Strings.userImageKey, image!);
  }

  static String? getUserImage() {
    userImage = PreferenceUtils.getString(Strings.userImageKey)!;
    return userImage;
  }

  static Future setLoginResponse(LoginResponse loginResponse) async{

    PreferenceUtils.setInt(Strings.userId, loginResponse.data!.user!.userId ?? 0);
    PreferenceUtils.setString(Strings.fullName, loginResponse.data!.user!.name ?? "");
    PreferenceUtils.setString(Strings.email, loginResponse.data!.user!.email ?? "");
    PreferenceUtils.setString(Strings.password, loginResponse.data!.user!.password ?? "");
    PreferenceUtils.setString(Strings.userType, loginResponse.data!.user!.userType ?? "");
    PreferenceUtils.setString(Strings.profilePicture, loginResponse.data!.user!.profilePicture ?? "");

  }

  static clearPreferences() {
    _prefsInstance?.clear();
  }
}
