import '../network/url_config.dart';

class AppConfig {
  static final BASE_URL = UrlConfig.coreBaseUrl;
  static final String revalidateTokenUrl = "${BASE_URL}user/refreshToken";
}
