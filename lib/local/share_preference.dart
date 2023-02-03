import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  late SharedPreferences _prefs;

  Future<void> getSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setPrefAccessToken(String accessToken) async {
    await getSharedPreferences();
    _prefs.setString("accessToken", accessToken);
  }

  Future<String> getPrefAccessToken() async {
    await getSharedPreferences();
    return _prefs.getString("accessToken")!;
  }
}
