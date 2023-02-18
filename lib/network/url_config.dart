import '../data_base/session_manager.dart';

enum Environment { development, staging, qa, production }

class UrlConfig {
  static const String CORE_KEY = "core";
  static const String ZERO_KEY = "zero";
  static Environment environment = Environment.development;

  static bool get isProdEnvironment => environment == Environment.production;

  static const ENV_DEVELOPMENT = "development";
  static const ENV_STAGING = "staging";
  static const ENV_PRODUCTION = "production";

  static Map<String, String> _baseUrlMap = {
    "${ENV_PRODUCTION}_$CORE_KEY": "https://api.kobo360.com/",
    "${ZERO_KEY}_${ENV_PRODUCTION}_$CORE_KEY": "https://zero.api.kobo360.com/",
    "${ENV_STAGING}_$CORE_KEY": "https://stage.api.kobo360.com/",
    "${ZERO_KEY}_${ENV_STAGING}_$CORE_KEY": "https://stage.api.kobo360.com/",
    "${ENV_DEVELOPMENT}_$CORE_KEY": "https://dev.api.kobo360.com/",
    "${ZERO_KEY}_${ENV_DEVELOPMENT}_$CORE_KEY": "https://dev.api.kobo360.com/",
  };

  static String? _getBaseUrl(String key) {
    switch (environment) {
      case Environment.staging:
        key = "${ENV_STAGING}_$key";
        break;
      case Environment.qa:
        // TODO: Handle this case.
        break;
      case Environment.production:
        key = "${ENV_PRODUCTION}_$key";
        break;
      case Environment.development:
      default:
        key = "${ENV_DEVELOPMENT}_$key";
        break;
    }
    if (SessionManager.instance.zeroRated) {
      key = "${ZERO_KEY}_$key";
    }
    return _baseUrlMap[key];
  }

  static final coreBaseUrl = _getBaseUrl(CORE_KEY);
}
