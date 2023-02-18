import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  SharedPreferences? sharedPreferences;

  SessionManager._internal();

  static SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  static SessionManager get instance => _instance;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String KEY_ZERO_RATED = "zero_rated";

  bool get zeroRated => sharedPreferences?.getBool(KEY_ZERO_RATED) ?? false;

  String get authToken => sharedPreferences?.getString(KEY_AUTH_TOKEN) ?? '';
  static const String KEY_AUTH_TOKEN = 'auth_token';
  static const String KEY_APP_TOKEN = 'app_token';
  static const String KEY_LANGUAGE_CODE = 'language_code';
  static const String KEY_COUNTRY = 'country';

  String get languageCode =>
      sharedPreferences?.getString(KEY_LANGUAGE_CODE) ?? 'en';

  set languageCode(String code) =>
      sharedPreferences?.setString(KEY_LANGUAGE_CODE, code);

  set authToken(String authToken) =>
      sharedPreferences?.setString(KEY_AUTH_TOKEN, authToken);

  set appToken(String token) =>
      sharedPreferences?.setString(KEY_APP_TOKEN, token);

  String get appToken => sharedPreferences?.getString(KEY_APP_TOKEN) ?? '';

  String get country => sharedPreferences?.getString(KEY_COUNTRY) ?? 'Nigeria';
}
