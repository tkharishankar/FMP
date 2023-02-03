import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  Future<void> setPrefAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("accessToken", accessToken);
  }

  Future<String?> getPrefAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("accessToken");
  }
}
