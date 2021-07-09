import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static String sharedPreferenceUserLoggenInKey = 'ISLOGGEDIN';
  static String sharedPreferenceUsernameKey = 'USERNAMEKEY';
  static String sharedPreferenceUserEmailKey = 'USEREMAILKEY';

  static Future<bool> saveUserLoggedIn(bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        sharedPreferenceUserLoggenInKey, isUserLoggedIn);
  }

  static Future<bool> saveUsername(String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUsernameKey, username);
  }

  static Future<bool> saveUserEmail(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserEmailKey, email);
  }

  static Future getData(key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.get(key);
  }
}
